# Maintainer: Lili1228 <aur at lili dot lgbt>
pkgname=es40-git
pkgver=0.65.r88.g7cd6fb3
pkgrel=1
pkgdesc='AlphaServer ES40 emulator'
arch=('x86_64' 'aarch64') # aarch64 not tested but there's a macOS version
url='https://github.com/ES40-Emu/es40'
license=('GPL-2.0-or-later')
depends=('libpcap' 'sdl3' # explicit
'glibc' 'libgcc' 'libstdc++' 'libx11') # implicit
makedepends=('autoconf-archive' 'git' 'libxt')
provides=('es40')
conflicts=('es40')
source=("$pkgname::git+https://github.com/ES40-Emu/es40.git")
sha512sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	CPPFLAGS+=" -I$PWD/src/emu" 
	CXXFLAGS+=' -fpermissive'
	echo $CPPFLAGS
	./autogen.sh
	./configure --prefix=/usr
	make -C src es40 es40_cfg
}

package() {
# make install compiles alternative versions
	install -Dt "$pkgdir/usr/bin" $pkgname/src/es40{,_cfg}
}
