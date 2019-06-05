# Maintainer: Lukas Spies <Lukas .dot. Spies (at) web .dot. de>
pkgname=mingw-w64-exiv2
pkgver=0.27.1
pkgrel=1
pkgdesc="Exif and Iptc metadata manipulation library and tools (mingw-w64)"
arch=('any')
url="http://www.exiv2.org"
license=('GPL')
makedepends=('mingw-w64-cmake' 'rsync')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-gettext' 'mingw-w64-libiconv' 'mingw-w64-expat')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/Exiv2/exiv2/archive/$pkgver.tar.gz")
md5sums=('1dabdd50018fd12a85299aeeed38c4e9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {

    for _arch in ${_architectures}; do

        cd "$srcdir/exiv2-$pkgver"

        mkdir -p "build-${_arch}"

        cd "build-${_arch}"

        unset LDFLAGS
        export LDFLAGS="-L/usr/${_arch}/lib"

        echo $CHOST;

        ${_arch}-cmake .. -DCMAKE_INSTALL_PREFIX=/usr/${_arch} -DEXIV2_BUILD_SAMPLES=OFF -DBUILD_SHARED_LIBS=OFF

        make

    done

}

package() {
    for _arch in ${_architectures}; do
	cd "$srcdir/exiv2-$pkgver/build-${_arch}"
        make DESTDIR="${pkgdir}" install
        ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    done
}
