# shellcheck disable=SC2034,SC2148,SC2154

# Maintainer: Mylloon <aur@mylloon.fr>

_pkgname=obs-plugin-shadertastic
pkgname="${_pkgname}"-git
pkgdesc="An OBS plugin to add amazing effects for your stream"
pkgver=1.2.0.r0.gbac0d9b
pkgrel=1

arch=("x86_64")
url="https://github.com/xurei/shadertastic"
license=('GPL-2.0')

depends=('obs-studio')
makedepends=("clang" "cmake" "patchelf")

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-bin")

source=("${pkgname}::git+https://github.com/xurei/shadertastic.git")
sha256sums=('SKIP')

options=(!debug)

pkgver() {
  cd "${pkgname}" || exit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}" || exit

  git submodule update --init --recursive
}

build() {
  cd ${pkgname} || exit

  cmake -S . -B build -DBUILD_OUT_OF_TREE=On -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}" || exit

  DESTDIR="${pkgdir}" cmake --install build
}
