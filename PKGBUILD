# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-giflib
pkgver=5.2.2
pkgrel=1
pkgdesc="A library for reading and writing gif images (mingw-w64)"
arch=(any)
url="http://sourceforge.net/projects/giflib/"
license=("MIT")
makedepends=('xmlto' 'docbook-xsl' 'imagemagick' 'mingw-w64-make')
depends=('mingw-w64-crt')
options=(staticlibs !strip !buildflags !makeflags)
source=("https://downloads.sourceforge.net/project/giflib/${pkgname#mingw-w64-}-${pkgver}.tar.gz"
        "001-mingw-build.patch"
        "giflib_quantize.patch")
sha512sums=('0865ab2b1904fa14640c655fdb14bb54244ad18a66e358565c00287875d00912343f9be8bfac7658cc0146200d626f7ec9160d7a339f20ba3be6b9941d73975f'
            'a2b0e76039c38cdc2006548f2249ff0274bc6d4b1b8f35f89b3eeba5244893624f73fab17e77de13f3b8d86ddb2a077355ce2211bd5643087591b80c0df0796b'
            '7e3e200e7e42e8c4622db2b28c29b623171d72f417230a28614ef01f1a2b0cc49c5e8ba06229c3d84fe4fe2a2f5303cd4af2f722dceef3540d099d05c46b2169')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd giflib-$pkgver
  patch -Np1 < ../001-mingw-build.patch
  patch -Np1 < ../giflib_quantize.patch
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
