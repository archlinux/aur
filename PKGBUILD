# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="jbig2dec"
pkgname="mingw-w64-${_name}"
pkgver=0.20
pkgrel=1
pkgdesc="Decoder implementation of the JBIG2 image compression format (mingw-w64)"
arch=('any')
url="https://jbig2dec.com"
_url="https://github.com/ArtifexSoftware/${_name}"
license=('AGPL-3.0-or-later')
depends=('mingw-w64-crt' 'mingw-w64-libpng')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/releases/download/${pkgver}/${_pkgsrc}.tar.gz"
        "${_name}_autogen_noconfigure.patch")
sha256sums=('7b63ff6470289547e7a3a0f145cb8ea6c2afffdd65645b7d87d3b7febc96fb3a'
            '2b8873c1986ef900a84cecb58f7b6807da5161a7fdb4e48360daa51b2b780e0e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_autogen_noconfigure.patch"

  ./autogen.sh
}

build() {
  export CFLAGS+=" -Wno-error=incompatible-pointer-types -Wno-error=int-conversion"

  cd "${srcdir}/${_pkgsrc}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
  cd "${srcdir}/${_pkgsrc}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/${_arch}/share"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec "${_arch}-strip" "{}" \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec "${_arch}-strip" --strip-unneeded "{}" \;
    find "${pkgdir}/usr/${_arch}" \( -name '*.a' -o -name '*.dll' \) -exec "${_arch}-strip" -g '{}' ';'
  done
}

# vim: ts=2 sw=2 et:
