# Maintainer: jiahuiz <jiahuizhuo1998@gmail.com>


pkgname=x11iraf-git
pkgver=r92.8f45f2f
pkgrel=2
pkgdesc="X11/GUI development utilities and applications developed by the IRAF Project"
arch=('i686' 'x86_64')
url="https://github.com/iraf-community/x11iraf"
license=('custum')
groups=()
depends=('libxaw' 'libxmu' 'tcl' 'xaw3d' 'libxpm')
optdepends=()
makedepends=('git')
backup=()
install="${pkgname%-git}.install"

source=('git+https://github.com/iraf-community/x11iraf') 

md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	# Do not install terminfo
	sed -i "/tic/d" ./Makefile
	# Following Arch package guidelines
	sed -i "s#}/man#}/share/man#g" ./Makefile
	# Installation
	make PREFIX="$pkgdir/usr/" install
	# Copy terminfo file
	mkdir -p $pkgdir/usr/share/${pkgname%-git}
	cp $srcdir/${pkgname%-git}/xgterm/xgterm.terminfo $pkgdir/usr/share/${pkgname%-git}
	# Install licenses
	install -Dm644 $srcdir/${pkgname%-git}/LICENSES "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSES"
	install -Dm644 $srcdir/${pkgname%-git}/LICENSES-nonfree "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSES-nonfree"
	
}

