# Maintainer: Darkpelz <lukeh@outlook.my>
# Maintainer: TheDarkBug <adrianoliviero23@gmail.com>
pkgname=uwufetch-git
pkgver=2.1.r1.g162c64c
pkgrel=1
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
arch=('any')
url="https://github.com/TheDarkBug/${pkgname/-git/}"
license=('GPL3')
makedepends=('gcc')
optdepends=("viu: Display distro logos as images"
			"lshw: Better GPU detection")
conflicts=('uwufetch')
source=("$pkgname"::'git+https://github.com/TheDarkBug/uwufetch.git')
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	sed -i "93s/build//" Makefile
	sed -i "94s/\$(ETC_DIR)/\$(DESTDIR)\/..\$(ETC_DIR)/" Makefile
	sed -i "94s/$/ \$(DESTDIR)\/include &/" Makefile
	sed -i "97s/include/include\//" Makefile
	sed -i "99s/\$(ETC_DIR)/\$(DESTDIR)\/..\$(ETC_DIR)/" Makefile
}

build() {
	cd "$srcdir/$pkgname"
	make build
}

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/usr" ETC_DIR="$pkgdir/etc" UWUFETCH_VERSION="\"aur-$pkgname $pkgver\"" install
}
