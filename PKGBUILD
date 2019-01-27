# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=cli2man-git
pkgver=r81.b97126b
pkgrel=1
pkgdesc="Convert command help to mdoc(7) man pages"
url="https://github.com/tobimensch/cli2man"
license=('MIT')
arch=('any')
makedepends=('git')
depends=('python' 'python-docopt')
options=('!strip')
source=("${pkgname%-git}::git+$url")
sha256sums=(SKIP)

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	python setup.py build
}

package() {
	cd "${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -d ${pkgdir}/usr/share/{man/man1,licenses/$pkgname}
        # Generate manpage from program itself
	./cli2man ./cli2man -o "${pkgdir}/usr/share/man/man1/cli2man.1"
        # Extract license from readme
        sed -n 319,342p README.md > "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
