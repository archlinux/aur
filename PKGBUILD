# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Conitrbutor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_name="leptonica"
pkgname="lib32-${_name}"
pkgver=1.87.0
pkgrel=1
pkgdesc='Software that is broadly useful for image processing and image analysis applications'
pkgdesc+=' (32-bit)'
arch=(x86_64)
url='https://www.leptonica.com'
_url="https://github.com/DanBloomberg/${_name}"
license=('custom:BSD-2-Clause-like')
depends=('giflib>=5.1'
         libjpeg-turbo
         libpng
         libtiff
         'libwebp>=0.5'
         openjpeg2 # libopenjp2.so
         zlib)
depends+=('glibc')
depends=("${depends[@]/#/lib32-}")
depends+=("${_name}>=${pkgver}")
provides=("lib${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz")
sha256sums=('fa2b40c5caea96d1bb93a97486262aed8731b69ce25a84a6bf5d25323e33f631')

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

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
  make DESTDIR="$pkgdir" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include"
}
