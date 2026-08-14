# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="qdl"
pkgver=2.8
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
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}"
)
b2sums=('b6962ddab5ebe0618573a474a5f3d389c99fde5a077d61ab1d35d44c045c7934d17ca6dc0d90d6a94a440442de26b403c1e49dcc42b70b8fffe535baa967bebc')

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
