# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-giflib
pkgver=5.2.1
pkgrel=5
pkgdesc="A library for reading and writing gif images (mingw-w64)"
arch=(any)
url="http://sourceforge.net/projects/giflib/"
license=("MIT")
makedepends=('xmlto' 'docbook-xsl' 'mingw-w64-make')
depends=('mingw-w64-crt')
options=(staticlibs !strip !buildflags !makeflags)
source=("https://downloads.sourceforge.net/project/giflib/${pkgname#mingw-w64-}-${pkgver}.tar.gz"
        "giflib-5.1.9-fix-missing-quantize-API-symbols.patch"
        "001-mingw-build.patch"
        "0001-respect-existence-of-distro-CFLAGS-and-CPPFLAGS.patch")
sha512sums=('4550e53c21cb1191a4581e363fc9d0610da53f7898ca8320f0d3ef6711e76bdda2609c2df15dc94c45e28bff8de441f1227ec2da7ea827cb3c0405af4faa4736'
            '5de1e8724f5221fa3637b4e6a482f650f7608673e2c9200233290018ec8a0bf1beea049b3979b5f57dbf2b2a5fda409324e636e9af10582fd01c71d92d4de3b3'
            '3b5d5937162d9a3c1076cdc58a803a8881b264c65aa8d33e9592c43dc1686724fce280e8b56ed2751a6bf8a5c75ed9d887c31a042bc9e0a15c1697ea0b2fedc9'
            '2b0eb1a5d1a3ff8270018f7cfbe87d902bca3e2105315c4169f4c7859dd37aac0c34dc27008ee2dc2acaa52375ffda260d5318a5c065b1ba51e7aed9f4ca3356')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd giflib-$pkgver
  patch -Np1 < ../giflib-5.1.9-fix-missing-quantize-API-symbols.patch
  patch -Np1 < ../001-mingw-build.patch
  patch -Np1 < ../0001-respect-existence-of-distro-CFLAGS-and-CPPFLAGS.patch
}

build() {
  for _arch in ${_architectures}; do
    [[ -d "build-${_arch}" ]] && rm -rf "build-${_arch}"
    cp -rf "$srcdir/giflib-${pkgver}" "${srcdir}/build-${_arch}"

    pushd build-${_arch}
    ${_arch}-make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    ${_arch}-make DESTDIR="${pkgdir}" PREFIX="/usr/${_arch}" install INSTALLABLE="gif2rgb.exe gifbuild.exe giffix.exe giftext.exe giftool.exe gifclrmp.exe"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-all "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}

# vim: ts=2 sw=2 et:
