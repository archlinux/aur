# Maintainer: Kevin Brodsky <corax26 'at' gmail 'dot' com>

pkgname=xnviewmp-system-libs
_pkgname=xnviewmp
pkgver=0.98.0
srcrel=1 # Incremented when there is a new release for the same version number
pkgrel=1
pkgdesc="An efficient multimedia viewer, browser and converter (using system libraries)."
url="http://www.xnview.com/en/xnviewmp/"

arch=('x86_64')
license=('custom')
depends=(
  # Main Qt dependencies
  'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-x11extras'
  # Needed since 0.91: https://newsgroup.xnview.com/viewtopic.php?f=82&t=37907
  'qtav'
  # Plugin libs
  'libwebp' 'openjpeg2' 'openexr'
)
optdepends=('glib2: support for moving files to trash')
conflicts=('xnviewmp')

source=("XnViewMP-linux-x64_${pkgver}-rel${srcrel}.tgz::http://download.xnview.com/XnViewMP-linux-x64.tgz"
        'xnview.sh'
        'xnviewmp.desktop'
        'qt5_std_fun_forwarder.S'
        'qt5_std_fun_forwarder.lds')
sha256sums=('D818DCABD0F5BDDF6804F579F6BEF52EAC81F64F073241E0EB55D77F25890771'
            '2DAAC0261789B79AA056EB7E38C9B4E9853EB7DE30A8BF4232EBEE7D81D4295C'
            'F6B3A4AAA0A55B5F21D9B91AB6F3DA3D6EE077BA7FDD17E7C4AB1C69AD2A9E3A'
            'C35FE8CD0AD76F77C0117DE1D81A8C3945D6E472D7663D6D5645592C18809423'
            '3D6DA484CD55EAC8910D5CF87F9057E6EADEAC842A249DCBDA35E1C6F3FCDC0D')

# There is a lot of useless files in the archive, only install those from that
# list.
installed_files_dirs=(
  AddOn
  country.txt
  language
  license.txt
  PrintPresets.txt
  ResizePresets.txt
  UI
  WhatsNew.txt
  XnView
  xnview_2.png
  xnview.png
)

executable_files=(
  AddOn/exiftool
  XnView
)

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
  cd "${srcdir}/XnView"

  local pkg_opt_dir=${pkgdir}/opt/${_pkgname}

  install -d -m755 "${pkg_opt_dir}"
  # The permissions set in the archive are unreliable and excessive (too many
  # executable files). Instead of copying them, we chmod the files that
  # actually need to be executable.
  cp -r --no-preserve=mode "${installed_files_dirs[@]}" "${pkg_opt_dir}"
  for file in "${executable_files[@]}"; do
    chmod a+x "${pkg_opt_dir}/${file}"
  done

  # The plugin libs that XnView packages are included as dependencies, but
  # XnView will only look for them in the Plugins directory (regardless of the
  # linker paths). Create symlinks as needed.
  install -d -m755 "${pkg_opt_dir}/Plugins"
  ln -s /usr/lib/libwebp.so "${pkg_opt_dir}/Plugins/libwebp.so"
  ln -s /usr/lib/libIlmImf.so "${pkg_opt_dir}/Plugins/IlmImf.so"
  ln -s /usr/lib/libopenjp2.so "${pkg_opt_dir}/Plugins/openjp2.so"

  install -m755 "${srcdir}/xnview.sh" "${pkg_opt_dir}"

  # Install our "function forwarder library" (see build()). xnview.sh forces the
  # dynamic linker to use it by adding it to LD_PRELOAD.
  install -D -m644 "${srcdir}/qt5_std_fun_forwarder.so" -t "${pkg_opt_dir}/lib"

  install -d -m755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/xnview.sh" "${pkgdir}/usr/bin/${_pkgname}"

  install -D -m644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -D -m644 "${srcdir}/XnView/license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
