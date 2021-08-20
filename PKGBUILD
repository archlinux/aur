#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=opencrg
pkgver=1.2.0
pkgrel=1
pkgdesc="Format to store high-precision elevation data from road surface scans for simulation"
arch=(x86_64)
url="https://www.asam.net/standards/detail/opencrg/"
license=(GPL)
depends=()
makedepends=(cmake ninja)
optdepends=()
options=()
source=("${pkgname}_${pkgver}.zip::manual://www.asam.net/standard_downloads/standard_download611f5bda8ef95_14847.zip"
        "CMakeLists.txt"
        )
sha256sums=('SKIP' # each archive will have different check sums as they are packaged individually resulting in different timestamps.
            'bed2ba22e267fe3200614e6e61829c9d3dc04fc7a046d6899869c3a018ae608c')

# You need to download the opencrg source package manually.
download_manual() {
# Original implementation: `/usr/share/makepkg/source/file.sh:download_file()`
# shellcheck disable=SC2155
  local filepath=$(get_filepath "$1")
  if [[ -n "$filepath" ]]; then
    msg2 "$(gettext "Found %s")" "${filepath##*/}"
    return
  else
    echo "The source file for \"$pkgname\" package needs to be downloaded manually, since it requires a login and is not redistributable."
    echo "Please visit \"$url\" to download the source file to \"$PWD\" as \"${pkgname}_${pkgver}.zip\""
    exit 1
  fi
}

prepare() {
  cp "${srcdir}"/CMakeLists.txt "${srcdir}"/ASAM_OpenCRG_BS_V${pkgver}/c-api/
}

build() {
  cmake -G Ninja -S "${srcdir}"/ASAM_OpenCRG_BS_V${pkgver}/c-api/ -B build \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
