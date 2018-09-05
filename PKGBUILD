# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=NrrdIO
pkgname=nrrdio
pkgver=1.11.0
pkgrel=3
pkgdesc='Stand-alone library for reading and writing the NRRD file format'
arch=('x86_64')
url='http://teem.sourceforge.net/index.html'
license=('custom')
depends=()
optdepends=()
makedepends=('cmake')
source=("https://sourceforge.net/projects/teem/files/teem/${pkgver}/NrrdIO-${pkgver}-src.tar.gz/download"
        "FindNrrdIO.cmake"
		"LICENSE")
sha512sums=('3d65fcb6264a787e68d5d26eb4f9d456c59ccd6209d9c31c16130555014479e3c6d474468e5fd926a2874992336a85165fec7708308cca2215d79c07529f9428'
            'a4c6eb6a9e2b8d0ced8ad084c7e71dfbd62c7fc24c6df17080a9e593bc2b43c3d1ccc3fe67925711ec6784af01154981b87c4aadf573c443297a8591dd4805d2'
            'c1d25d40ddbcfe019275c4df815ad291c2b50e2b1deb9445a3d0435c829ac4b3b8b4d0e16099ac2374870a0320c045fff8964bfe1ec71c1761ba6a18a65bf191')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver-src"

	# enable file compression
	sed -i 's/#ADD_DEFINITIONS(-DTEEM_ZLIB=1)/ADD_DEFINITIONS(-DTEEM_ZLIB=1)/g' \
		CMakeLists.txt

	mkdir build || :
	cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release \
		-DBUILD_SHARED_LIBS:BOOL=ON \
		-DQNANHIBIT:INT=1 \
		..
}

build() {
    cd "$srcdir/$_pkgname-$pkgver-src/build"
	make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver-src/build"
	install -D -m755 \
		libNrrdIO.so \
		"${pkgdir}/usr/lib/libNrrdIO.so"

	install -d "${pkgdir}/usr/include/NrrdIO"
	install -m644 \
		"${srcdir}/$_pkgname-$pkgver-src/"*.h \
		"${pkgdir}/usr/include/NrrdIO"

	install -D -m644 \
		"${srcdir}/FindNrrdIO.cmake" \
		"${pkgdir}/usr/lib/nrrdio/nrrdio-config.cmake"

	install -D -m644 \
		"${srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

