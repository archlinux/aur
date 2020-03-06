# Maintainer: Julian Hurst <julian.hurst@pm.me>
pkgname=atomizer-git
pkgver=r26.dd33eb5
pkgrel=1
pkgdesc="Atom/Rss reader for the cli"
arch=('any')
url="https://git.sr.ht/~ark/atomizer"
license=('MIT')
groups=()
optdepends=(python-colorama)
depends=(python python-pyperclip)
makedepends=(git scdoc)
provides=(atomizer)
conflicts=(atomizer)
backup=("etc/atomizer/feeds" "etc/atomizer/config.ini")
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	(   set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${pkgname%-git}"
	cd docs
	make PREFIX=/usr
	cd ..
	python setup.py build
}

package() {
	cd "${pkgname%-git}"
	install -Dm 755 -t "$pkgdir"/etc/atomizer/ config/feeds
	install -Dm 755 -t "$pkgdir"/etc/atomizer/ config/config.ini
	install -Dm 755 -t "$pkgdir"/usr/share/licenses/${pkgname}/ LICENSE
	cd docs
	make PREFIX=/usr DESTDIR=$pkgdir install
	cd ..
	python setup.py install --root="$pkgdir"
}
