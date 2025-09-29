# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=dektec-utilities
pkgver=25.06.06
pkgrel=1
pkgdesc="DekTec utilities DtEpc, DtPlay, DtRecord and DtInfoCL"
arch=('x86_64')
url="https://www.dektec.com/downloads/utilities/"
license=('LicenseRef-custom')
depends=('gcc-libs' 'glibc')
makedepends=('make')
_dtepc=2.13.1
_dtplay=4.19.1
_dtrecord=4.16.1
_dtinfocl=1.7.1
_sdk=2025.09.0
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdk}.tar.gz"
        "https://www.dektec.com/products/applications/DtEpc/downloads/DtEpc-${_dtepc}.zip"
        "https://www.dektec.com/products/applications/DtInfoCL/downloads/DtInfoCL_v${_dtinfocl}.zip"
        "https://www.dektec.com/products/applications/DtPlay/downloads/DtPlay_v${_dtplay}.zip"
        "https://www.dektec.com/products/applications/DtRecord/downloads/DtRecord_v${_dtrecord}.zip")
sha256sums=('5617767108c5782b0485f1d3f5e0d94ea5fcdb4a6c66fd62525188c0e401f173'
            '4fbbfe09d55b3528a6a45bc6a2effce3ba0431d7ac141bf190423accc7c4a435'
            'df45c1330fc76f08576c6f8af4bad2c0a2ab872d3c325a356ac0eaf446c06d93'
            '0d53c9122e879fe6ca18d242fb22f6e06f3778f5144f8a5fd14064295d32ed76'
            '1bc6b04a579e594ba34d653c8afd2e24e9398c0cec5d3a4482bb76067739967d')

prepare() {
  # Define directories
  local dtplay_dir="${srcdir}/dtplay"
  local dtrecord_dir="${srcdir}/dtrecord"
  local linux_dir="${srcdir}/Linux"
  local sdk_include_dir="${srcdir}/LinuxSDK/DTAPI/Include"
  local sdk_lib_dir="${srcdir}/LinuxSDK/DTAPI/Lib/GCC7.5.0"

  # Create necessary directories before extraction
  install -d "${dtplay_dir}" "${dtrecord_dir}" "${linux_dir}"

  # Extract archives
  bsdtar -xf "DtEpc_Linux_v${_dtepc}.zip" -C "${linux_dir}"
  bsdtar -xf "DtPlay_v${_dtplay}.zip" -C "${dtplay_dir}"
  bsdtar -xf "DtRecord_v${_dtrecord}.zip" -C "${dtrecord_dir}"

  # Create necessary directories for DTAPI
  install -d "${dtplay_dir}/Import/DTAPI" "${dtrecord_dir}/Import/DTAPI"

  # Include DTAPI (SDK) for DtPlay and DtRecord
  cp "${sdk_include_dir}/DTAPI.h" "${dtplay_dir}/Import/DTAPI"
  cp -r "${sdk_lib_dir}/"* "${dtplay_dir}/Import/DTAPI"
  cp "${sdk_include_dir}/DTAPI.h" "${dtrecord_dir}/Import/DTAPI"
  cp -r "${sdk_lib_dir}/"* "${dtrecord_dir}/Import/DTAPI"

  # Patches
}

build() {
  # Build DtPlay
  cd "${srcdir}/dtplay"
  make
  cp "DtPlay" "${srcdir}/Linux"

  # Build DtRecord
  cd "${srcdir}/dtrecord"
  make
  cp "DtRecord" "${srcdir}/Linux"
}

package() {
  # Install binaries
  install -Dm755 "${srcdir}/Linux/DtEpc64" "${pkgdir}/usr/bin/DtEpc"
  install -Dm755 "${srcdir}/Linux/DtInfoCL64" "${pkgdir}/usr/bin/DtInfoCL"
  install -Dm755 "${srcdir}/Linux/DtPlay" "${pkgdir}/usr/bin/DtPlay"
  install -Dm755 "${srcdir}/Linux/DtRecord" "${pkgdir}/usr/bin/DtRecord"

  # Install license
  install -Dm644 "${srcdir}/LinuxSDK/License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
