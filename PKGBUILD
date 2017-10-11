# Maintainer: Lukas Spies <Lukas .dot. Spies (at) web .dot. de>
pkgname=mingw-w64-exiv2
pkgver=0.26
pkgrel=1
pkgdesc="Exif and Iptc metadata manipulation library and tools (mingw-w64)"
arch=('any')
url="http://www.exiv2.org"
license=('GPL')
makedepends=('mingw-w64-cmake' 'rsync')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-gettext' 'mingw-w64-libiconv' 'mingw-w64-expat')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://www.exiv2.org/builds/exiv2-${pkgver}-trunk.tar.gz")
md5sums=('5399e3b570d7f9205f0e76d47582da4c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {

    for _arch in ${_architectures}; do
        cd "$srcdir/exiv2-trunk/"
        mkdir -p "build-${_arch}"
        # configure doesn't work if run from directory other than where it is located
        rsync -a ./ "./build-${_arch}" --exclude 'build*'
    done

    for _arch in ${_architectures}; do

	cd "$srcdir/exiv2-trunk/build-${_arch}"

	unset LDFLAGS
	export LDFLAGS="-L/usr/${_arch}/lib"

	echo $CHOST;

	./configure --host="${_arch}" --target="${_arch}" --build="$CHOST" --prefix=/usr/${_arch} --libdir=/usr/${_arch}/lib --includedir=/usr/${_arch}/include --enable-static --disable-shared --with-expat=/usr/${_arch}/include

	make

    done

}

package() {
    for _arch in ${_architectures}; do
	cd "${srcdir}/exiv2-trunk/build-${_arch}"
        make DESTDIR="${pkgdir}" install
        ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    done
}
