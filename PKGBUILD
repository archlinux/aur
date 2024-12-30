# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Cello"
_name="lib${_Name,,}"
pkgname="lib32-${_name}"
_commit_rel="da28eefbc95d8bd5628e5f1c4cc12bc1b13fef4f" # 2.1.0
_commit="61ee5c3d9bca98fd68af575e9704f5f02533ae26" # r25
pkgver="2.1.0+r25+g${_commit::7}"
pkgrel=1
pkgdesc="Higher level programming library in C (32-bit)"
arch=('x86_64')
url="https://libcello.org"
_url="https://github.com/orangeduck/${_Name}"
license=('BSD-2-Clause')
depends=('lib32-glibc' 'libcello')
provides=("lib${_Name}.so")
_pkgsrc="${_Name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('89c928bf356b9dcb563ed9f287771be1279a4b5a2c5c266c0a6bc575ce1ec037')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  make CFLAGS="${CFLAGS} -I./include -fPIC" LFLAGS="${LDFLAGS}"
}

check() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  make CFLAGS="${CFLAGS} -I./include -fPIC" LFLAGS="${LDFLAGS}" check
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  # make install PREFIX="${pkgdir}/usr"

  install -vDm644 "lib${_Name}.so" "${pkgdir}/usr/lib32/lib${_Name}.so.${pkgver%%+*}"
  install -vDm644 "lib${_Name}.a"  "${pkgdir}/usr/lib32/lib${_Name}.a"

  cd "${pkgdir}/usr/lib32"
  ln -vs "lib${_Name}.so.${pkgver%%+*}" "lib${_Name}.so.${pkgver%%.*}"
  ln -vs "lib${_Name}.so.${pkgver%%+*}" "lib${_Name}.so"
}
