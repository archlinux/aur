# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=dektec-utilities
pkgver=17.06.24
pkgrel=4
pkgdesc="DekTec utilities DtEpc, DtPlay, DtRecord and DtInfoCL"
arch=('x86_64')
url="https://www.dektec.com/downloads/utilities/"
license=('LicenseRef-custom')
depends=('gcc-libs' 'glibc')
makedepends=('unzip')
_dtepc=2.13.1
_dtplay=4.18.0
_dtrecord=4.15.1
_dtinfocl=1.5.2
_sdk=2024.09.0
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${_sdk}.tar.gz"
        "https://www.dektec.com/products/applications/DtEpc/downloads/DtEpc-${_dtepc}.zip"
        "https://www.dektec.com/products/applications/DtInfoCL/downloads/DtInfoCL_v${_dtinfocl}.zip"
        "https://www.dektec.com/products/applications/DtPlay/downloads/DtPlay_v${_dtplay}.zip"
        "https://www.dektec.com/products/applications/DtRecord/downloads/DtRecord_v${_dtrecord}.zip")
noextract=("DtPlay_v${_dtplay}.zip" "DtRecord_v${_dtrecord}.zip")
sha256sums=('da4763b3174cfa2e4817bb52818d72e5941ba0a6a083cb2be4714aa8bd520623'
            '4fbbfe09d55b3528a6a45bc6a2effce3ba0431d7ac141bf190423accc7c4a435'
            'd93fd5372e3ae09942a6d21c363f3eb4c527d2ae631a103df81487942dbdfbce'
            '5ddeff15b4a425c85b07fec14773adde88330326c601a7393f4337b8bb73bd00'
            '25da742364317b797182a02da4a323e0be8e7ae1577bfaa0e2fd5d109e49621c')

prepare() {
  unzip -o "DtEpc_Linux_v${_dtepc}.zip" -d "Linux"
  unzip -o "DtPlay_v${_dtplay}.zip" -d "dtplay"
  unzip -o "DtRecord_v${_dtrecord}.zip" -d "dtrecord"
  mkdir -p "dtplay/Import/DTAPI" "dtrecord/Import/DTAPI"
  # Include DTAPI (SDK) for DtPlay
  cp "LinuxSDK/DTAPI/Include/DTAPI.h" "dtplay/Import/DTAPI"
  cp -r "LinuxSDK/DTAPI/Lib/GCC7.5.0/"* "dtplay/Import/DTAPI"
  # Include DTAPI (SDK) for DtRecord
  cp "LinuxSDK/DTAPI/Include/DTAPI.h" "dtrecord/Import/DTAPI"
  cp -r "LinuxSDK/DTAPI/Lib/GCC7.5.0/"* "dtrecord/Import/DTAPI"
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
  install -Dm755 "${srcdir}/Linux/DtEpc64" "${pkgdir}/usr/bin/DtEpc"
  install -Dm755 "${srcdir}/Linux/DtInfoCL64" "${pkgdir}/usr/bin/DtInfoCL"
  install -Dm755 "${srcdir}/Linux/DtPlay" "${pkgdir}/usr/bin/DtPlay"
  install -Dm755 "${srcdir}/Linux/DtRecord" "${pkgdir}/usr/bin/DtRecord"
  install -Dm644 "${srcdir}/LinuxSDK/License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
