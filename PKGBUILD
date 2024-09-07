# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=dektec-drivers-dkms
pkgver=2024.06.0
pkgrel=2
pkgdesc='Linux DKMS for Dektec device drivers'
arch=('x86_64')
url="https://www.dektec.com/downloads/SDK/#linux"
license=('LicenseRef-custom')
depends=('dkms')
optdepends=('linux-headers: build modules against the Arch kernel'
            'linux-lts-headers: build modules against the LTS kernel'
            'linux-zen-headers: build modules against the ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
provides=('dektec-drivers-dkms')
conflicts=('dektec-drivers-dkms' 'dektec-dkms')
source=("https://www.dektec.com/products/SDK/DTAPI/Downloads/LinuxSDK_v${pkgver}.tar.gz"
        'dkms.conf'
        'Makefile'
        '01-wildcard.patch')
sha256sums=('8b2ae732837f9d0be1db435c10b0f3bd2a12e1bf2d51200da84f4d378701a785'
            '3ab98092aad33786c1766b8d0b29636c5bb1ccdb116cbfe32608c972b99d4d47'
            '3ee9f2b8836d3e68451c3c29f343295f6ceaca52e84e18d040205b245473d314'
            'b7c5d16d7febe92ca077fa7197d469cfb36b6e7a7017f54223c418b157a2f4ea')

prepare() {
  # Set version
  sed -e "s|@PKGVER@|${pkgver}|" -i dkms.conf -i Makefile
  # Insert patches below this line
  patch -d LinuxSDK -Np1 -i "${srcdir}/01-wildcard.patch"
}

package() {
  # Install drivers
  install -d "${pkgdir}/usr/src/${pkgname}-${pkgver}/Drivers"
  cp -a --no-preserve='ownership,mode' \
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
