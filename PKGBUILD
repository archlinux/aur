# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=dektec-drivers-dkms
pkgver=2025.09.0
pkgrel=1
pkgdesc='Linux DKMS for Dektec device drivers'
arch=('x86_64')
url="https://www.dektec.com/downloads/SDK/#linux"
license=('LicenseRef-custom')
depends=('dkms' 'linux-headers')
provides=('dektec-drivers-dkms')
conflicts=('dektec-drivers-dkms' 'dektec-dkms')
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${pkgver}.tar.gz"
        'dkms.conf'
        'Makefile')
sha256sums=('5617767108c5782b0485f1d3f5e0d94ea5fcdb4a6c66fd62525188c0e401f173'
            '0d70f1668ae0dbb608f865333eba8e188f2b97488d5f52c5fd65891ea6ab13be'
            '3ee9f2b8836d3e68451c3c29f343295f6ceaca52e84e18d040205b245473d314')

prepare() {
  # Set version
  sed -e "s|@PKGVER@|${pkgver}|" -i dkms.conf -i Makefile
  # Insert patches below this line
}

package() {
  # Install drivers
  install -d "${pkgdir}/usr/src/${pkgname}-${pkgver}/Drivers"
  cp -Pr --no-preserve=ownership \
    LinuxSDK/Drivers/{Dta,DtaNw,DtDrvCommon,DtPcie,DtPcieNw,DtSal,Dtu} \
    "${pkgdir}/usr/src/${pkgname}-${pkgver}/Drivers"
  install -Dm644 LinuxSDK/Common/Source/*.h -t "${pkgdir}/usr/src/${pkgname}-${pkgver}/Common/Source"
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -Dm644 Makefile "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  # Install license
  install -Dm644 LinuxSDK/License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install udev rules
  install -Dm644 LinuxSDK/Drivers/Dta/Source/Linux/51-dta.rules -t "${pkgdir}/etc/udev/rules.d"
  install -Dm644 LinuxSDK/Drivers/Dtu/Source/Linux/51-dtu.rules -t "${pkgdir}/etc/udev/rules.d"
  install -Dm644 LinuxSDK/Drivers/DtPcie/Source/Linux/51-dtpcie.rules -t "${pkgdir}/etc/udev/rules.d"
}

# vim:set ts=2 sw=2 et:
