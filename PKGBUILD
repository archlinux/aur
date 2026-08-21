# Maintainer: James Bowling <kf5u AT pm DOT me>
pkgname=wsjtx-improved
_pkgname=wsjtx
_upstream=3.2.0
_build=260818
pkgver=${_upstream}.${_build}
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X Improved by DG2YCB"
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/wsjt-x-improved/"
license=('GPL3')
depends=(
	'boost-libs'
	'fftw'
	'hamlib>=4.5'
	'libusb'
	'portaudio'
	'qt5-base'
	'qt5-multimedia'
	'qt5-serialport'
	'qt5-tools'
	'qt5-websockets'
	'readline'
)
makedepends=(
	'cmake'
	'asciidoc'
	'asciidoctor'
	'boost'
	'gcc-fortran'
	'texinfo'
)
install=wsjtx-improved.install
provides=('wsjtx')
conflicts=('wsjtx')
source=("https://downloads.sourceforge.net/project/wsjt-x-improved/WSJT-X_v$_upstream/Source%20code/$_pkgname-${_upstream}_improved_PLUS_${_build}.tgz")
md5sums=('45dce106d58c30ec0625c0e94335140b')
sha1sums=('e14ebf28c04b2f97a7e12ba04aecf5a995d2f3cd')
options=(!lto)
prepare() {
	tar xzf ${_pkgname}-${_upstream}_improved_PLUS_${_build}.tgz
	mkdir -p "$srcdir"/$_pkgname-$_upstream/wsjtx-prefix/build
	cd "$srcdir"/$_pkgname-$_upstream/wsjtx-prefix
	tar xzf "$srcdir"/$_pkgname-$_upstream/src/wsjtx.tgz
}
build() {
	export CFLAGS+=" -Wno-error=format-security"
	export CXXFLAGS+=" -Wno-error=format-security"
	cd "$srcdir"/$_pkgname-$_upstream/wsjtx-prefix/build
	cmake \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
	    ../wsjtx
	make || return 1
}
package() {
	cd "$srcdir"/$_pkgname-$_upstream/wsjtx-prefix/build
	make DESTDIR=$pkgdir install
	install -Dm644 "$srcdir"/$_pkgname-$_upstream/wsjtx-prefix/wsjtx/sounds/{ContinentOnBand,Continent,CQ,CQZoneOnBand,CQZone,DXcall,DXCCOnBand,DXCC,GridOnBand,Grid,ITUZoneOnBand,ITUZone,MyCall,_Zone}.wav -t "$pkgdir"/opt/wsjtx/sounds
	rm -rf "$pkgdir/home"
}
