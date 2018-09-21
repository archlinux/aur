# Maintainer: Kevin Brodsky <corax26 'at' gmail 'dot' com>

pkgname=xnviewmp-system-libs
_pkgname=xnviewmp
pkgver=0.92
srcrel=1 # Incremented when there is a new release for the same version number
pkgrel=1
pkgdesc="An efficient multimedia viewer, browser and converter (using system libraries)."
url="http://www.xnview.com/en/xnviewmp/"

arch=('x86_64' 'i686')
license=('custom')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-x11extras' 'qtav' 'desktop-file-utils')
optdepends=('gvfs: support for moving files to trash')
conflicts=('xnviewmp')

source=('xnviewmp.desktop')
source_x86_64=("XnViewMP-linux-x64_${pkgver}-rel${srcrel}.tgz::http://download.xnview.com/XnViewMP-linux-x64.tgz")
source_i686=("XnViewMP-linux_${pkgver}-rel${srcrel}.tgz::http://download.xnview.com/XnViewMP-linux.tgz")
md5sums=('24f44d5a881b94daf48775213a57e4ec')
md5sums_x86_64=('4b636f75b99f31c2c8a46c00704f4d36')
md5sums_i686=('17e8ab2a1de48c8d9bd5f4a42bfac83e')

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
  # Since we are using system Qt libraries, we should also use the system Qt
  # plugins. Unfortunately using the system path doesn't quite work because of a
  # bug when Qt's loader tries to use libqxcb-egl-integration.so, which is
  # not provided by XnView.
  # As a workaround, remove the provided plugin directories and symlink the
  # system ones instead.
  local dir
  for dir in "${pkgdir}/opt/${_pkgname}/lib/"*; do
    rm -r "${dir}"
    ln -s "/usr/lib/qt/plugins/$(basename "${dir}")" "${dir}"
  done
  # Since system directories are not looked up, it may be useful to have
  # additional symlinks for other plugin directories, even though they are not
  # normally provided with XnView.
  for dir in "styles"; do
    ln -s "/usr/lib/qt/plugins/${dir}" "${pkgdir}/opt/${_pkgname}/lib/"
  done
}

# vim:set ts=2 sw=2 et:
