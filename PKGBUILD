# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-termscope-git
_pkgname=termscope
pkgver=r27.b531d54
pkgrel=1
pkgdesc="Live oscilloscope for serial data, in your terminal"
arch=('any')
url="https://github.com/CAOShurong/termscope"
license=('MIT')
depends=('python')
optdepends=('python-pyserial: read from real serial ports (the "serial" extra)')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'git')
checkdepends=('python-pytest')
provides=("python-termscope=0.6.0")
conflicts=("python-termscope")
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"
	PYTHONPATH="$PWD/src" python -m pytest tests -v
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
