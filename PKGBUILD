# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=dektec-dtplay
pkgver=4.19.2
pkgrel=1
pkgdesc='DekTec command-line transport stream player and generator (DtPlay)'
arch=('x86_64')
url="https://www.dektec.com/downloads/utilities/"
license=('LicenseRef-custom')
depends=('gcc-libs' 'glibc' 'dektec-drivers-dkms')
# Alternate version of the former dektec-utilities bundle: pacman offers to
# remove the bundle when installing this.
conflicts=('dektec-utilities')
options=('!debug')
# Built from the upstream source zip against DTAPI from the LinuxSDK.
# _sdkver is the LinuxSDK the DTAPI objects are linked from; bump pkgrel
# (not pkgver) when rebuilding against a newer SDK with unchanged DtPlay.
_sdkver=2026.09.0
source=("https://www.dektec.com/products/applications/DtPlay/downloads/DtPlay_v${pkgver}.zip"
        "https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz")
sha256sums=('3024e7d4e543be3c013b7fa828a06f888c9bbde045dc51ef7f5d3efc435cb2e5'
            'f7bdf97421b39047efa379cfffbd208114bf0f3cb37c3565d709e46f3157fdf3')

prepare() {
  local dtplay_dir="${srcdir}/dtplay"
  local sdk_include_dir="${srcdir}/LinuxSDK/DTAPI/Include"
  local sdk_lib_dir="${srcdir}/LinuxSDK/DTAPI/Lib/GCC7.5.0"

  # Extract the DtPlay source zip
  install -d "${dtplay_dir}"
  bsdtar -xf "${srcdir}/DtPlay_v${pkgver}.zip" -C "${dtplay_dir}"

  # Wire in DTAPI: header for compilation, object for static linking
  install -d "${dtplay_dir}/Import/DTAPI"
  cp "${sdk_include_dir}/DTAPI.h" "${dtplay_dir}/Import/DTAPI"
  cp -r "${sdk_lib_dir}/"* "${dtplay_dir}/Import/DTAPI"

  # Patches
}

build() {
  cd "${srcdir}/dtplay"
  make
}

package() {
  install -Dm755 "${srcdir}/dtplay/DtPlay" "${pkgdir}/usr/bin/DtPlay"
  install -Dm644 "${srcdir}/LinuxSDK/License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
