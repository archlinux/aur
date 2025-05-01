# Maintainer: James Bowling <kf5u AT pm DOT me>
pkgname=wsjtx-improved-widescreen
_pkgname=wsjtx
pkgver=2.8.0
pkgrel=250501
_build=250501
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X Improved by DG2YCB (Widescreen version)"
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/wsjt-x-improved/"
license=('GPL3')
depends=(
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
source=("https://downloads.sourceforge.net/project/wsjt-x-improved/WSJT-X_v$pkgver/Source%20code-widescreen/$_pkgname-${pkgver}_improved_widescreen_PLUS_${_build}.tgz")
md5sums=('53a11eacd88284f6c49d7081429e8aac')
sha1sums=('66e35bbebc524af20d23bc02455a90547af26047')
options=(!lto)
prepare() {
	tar xzf ${_pkgname}-${pkgver}_improved_widescreen_PLUS_${_build}.tgz
	mkdir -p "$srcdir"/$_pkgname-$pkgver/wsjtx-prefix/build
	cd "$srcdir"/$_pkgname-$pkgver/wsjtx-prefix
	tar xzf "$srcdir"/$_pkgname-$pkgver/src/wsjtx.tgz
}
build() {
	cd "$srcdir"/$_pkgname-$pkgver/wsjtx-prefix/build
	cmake \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
	    ../wsjtx
	make || return 1
}
package() {
	cd "$srcdir"/$_pkgname-$pkgver/wsjtx-prefix/build
	make DESTDIR=$pkgdir install
	install -Dm644 "$srcdir"/$_pkgname-$pkgver/wsjtx-prefix/wsjtx/sounds/{ContinentOnBand,Continent,CQ,CQZoneOnBand,CQZone,DXcall,DXCCOnBand,DXCC,GridOnBand,Grid,ITUZoneOnBand,ITUZone,MyCall,_Zone}.wav -t "$pkgdir"/opt/wsjtx/sounds
	rm -rf "$pkgdir/home"
}