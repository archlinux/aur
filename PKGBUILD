# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="qdl"
pkgver=2.9
pkgrel=1
pkgdesc="Tool to communicate with Qualcomm System On a Chip bootroms to install or execute code"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/linux-msm/${pkgname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'glibc'
  'libusb'
  'libxml2'
  'libzip'
)
makedepends=(
  'cmocka'
  'git'
  'help2man'
  'meson>=1.1.0'
  'nbdkit'
)
checkdepends=(
  'zip'
)
optdepends=(
  'nbdkit: nbdkit plugin'
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}"
)
b2sums=('ce6451eae6421c12a347ac0dacc54e3de4a9e4b45114464358fbeaaba9301651095b21ba4d3782cd94edd0e022587858b04a45c00185e3390476de668439645b')

build() {
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
    # -D VERSION="${pkgver}"
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}" 
  meson compile -C "${meson_options[1]}"
}

check() {
  cd "${srcdir}"
  meson test -C "${_pkgsrc}/build" --print-errorlogs
}

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE"   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
