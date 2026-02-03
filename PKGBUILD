# Maintainer:  dreieck

_pkgname="mslink"
pkgname="${_pkgname}"
pkgver=1.3
pkgrel=1
pkgdesc="This application allow you to create Windows Shortcut files (extension .LNK) without needing a Windows OS."
arch=(
  'i386'
  'i686'
  'x86_64'
  'armv6h'
  'armv7h'
  'armv8h'
  'aarch64'
)
url="https://www.mamachine.org/mslink/index.en.html"
license=('GPL-3.0-or-later')
depends=(
  'glibc'
)
makedepends=(
  'gcc'
)
# checkdepends=()
optdepends=(
  "bash: For the bash variant."
)
source=(
  "https://www.mamachine.org/mslink/mslink_v${pkgver}.tar.gz"  # C source
  "https://www.mamachine.org/mslink/mslink_v${pkgver}.sh"      # bash variant
)
sha256sums=(
  '0f3f19c53749c6a38b63a229418d8d535dce053bc3c7aec97cc646c18dc23ce2'  # mslink_v${pkgver}.tar.gz
  'b445180cbd8dcb9c4ec9c0509b7254b8fe831f062987cabf3225fe192d99107a'  # mslink_v${pkgver}.sh
)

prepare() {
  cd "${srcdir}/${_pkgname}_v${pkgver}"
  printf '%s\n' " --> Cleaning up pre-existing binary ..."
  make clean
}


build() {
  cd "${srcdir}/${_pkgname}_v${pkgver}"
  printf '%s\n' " --> building ..."
  make
}

## 2026-02-02: `check()` is disabled since it fails since it runs no test.
# check() {
#   cd "${srcdir}/${_pkname}"
# }

package() {
  cd "${srcdir}/${_pkgname}_v${pkgver}"
  printf '%s\n' " --> installing ..."

  install -Dvm0755 -t "${pkgdir}/usr/bin" mslink
  install -Dvm0755 "${srcdir}/mslink_v${pkgver}.sh" "${pkgdir}/usr/bin/mslink-bash"

  _docfiles=(
    README
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
}
