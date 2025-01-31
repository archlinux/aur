# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="jbig2dec"
pkgname="lib32-${_name}"
pkgver=0.20
pkgrel=1
pkgdesc="Decoder implementation of the JBIG2 image compression format (32-bit)"
arch=('x86_64')
url="https://jbig2dec.com"
_url="https://github.com/ArtifexSoftware/${_name}"
license=('AGPL-3.0-or-later')
depends=("${_name}" 'lib32-glibc')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/releases/download/${pkgver}/${_pkgsrc}.tar.gz"
        "${_name}_only_target_library.patch")
sha256sums=('7b63ff6470289547e7a3a0f145cb8ea6c2afffdd65645b7d87d3b7febc96fb3a'
            '254b0c1fee951519a0d9b5988d5fd6dd90d7b6f814d3e0beecfae630e821352e')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_only_target_library.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh \
    --prefix='/usr' \
    --program-suffix='-32' \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --enable-shared \
    --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
