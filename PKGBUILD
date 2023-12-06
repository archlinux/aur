# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=visual-studio-code-insiders-bin
_pkgname=visual-studio-code-insiders
pkgver=1701813982
pkgrel=1
pkgdesc="Editor for building and debugging modern web and cloud applications (insiders version)"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://code.visualstudio.com/"
license=('custom: commercial')
# lsof: need for terminal splitting, see https://github.com/Microsoft/vscode/issues/62991
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof)
optdepends=('glib2: Needed for move to trash functionality'
            'libdbusmenu-glib: Needed for KDE global menu')
provides=(vscode)

pkgver() {
    if [ "${CARCH}" = "x86_64" ]; then
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://update.code.visualstudio.com/latest/linux-x64/insider); echo "${ADDR[7]}" | sed 's/code-insider-x64-//g' | sed 's/.tar.gz//g' | sed 's/-/./g'
    elif [ "${CARCH}" = "aarch64" ]; then
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://update.code.visualstudio.com/latest/linux-arm64/insider); echo "${ADDR[7]}" | sed 's/code-insider-arm64-//g' | sed 's/.tar.gz//g' | sed 's/-/./g'
    elif [ "${CARCH}" = "armv7h" ]; then
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://update.code.visualstudio.com/latest/linux-armhf/insider); echo "${ADDR[7]}" | sed 's/code-insider-armhf-//g' | sed 's/.tar.gz//g' | sed 's/-/./g'
    else
        IFS='/' read -ra ADDR <<< $(curl -ILs -o /dev/null -w %{url_effective} https://update.code.visualstudio.com/latest/linux-ia32/insider); echo "${ADDR[7]}" | sed 's/code-insider-//g' | sed 's/.tar.gz//g' | sed 's/-/./g'
    fi
}
source=(${_pkgname}.desktop ${_pkgname}-url-handler.desktop ${_pkgname}-bin.sh)
source_x86_64=(code_x64_${pkgver}.tar.gz::https://update.code.visualstudio.com/latest/linux-x64/insider)
source_aarch64=(code_arm64_${pkgver}.tar.gz::https://update.code.visualstudio.com/latest/linux-arm64/insider)
source_armv7h=(code_armhf_${pkgver}.tar.gz::https://update.code.visualstudio.com/latest/linux-armhf/insider)
source_i686=(code_ia32_${pkgver}.tar.gz::https://update.code.visualstudio.com/latest/linux-ia32/insider)

sha256sums=('d18aab23c38721aa210fa074a8dc035c607114e6a742260be814ab2538f65c65'
            '1868bcb6c3e6d58863609d49fca0ad2d9c48286bdcb8880026a2a969d49e66ac'
            '67d83f676135ca14806aab7292361a4a737f3076527860258176c886cdb3f0c1')
sha256sums_x86_64=('SKIP')
sha256sums_i686=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')
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
