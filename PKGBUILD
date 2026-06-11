# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="qdl"
pkgver=2.7
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
)
checkdepends=(
  'zip'
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}"
)
b2sums=('d76c6473d81c8e32aee2c14dc799069d208140d5e8bf1e1af8edb04b3fcf76ab73196f91670c3debd86924eac4dfc095512d8c1e17300d7666c6142fb78d32fe')

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
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
