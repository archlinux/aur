# Maintainer: Kevin Brodsky <corax26 'at' gmail 'dot' com>

pkgname=xnviewmp-system-libs
_pkgname=xnviewmp
pkgver=0.94.2
srcrel=1 # Incremented when there is a new release for the same version number
pkgrel=1
pkgdesc="An efficient multimedia viewer, browser and converter (using system libraries)."
url="http://www.xnview.com/en/xnviewmp/"

arch=('x86_64')
license=('custom')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-x11extras' 'qtav' 'desktop-file-utils')
optdepends=('glib2: support for moving files to trash')
conflicts=('xnviewmp')

source=("XnViewMP-linux-x64_${pkgver}-rel${srcrel}.tgz::http://download.xnview.com/XnViewMP-linux-x64.tgz"
        'xnviewmp.desktop'
        'qt5_std_fun_forwarder.S'
        'qt5_std_fun_forwarder.lds')
md5sums=('d6b931db8cf42aefe770581afb0184ad'
         '24f44d5a881b94daf48775213a57e4ec'
         'df94e031306ac22f7f19d38bf3023c1a'
         '7fc3b01ef6eb321c5ecba75099e08d33')

build() {
  # This is massive hack to work around an incompatibility with the system Qt5
  # libraries. Starting with 0.93.1, the dynamic linker fails to start XnView,
  # complaining that:
  #   symbol _ZNSt20bad_array_new_lengthD1Ev version Qt_5 not defined in file libQt5Gui.so.5 with link time reference
  # (and other functions related to the std::bad_array_new_length class).
  #
  # It seems that the Qt5 libraries shipped in the archive changed in 0.93.1,
  # and they now declare these functions, but our system libs on Arch don't!
  # Since these are STL functions, the workaround is to manually define these
  # functions in a tiny shared library, and implement them by calling the STL
  # functions in libstdc++. This is frankly horrible, but on the bright side,
  # these functions should never be called anyway (if an
  # std::bad_array_new_length exception is thrown, it will most likely make
  # XnView crash).
  gcc -fPIC -shared -lstdc++ \
    -Wl,--version-script="${srcdir}/qt5_std_fun_forwarder.lds" \
    -o "${srcdir}/qt5_std_fun_forwarder.so" \
    "${srcdir}/qt5_std_fun_forwarder.S" 
}

package() {
  install -d -m755 "${pkgdir}/opt/${_pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/applications"

  cp -a "${srcdir}/XnView"/* "${pkgdir}/opt/${_pkgname}"
  ln -s "/opt/${_pkgname}/xnview.sh" "${pkgdir}/usr/bin/${_pkgname}"

  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 "${srcdir}/XnView/license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # Clean up
  rm "${pkgdir}/opt/${_pkgname}/XnView.desktop"
  chmod 644 "${pkgdir}/opt/${_pkgname}"/xnview*.png
  chmod 755 "${pkgdir}/opt/${_pkgname}/XnView"

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

  # Install our "function forwarder library" (see build()) and force the dynamic
  # linker to use it by adding to LD_PRELOAD.
  install -m644 "${srcdir}/qt5_std_fun_forwarder.so" "${pkgdir}/opt/${_pkgname}/lib"
  sed -i '/exec/ i \
export LD_PRELOAD="$dirname/lib/qt5_std_fun_forwarder.so:$LD_PRELOAD"' \
    "${pkgdir}/opt/${_pkgname}/xnview.sh"
}

# vim:set ts=2 sw=2 et:
