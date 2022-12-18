# Maintainer: Kevin Brodsky <corax26 'at' gmail 'dot' com>

pkgname=xnviewmp-system-libs
_pkgname=xnviewmp
pkgver=1.4.0
srcrel=1 # Incremented when there is a new release for the same version number
pkgrel=2
pkgdesc="An efficient multimedia viewer, browser and converter (using system libraries)."
url="https://www.xnview.com/en/xnviewmp/"

arch=('x86_64')
license=('custom')
depends=(
  # Main Qt dependencies
  'qt5-multimedia' 'qt5-svg' 'qt5-webengine' 'qt5-sensors' 'qt5-x11extras'
  # libmdk dependency
  'libc++'
  # Plugin libs
  'libwebp' 'openjpeg2' 'openexr'
)
optdepends=('glib2: support for moving files to trash')
conflicts=('xnviewmp')

source=("XnViewMP-linux-x64_${pkgver}-rel${srcrel}.tgz::https://download.xnview.com/XnViewMP-linux-x64.tgz"
        'xnview.sh'
        'xnviewmp.desktop'
        'qt5_std_fun_forwarder.S'
        'qt5_std_fun_forwarder.lds')
sha256sums=('6EF3D6EE272CC9293084952A90BF936131128671C5F74791A84185AD733EDBAE'
            '87ec80c5049745dc3018fcdcf4dddf0e877ae3b20706705f2a80715232ad2141'
            'F6B3A4AAA0A55B5F21D9B91AB6F3DA3D6EE077BA7FDD17E7C4AB1C69AD2A9E3A'
            'D16B4F1ABA4664B169211FD0FE2FF27892AA02F60A5C7C50F55D43FAB0E255DC'
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
  # libraries. On 0.93.1, the dynamic linker fails to start XnView, complaining
  # that:
  #   symbol _ZNSt20bad_array_new_lengthD1Ev version Qt_5 not defined in file libQt5Gui.so.5 with link time reference
  # (and other functions related to the std::bad_array_new_length class).
  #
  # It seems that the Qt5 libraries shipped in the archive changed in 0.93.1,
  # and they now declare these functions, but our system libs on Arch don't!
  # Since these are STL functions, the workaround is to manually define these
  # functions in a tiny shared library, and implement them by calling the STL
  # functions in libstdc++. This is frankly horrible, but it has worked fine
  # since 0.93.1 so fingers crossed it will stay this way!
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

  # Using the system libraw doesn't seem to work (assertion failure in libc when
  # attempting to view a RAW file), use the one provided.
  install -D -m644 "lib/liblibraw.so.1" -t "${pkg_opt_dir}/lib"
  # There is no package for libmdk, which is anyway distributed as binary, so
  # just use the one provided.
  install -D -m644 "lib/libmdk.so.0" -t "${pkg_opt_dir}/lib"

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
