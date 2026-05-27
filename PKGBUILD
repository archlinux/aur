# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="rav1e"
_pkgname="lib32-${_name}"
pkgname="${_pkgname}-bin"
pkgver=0.8.1
pkgrel=1
pkgdesc="An AV1 encoder focused on speed and safety (32-bit)"
arch=(
  'x86_64'
)
url="https://github.com/xiph/${_name}"
license=(
  'BSD-2-Clause'
)
depends=(
  # "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
)
makedepends=(
  'patchelf'
)
provides=(
  "${_pkgname}=${pkgver}"
  "lib${_name}.so"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-PATENTS::${url}/raw/refs/tags/v${pkgver}/PATENTS"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/librav1e-${pkgver}-linux-i686.tar.gz"
)
sha256sums=('7b14a70c194b19dbd0625e7eac839a63200f67484521ce5e8d8244b127e8907a')
sha256sums_x86_64=('e45c3df0dd9fe27eace4d39921948a8f3bfda0d41d017c62589330411889eaf9')

prepare() {
  cd "${srcdir}/lib"
  patchelf --replace-needed 'libc.so' 'libc.so.6' "lib${_name}.so.${pkgver}"

  cd "pkgconfig"
  sed -e 's|^prefix=.*|prefix=/usr|g' \
      -e 's|/lib|/lib32|g' \
      -i "${_name}.pc"
}

package() {
  cd "${srcdir}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -vDm644 "${_pkgsrc}-PATENTS" "${pkgdir}/usr/share/licenses/${_pkgname}/PATENTS"

  cp -va --no-preserve=ownership "lib" "${pkgdir}/usr/lib32"
}
