# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libseccomp"
pkgname="lib32-${_name}"
pkgver=2.5.6
pkgrel=1
pkgdesc="Enhanced seccomp library (32-bit)"
arch=('x86_64')
url="https://github.com/seccomp/${_name}"
license=('LGPL-2.1-only')
depends=('lib32-glibc' "${_name}>=${pkgver}")
makedepends=('gperf' 'lib32-gcc-libs')
# checkdepends=('valgrind')
provides=("${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz"
        "${_pkgsrc}.tar.gz.asc::${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz.asc")
sha256sums=('04c37d72965dce218a0c94519b056e1775cf786b5260ee2b7992956c4ee38633'
            'SKIP')
validpgpkeys=('7100AADFAE6E6E940D2E0AD655E45A5AE8CA7C8A'  # Paul Moore <paul@paul-moore.com>
              '47A68FCE37C7D7024FD65E11356CE62C2B524099') # Tom Hromatka <tom.hromatka@oracle.com>

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e '/tools\//d' \
      -e '/doc\//d' \
      -i 'configure.ac'
  sed -e 's/tools//g' \
      -e 's/doc//g' \
      -i 'Makefile.am'
}

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
    --disable-python
  )

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make all
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
