# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libtpms"
pkgname="lib32-${_name}"
pkgver=0.10.0
pkgrel=1
pkgdesc="Library providing a software emulation of a Trusted Platform Module (TPM 1.2 and TPM 2.0) (32-bit)"
arch=('x86_64')
url="https://github.com/stefanberger/${_name}"
license=('BSD-3-Clause')
depends=('lib32-glibc' 'lib32-openssl' "${_name}>=${pkgver}")
makedepends=('lib32-gcc-libs')
provides=("${_name}.so")
options=('!lto')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgsrc}.tar.gz.asc::${url}/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc")
sha256sums=('6da9a527b3afa7b1470acd4cd17157b8646c31a2c7ff3ba2dfc50c81ba413426'
            'SKIP')
validpgpkeys=('B818B9CADF9089C2D5CEC66B75AD65802A0B4211') # Stefan Berger <stefanb@linux.vnet.ibm.com>

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local configure_options=(
    --prefix='/usr'
    --program-suffix='-32'
    --lib{exec,}dir='/usr/lib32'
    --build=i686-pc-linux-gnu
    --with-openssl
    --with-tpm2
  )

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make check
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
