# Maintainer: Vasya Pupkin <dvorak.dwarf@gmail.com>
pkgname=fauxnix-git
pkgver=r84.883885a
pkgrel=1
pkgdesc="Non-invasive* Reproducible* Declarative* config management for Nix non-believers"
arch=('any')
url="https://github.com/DvorakDwarf/fauxnix"
license=('GPL3')
depends=(python pacman python-ruamel-yaml)
makedepends=(git python-setuptools  python-build python-wheel python-installer)
provides=('fauxnix')
conflicts=('fauxnix')
source=("$pkgname::git+https://github.com/DvorakDwarf/fauxnix.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname"

	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"

	install -Dm644 src/fauxnix/fauxnix.yaml "${pkgdir}/etc/fauxnix.yaml"
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
	install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname}/README.md
	install -Dm755 src/fauxnix.hook $pkgdir/usr/share/libalpm/hooks/fauxnix.hook

	python -m installer --destdir="$pkgdir" dist/*.whl
}
