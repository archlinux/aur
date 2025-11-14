pkgname=burpsuitepro-cn
pkgver=2025.11
pkgrel=3
pkgdesc='Burp Suite Professional bundled with BurpSuiteCN loader/translation for a single localized launcher'
url='https://portswigger.net/burp/'
arch=('any')
depends=('java-runtime=21' 'bash' 'hicolor-icon-theme')
makedepends=('zip')
license=('custom' 'Apache-2.0')
provides=('burpsuite-pro')
conflicts=('burpsuite-pro')
_up_pkg=burpsuite-pro
_cnver=4.11.22
noextract=("${_up_pkg}-${pkgver}-orig.jar")
source=("${_up_pkg}-${pkgver}-orig.jar::https://portswigger.net/burp/releases/download?product=pro&version=${pkgver}&type=Jar"
        "${_up_pkg}"
        "${_up_pkg}.desktop"
        'icon16.png'
        'icon24.png'
        'icon32.png'
        'icon48.png'
        'icon128.png'
        'icon256.png'
        'icon512.png'
        'icon.svg'
        'cn-Logger++.txt'
        'cn-PentagridScanController.txt'
        'cn-Reshaper.txt'
        "burpsuitloader-${_cnver}-all.jar::https://github.com/Leon406/BurpSuiteCN-Release/releases/download/v${_cnver}/burpsuitloader-${_cnver}-all.jar"
        'BurpSuiteCN.LICENSE')
sha256sums=('fcbb9d6181139d44fb627ab0dc73bcdb685d314a33de6ad33da7bb64ef123321'
            '18b8179589f4f6af32d7383f0f2f022dac9e74f02dd608597c9ce5d097289b09'
            'f442258c5616969bfaad7c20b2ff99f05696ad04c2e2c3d145a360615650b9ec'
            'ff0b230af06fb76af053090ac021bf45b88341d746e67f6bb9e94ba40957d9d8'
            'a6791fcaee558f6744b4f5a3fc0af2c9ad7ce244033e224c4e4464563ac9b911'
            '48d529f2a045b1179d9cd87ffdeb7fd469d963f7606fd22b7edc665d0515e1d2'
            '2b2407b8ab2ee181bfd64e3ba3e3090a328cbef8f53cce20ba76cffbfb3bc1d1'
            '28d17763c17e010936ad8ed44427d9ce6523510f580aefce52eb7c0f26b48045'
            'da6469f32b0acfcad2057cf0920c128bbbf64bc72ec6a4d5e5ba10d5b8a2d859'
            '6bbfd022aa451efeb439a89527b814ae06f7ce6196f7ad8db276e9ad372a7e32'
            '8777077ed5b1809c8adde4c056a315f8ec8f1b79f4c4c0e60eb3582c4d7ab71d'
            '6dffd89f3c92605a09d4494bc23245830ba20ec96db173e273e78f4fd86f85b2'
            'ccf9d6ec55d42be4de6165b6bbc61ab2351389c41b7906246f518a7dae1506b8'
            'e84e75f16163c6d18e1405f83fa4aafe0ef4a1bbc3d7f69813993673d383b662'
            '650a4e48e2788747c56899b0e6e8e17bc3b75d2ec91f03fd7cc373a489a20b5d'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

prepare() {
  cp "${srcdir}/${_up_pkg}-${pkgver}-orig.jar" "${srcdir}/${_up_pkg}-${pkgver}.jar"
  # remove useless chromium versions
  zip -d "${srcdir}/${_up_pkg}-${pkgver}.jar" 'chromium-macosx*.zip' 'chromium-win*.zip'
}

package() {
  local sharedir="${pkgdir}/usr/share/${_up_pkg}"

  install -Dm644 "${srcdir}/${_up_pkg}-${pkgver}.jar" "${sharedir}/${_up_pkg}.jar"
  install -Dm644 "${srcdir}/${_up_pkg}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm755 "${srcdir}/${_up_pkg}" "${pkgdir}/usr/bin/${_up_pkg}"
  ln -sf "../${_up_pkg}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/burpsuitloader-${_cnver}-all.jar" "${sharedir}/${_up_pkg}-cn-loader.jar"
  install -Dm644 "${srcdir}/cn-Logger++.txt" "${sharedir}/cn/cn-Logger++.txt"
  install -Dm644 "${srcdir}/cn-PentagridScanController.txt" "${sharedir}/cn/cn-PentagridScanController.txt"
  install -Dm644 "${srcdir}/cn-Reshaper.txt" "${sharedir}/cn/cn-Reshaper.txt"

  # install icons
  for size in 16 24 32 48 128 256 512; do
    install -Dm644 "${srcdir}/icon${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/burpsuite-pro.png"
  done
  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/burpsuite-pro.svg"

  install -Dm644 "${srcdir}/BurpSuiteCN.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/BurpSuiteCN.LICENSE"
}
