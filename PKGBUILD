# Maintainer: James Bowling <kf5u AT pm DOT me>

pkgname=wsjtx-improved-al
_pkgname=wsjtx
pkgver=3.1.0
_build=260418
pkgrel=260418
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X Improved by DG2YCB (Alternative Layout Version)"
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
source=("https://downloads.sourceforge.net/project/wsjt-x-improved/WSJT-X_v$pkgver/Source%20code/$_pkgname-${pkgver}_improved_AL_PLUS_${_build}.tgz")
md5sums=('16fbf2d4369e2520d4b269371b58bdf4')
sha1sums=('da4157b092e4feefa32a5ff6e52801f0066e6eca')

options=(!lto)

prepare() {
    tar xzf ${_pkgname}-${pkgver}_improved_AL_PLUS_${_build}.tgz
    mkdir -p "$srcdir"/$_pkgname-$pkgver/wsjtx-prefix/build
    cd "$srcdir"/$_pkgname-$pkgver/wsjtx-prefix
    tar xzf "$srcdir"/$_pkgname-$pkgver/src/wsjtx.tgz
}

build() {
    export CFLAGS+=" -Wno-error=format-security"
    export CXXFLAGS+=" -Wno-error=format-security"
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
