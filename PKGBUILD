# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="qdl"
pkgver=2.9.1
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
b2sums=('8de3a28dc9df29a3a32cd3ded9703b030f266eece4f9b536519f43395ab9854f3b77a1670b211565b00baf8b83d0299da7a108e908ca2777f2f03a1f53d9b1b9')

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
