# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1649223616
pkgrel=1
pkgdesc="Editor for building and debugging modern web and cloud applications (insiders version)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://code.visualstudio.com/"
license=('custom: commercial')
# lsof: need for terminal splitting, see https://github.com/Microsoft/vscode/issues/62991
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof)
optdepends=('glib2: Needed for move to trash functionality'
            'libdbusmenu-glib: Needed for KDE global menu')

pkgver() {
    if [ "${CARCH}" = "x86_64" ]; then
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://update.code.visualstudio.com/latest/linux-x64/insider); echo "${ADDR[5]}" | sed 's/code-insider-x64-//g' | sed 's/.tar.gz//g' | sed 's/-/./g'
    elif [ "${CARCH}" = "aarch64" ]; then
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://update.code.visualstudio.com/latest/linux-arm64/insider); echo "${ADDR[5]}" | sed 's/code-insider-arm64-//g' | sed 's/.tar.gz//g' | sed 's/-/./g'
    elif [ "${CARCH}" = "armv7h" ]; then
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://update.code.visualstudio.com/latest/linux-armhf/insider); echo "${ADDR[5]}" | sed 's/code-insider-armhf-//g' | sed 's/.tar.gz//g' | sed 's/-/./g'
    else
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://update.code.visualstudio.com/latest/linux-ia32/insider); echo "${ADDR[5]}" | sed 's/code-insider-//g' | sed 's/.tar.gz//g' | sed 's/-/./g'
    fi
}
source=(${_pkgname}.desktop ${_pkgname}-url-handler.desktop ${_pkgname}-bin.sh)
source_x86_64=(code_x64_${pkgver}.tar.gz::https://update.code.visualstudio.com/latest/linux-x64/insider)
source_aarch64=(code_arm64_${pkgver}.tar.gz::https://update.code.visualstudio.com/latest/linux-arm64/insider)
source_armv7h=(code_armhf_${pkgver}.tar.gz::https://update.code.visualstudio.com/latest/linux-armhf/insider)
source_i686=(code_ia32_${pkgver}.tar.gz::https://update.code.visualstudio.com/latest/linux-ia32/insider)

sha256sums=('edfeb13aa50d35fbae748ff545b5bd126be916dbfeda682157e3d5ce81574db2'
            'd06d9d057b507d1747a8ed8ae304beb5e20c7bf887c362c941d85b02c893069e'
            'ad1cc0187b077966f76e35143f6b49538c0972444c151f44a369682b00e470ba')
sha256sums_x86_64=('2f59fef0c551da583839e7faec1d03d37563682a9eff56b0567d3b3b29f630aa')
sha256sums_i686=('6bb6ae48e41cea0c0ae2584aaab58ccf3cd8a2e20e648f025326d71fc93c8357')
sha256sums_aarch64=('26b2d9f6024808bb19c3f8f46e34fca9fea44fe6f521baea886ba4f3c4625325')
sha256sums_armv7h=('0098b45b454a99946f7ac98b285ba03821c727892d8e126312e871b78f1042c5')
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

  install -m644 "${srcdir}/${_pkg}/resources/app/LICENSE.rtf" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.rtf"
  install -m644 "${srcdir}/${_pkg}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -m644 "${srcdir}/${_pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-url-handler.desktop"

  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R

  # Launcher
  install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/code-insiders"
}
