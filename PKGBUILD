# Maintainer: Kevin Brodsky <corax26 'at' gmail 'dot' com>

pkgname=xnviewmp-system-libs
_pkgname=xnviewmp
pkgver=1.12.2
srcrel=1 # Incremented when there is a new release for the same version number
pkgrel=1
pkgdesc="An efficient multimedia viewer, browser and converter (using system libraries)."
url="https://www.xnview.com/en/xnviewmp/"

arch=('x86_64')
license=('custom')
depends=(
  # Main Qt dependencies
  'qt6-multimedia' 'qt6-networkauth' 'qt6-svg'
  # libmdk dependency
  'libc++'
  # Plugin libs
  'libjxl' 'libwebp' 'openjpeg2' 'openexr'
)
optdepends=('glib2: support for moving files to trash')
conflicts=('xnviewmp')

source=("XnViewMP-linux-x64_${pkgver}-rel${srcrel}.tgz::https://download.xnview.com/old_versions/XnView_MP/XnView_MP-${pkgver}-linux-x64.tgz"
        'xnview.sh'
        'XnView.desktop')
sha256sums=('66faa259a1377f5f055b089ea182b8596a0d495790778798b27d763344984e64'
            'dfa7a714cc4f87d0ba26e5db4abf9b5ec633c9edb53bf3967ac814c4f8b44c30'
            'f6b3a4aaa0a55b5f21d9b91ab6f3da3d6ee077ba7fdd17e7c4ab1c69ad2a9e3a')

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
  ln -s /usr/lib/libOpenEXR.so "${pkg_opt_dir}/Plugins/libOpenEXR.so"
  ln -s /usr/lib/libopenjp2.so "${pkg_opt_dir}/Plugins/openjp2.so"
  # This seems to be a custom library that links against libjxl and is required
  # for opening JPEG XL images, use it as-is.
  install -D -m644 "Plugins/libJPEGXL.so" -t "${pkg_opt_dir}/Plugins"

  # Using the system libraw doesn't seem to work (assertion failure in libc when
  # attempting to view a RAW file), use the one provided.
  install -D -m644 "lib/liblibraw.so.1" -t "${pkg_opt_dir}/lib"
  # There is no package for libmdk, which is anyway distributed as binary, so
  # just use the one provided.
  install -D -m644 "lib/libmdk.so.0" -t "${pkg_opt_dir}/lib"
  # From Adobe XMP Toolkit SDK, apparently not packaged on Arch.
  install -D -m644 "lib/libXMPCore.so" -t "${pkg_opt_dir}/lib"
  install -D -m644 "lib/libXMPFiles.so" -t "${pkg_opt_dir}/lib"

  install -m755 "${srcdir}/xnview.sh" "${pkg_opt_dir}"

  install -d -m755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/xnview.sh" "${pkgdir}/usr/bin/${_pkgname}"

  install -D -m644 "${srcdir}/XnView.desktop" -t "${pkgdir}/usr/share/applications/"
  install -D -m644 "${srcdir}/XnView/license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
