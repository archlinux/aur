# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=dektec-dtrecord
pkgver=4.16.3
pkgrel=1
pkgdesc='DekTec command-line transport stream recorder (DtRecord)'
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
# (not pkgver) when rebuilding against a newer SDK with unchanged DtRecord.
_sdkver=2026.09.0
source=("https://www.dektec.com/products/applications/DtRecord/downloads/DtRecord_v${pkgver}.zip"
        "https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdkver}.tar.gz")
sha256sums=('e4fce1f14f03a589f2696ef228f6943a9e2b678146d5bab1fb7e9924104162eb'
            'f7bdf97421b39047efa379cfffbd208114bf0f3cb37c3565d709e46f3157fdf3')

prepare() {
  local dtrecord_dir="${srcdir}/dtrecord"
  local sdk_include_dir="${srcdir}/LinuxSDK/DTAPI/Include"
  local sdk_lib_dir="${srcdir}/LinuxSDK/DTAPI/Lib/GCC7.5.0"

  # Extract the DtRecord source zip
  install -d "${dtrecord_dir}"
  bsdtar -xf "${srcdir}/DtRecord_v${pkgver}.zip" -C "${dtrecord_dir}"

  # Wire in DTAPI: header for compilation, object for static linking
  install -d "${dtrecord_dir}/Import/DTAPI"
  cp "${sdk_include_dir}/DTAPI.h" "${dtrecord_dir}/Import/DTAPI"
  cp -r "${sdk_lib_dir}/"* "${dtrecord_dir}/Import/DTAPI"

  # Patches
}

build() {
  cd "${srcdir}/dtrecord"
  make
}

package() {
  install -Dm755 "${srcdir}/dtrecord/DtRecord" "${pkgdir}/usr/bin/DtRecord"
  install -Dm644 "${srcdir}/LinuxSDK/License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
