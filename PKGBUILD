# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Conitrbutor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_name="leptonica"
pkgname="lib32-${_name}"
pkgver=1.85.0
pkgrel=1
pkgdesc="Software that is broadly useful for image processing and image analysis applications (32-bit)"
arch=('x86_64')
url="https://www.leptonica.com"
_url="https://github.com/DanBloomberg/${_name}"
license=('custom:BSD-2-Clause-like')
depends=("${_name}" 'lib32-giflib>=5.1' 'lib32-glibc' 'lib32-libjpeg-turbo'
         'lib32-libpng' 'lib32-libtiff' 'lib32-libwebp>=0.5' 'lib32-openjpeg2'
         'lib32-zlib')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz")
sha256sums=('c01376bce0379d4ea4bc2ec5d5cbddaa49e2f06f88242619ab8c059e21adf233')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --disable-programs
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include"
}
