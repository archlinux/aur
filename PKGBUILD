# Maintainer: Kevin Brodsky <corax26 'at' gmail 'dot' com>

pkgname=xnviewmp-system-libs
_pkgname=xnviewmp
pkgver=0.84
srcrel=2 # Incremented when there is a new release for the same version number
pkgrel=2
pkgdesc="An efficient multimedia viewer, browser and converter (using system libraries)."
url="http://www.xnview.com/en/xnviewmp/"

arch=('x86_64' 'i686')
license=('custom')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-x11extras' 'desktop-file-utils')
optdepends=('gvfs: support for moving files to trash')
conflicts=('xnviewmp')

source=('xnviewmp.desktop')
source_x86_64=("XnViewMP-linux-x64_${pkgver}-rel${srcrel}.tgz::http://download.xnview.com/XnViewMP-linux-x64.tgz")
source_i686=("XnViewMP-linux_${pkgver}-rel${srcrel}.tgz::http://download.xnview.com/XnViewMP-linux.tgz")
md5sums=('24f44d5a881b94daf48775213a57e4ec')
md5sums_x86_64=('290d4448f443a89d1229133a2ef45c65')
md5sums_i686=('fc058e3f58ac49f1dad97ddd2eab550f')

package() {
  install -d -m755 "${pkgdir}/opt/${_pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/applications"

  cp -a "${srcdir}/XnView"/* "${pkgdir}/opt/${_pkgname}"
  ln -s "/opt/${_pkgname}/xnview.sh" "${pkgdir}/usr/bin/${_pkgname}"

  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 "${srcdir}/XnView/license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # Clean up
  rm "${pkgdir}/opt/${_pkgname}/XnView.desktop"{,~}
  chmod -x "${pkgdir}/opt/${_pkgname}/xnview.png"

  # Remove the bundled framework libs (Qt and icu).
  rm "${pkgdir}/opt/${_pkgname}/lib/"lib*
  # XnView MP does a weird font lookup with random results under certain
  # circumstances, when not using the bundled libs. It seems that forcing
  # QT_QPA_PLATFORMTHEME to be the shipped platform theme solves the issue.
  sed -i 's/^exec/export QT_QPA_PLATFORMTHEME=gtk2\n\0/' "${pkgdir}/opt/${_pkgname}/xnview.sh"
}

# vim:set ts=2 sw=2 et:
