# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-bin
_pkgname=visual-studio-code
pkgver=1.64.0
pkgrel=1
pkgdesc="Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications (official binary version)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://code.visualstudio.com/"
license=('custom: commercial')
provides=('code' 'vscode')
conflicts=('code')
install=$pkgname.install
# lsof: needed for terminal splitting, see https://github.com/Microsoft/vscode/issues/62991
# xdg-utils: needed for opening web links with xdg-open
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof shared-mime-info xdg-utils)
optdepends=('glib2: Needed for move to trash functionality'
            'libdbusmenu-glib: Needed for KDE global menu'
            'org.freedesktop.secrets: Needed for settings sync')
source=(${_pkgname}.desktop ${_pkgname}-url-handler.desktop ${_pkgname}-workspace.xml ${_pkgname}-bin.sh)
source_x86_64=(code_x64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/linux-x64/stable)
source_aarch64=(code_arm64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/linux-arm64/stable)
source_armv7h=(code_armhf_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/linux-armhf/stable)

# i686 uses "latest" instead of a specific version as it's not always updated in a timely manner
source_i686=(code_ia32_${pkgver}.tar.gz::https://update.code.visualstudio.com/latest/linux-ia32/stable)
# This generates cleaner checksums
sha256sums=('f0be273247878b66c7d10500718220e3e24abce29f7be94b4e875c3cf21b8a3b'
            '730b9d57a6d5cd91611b01ad2f1f26b1b61c344a72e7d05fb7e27329c5234d4e'
            '24ba09a6398c9781ed7cb6f1a9f6f38ec204899ba1f33db92638bf6d3cb0aed6'
            'fb23f8716b87efadf0e4dc2ab60a96b03af90ef944b4475e103b68ebf8f66126')
sha256sums_x86_64=('e8a5168740b002c04087f67225529e2625bd62a26720c6d3bebac7ba466b5f5b')
sha256sums_i686=('64360439cc2fa596838062f7e6f9757b79d4b775a564f18bad6cbad154bf850c')
sha256sums_aarch64=('9ab44312d4429f0b818cd6132a6c37272a20db1f355f8d7a2ee431b4a3986700')
sha256sums_armv7h=('6c285476207f70b6a2c2ba6823de36a2f3f5e4c80bc385cae4d3fe7d81296ba4')



package() {
  _pkg=VSCode-linux-x64
  if [ "${CARCH}" = "aarch64" ]; then
    _pkg=VSCode-linux-arm64
  fi
  if [ "${CARCH}" = "armv7h" ]; then
    _pkg=VSCode-linux-armhf
  fi
  if [ "${CARCH}" = "i686" ]; then
    _pkg=VSCode-linux-ia32
  fi

  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 
  install -d "${pkgdir}/usr/share/mime/packages"

  install -m644 "${srcdir}/${_pkg}/resources/app/LICENSE.rtf" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.rtf"
  install -m644 "${srcdir}/${_pkg}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -m644 "${srcdir}/${_pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-url-handler.desktop"
  install -m644 "${srcdir}/${_pkgname}-workspace.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}-workspace.xml"
  install -Dm 644 "${srcdir}/${_pkg}/resources/completions/bash/code" "${pkgdir}/usr/share/bash-completion/completions/code"
  install -Dm 644 "${srcdir}/${_pkg}/resources/completions/zsh/_code" "${pkgdir}/usr/share/zsh/site-functions/_code"

  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R

  # Launcher
	install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/code"
}

