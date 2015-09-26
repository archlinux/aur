# Maintainer: Camille <onodera@rizon>

pkgname=mvwm-git
pkgver=r5713.f23f011
pkgrel=1
pkgdesc="A clean-up effort of FVWM (with rounded corner patch)"
url="https://github.com/ThomasAdam/mvwm"
arch=('i686' 'x86_64')
license=('GPL')
depends=('fribidi' 'libxrandr' 'libpng')
options=('!emptydirs' '!makeflags')
source=("$pkgname::git+https://github.com/ThomasAdam/mvwm.git" 'rounded.patch' 'mvwm.desktop')
sha1sums=('SKIP' '97a8375721ba50fba7991f590b17feb1aa7e7a61' 'd39ecd8ecdda651b99289946802abad2e0f1342a')

pkgver() {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname

	# Comment the next line to disable rounded corner patch
	patch -p0 < $startdir/rounded.patch

	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --disable-xrender --disable-xft --disable-freetypetest --disable-fontconfigtest --disable-xfttest --disable-perllib --with-x 
	 make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install
	install -D -m644 ../mvwm.desktop "$pkgdir/usr/share/xsessions/mvwm.desktop"
}
