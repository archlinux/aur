# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=dektec-utilities
pkgver=25.05.24
pkgrel=1
pkgdesc="DekTec utilities DtEpc, DtPlay, DtRecord and DtInfoCL"
arch=('x86_64')
url="https://www.dektec.com/downloads/utilities/"
license=('LicenseRef-custom')
depends=('gcc-libs' 'glibc')
makedepends=('make')
_dtepc=2.13.1
_dtplay=4.19.0
_dtrecord=4.16.0
_dtinfocl=1.7.1
_sdk=2025.04.0
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdk}.tar.gz"
        "https://www.dektec.com/products/applications/DtEpc/downloads/DtEpc-${_dtepc}.zip"
        "https://www.dektec.com/products/applications/DtInfoCL/downloads/DtInfoCL_v${_dtinfocl}.zip"
        "https://www.dektec.com/products/applications/DtPlay/downloads/DtPlay_v${_dtplay}.zip"
        "https://www.dektec.com/products/applications/DtRecord/downloads/DtRecord_v${_dtrecord}.zip"
        '0001-dtplay-fix.patch'
        '0002-dtrecord-fix.patch')
sha256sums=('37fe7622b6b609adda95f21c4eed6fca6e25cb156e34cace71191b35749ded94'
            '4fbbfe09d55b3528a6a45bc6a2effce3ba0431d7ac141bf190423accc7c4a435'
            'df45c1330fc76f08576c6f8af4bad2c0a2ab872d3c325a356ac0eaf446c06d93'
            '2037fda8d97e01cd0d1db055db6ff2e184486e3350d1e59eee0edde42527e9dd'
            '0a3a2e1ab86bf554d408954e6064b65b782df0fd4e4e512cdc8c41641b248f78'
            '5b0816590bc22cb2973a26afd9456160d277c8f4c03333c90baf5c547f8a3e3b'
            '2d1ded3658de44981232ca0a7756f401f989e23f18e043a7c16bbca8ded6a827')

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
  patch -Np1 -i "${srcdir}/0001-dtplay-fix.patch"
  patch -Np1 -i "${srcdir}/0002-dtrecord-fix.patch"
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
