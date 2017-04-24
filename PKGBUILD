# Contributor: bubla <matej.tyc@gmail.com>
pkgname=mingw-w64-libtiff
pkgver=4.0.7
pkgrel=4
pkgdesc="Library for manipulation of TIFF images (mingw-w64)"
arch=(any)
url="http://www.remotesensing.org/libtiff"
license=("custom")
depends=(mingw-w64-libjpeg-turbo mingw-w64-zlib mingw-w64-xz)
makedepends=(mingw-w64-configure)
options=(staticlibs !buildflags !strip)
source=("http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz"
"fix-hylafax.patch"
"libtiff-CVE-2016-10266.patch"
"libtiff-CVE-2016-10267.patch"
"libtiff-CVE-2016-10268.patch"
"libtiff-CVE-2016-10269.patch"
"libtiff-CVE-2016-10270.patch"
"libtiff-CVE-2016-10271_10272.patch"
"libtiff-CVE-2017-7592.patch"
"libtiff-CVE-2017-7593.patch"
"libtiff-CVE-2017-7594.patch"
"libtiff-CVE-2017-7595.patch"
"libtiff-CVE-2017-7596_7597_7599_7600.patch"
"libtiff-CVE-2017-7598.patch"
"libtiff-CVE-2017-7601.patch"
"libtiff-CVE-2017-7602.patch")
sha256sums=('9f43a2cfb9589e5cecaa66e16bf87f814c945f22df7ba600d63aac4632c4f019'
            'f390882bc0fad9e6486379543e47df0f5b246843da5d442870558d24fbd7f65d'
            'fa4639e3cf470021f07f3d4a6b614a56299bbefcf4f0be646848b292ed2f4a3a'
            '79c6839d631d027eb51111fecebf3267fddbc03918bda5ccd5c4f027d42b5697'
            'aef913defad8f42305a4f79b564ddb810cf38e028cd7f0832794d9b0089554de'
            '7fd9b8cca73fc72390328951ab237fb09bd0f7aed6d45d2bd6f520c0b4812f0b'
            '6325882bae9e34a2c4affed05cac874413c5cf10848873c99113a0bda5788fab'
            'a4b7d8d50651d6f635cc38fcc45f23ead08ce69535aeff9848f144b35bbbf572'
            'ed13722c3eb25a3f41f7497fcda959eacd2b411ba14c16c1951ab8471955e549'
            'e8e775748bf8c2d11f891b9d784ab0bdcdb69577c67c4ace44677dcb8beed827'
            'ee2db50ef741b93de70d4f2735d6ffde6c8fda6d1dcd90ba38c1a2f8499c3d04'
            '60c7caadff5fd72314ebdf46705e33341c0cab84ee2cd9508c5a315874711e07'
            '8dae895d7eafbcc6675d4d9a4301a5da4ed314e5d677fdad23a1f5e7526a118c'
            '83e68ce99c89f8c930d8c45dc083f2dc388c84285bf68ee9e2e4d8c092e9b993'
            '83f28892b7d46056bd5eb1e2aef42d25b59dd3d814f49a28f75e1ab6e746baba'
            'a1e45339bf434200cdf8042fd4b7cb91f029e9121757cf8e4b927e57b908e763')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/tiff-${pkgver}"
  patch -Np1 -i ../fix-hylafax.patch
  patch -Np1 -i ../libtiff-CVE-2016-10266.patch
  patch -Np1 -i ../libtiff-CVE-2016-10267.patch
  patch -Np1 -i ../libtiff-CVE-2016-10268.patch
  patch -Np1 -i ../libtiff-CVE-2016-10269.patch
  patch -Np1 -i ../libtiff-CVE-2016-10270.patch
  patch -Np1 -i ../libtiff-CVE-2016-10271_10272.patch
  patch -Np1 -i ../libtiff-CVE-2017-7592.patch
  patch -Np1 -i ../libtiff-CVE-2017-7593.patch
  patch -Np1 -i ../libtiff-CVE-2017-7594.patch
  patch -Np1 -i ../libtiff-CVE-2017-7595.patch
  patch -Np1 -i ../libtiff-CVE-2017-7596_7597_7599_7600.patch
  patch -Np1 -i ../libtiff-CVE-2017-7598.patch
  patch -Np1 -i ../libtiff-CVE-2017-7601.patch
  patch -Np1 -i ../libtiff-CVE-2017-7602.patch
}

build() {
	export CFLAGS+=" -fno-strict-aliasing"
  export CXXFLAGS+=" -fno-strict-aliasing"
  cd "${srcdir}/tiff-${pkgver}"
  for _arch in ${_architectures}; do 
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
			--disable-jbig \
			--without-x
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/tiff-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    cp "${srcdir}/tiff-${pkgver}/libtiff/"{tiffiop,tif_dir}.h "${pkgdir}/usr/${_arch}/include/"
		cp libtiff/tif_config.h "${pkgdir}/usr/${_arch}/include/"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
