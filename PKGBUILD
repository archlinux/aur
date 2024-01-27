#Maintainer: archdevlab <https://github.com/archdevlab>

major=2024.Q1.1

pkgbase=amdvlk-bin
pkgname=(amdvlk-bin lib32-amdvlk-bin)
pkgver=${major}
pkgrel=1
arch=(x86_64)
url='https://github.com/GPUOpen-Drivers/AMDVLK'
license=(MIT)
source=(https://github.com/GPUOpen-Drivers/AMDVLK/releases/download/v-${major}/amdvlk_${major}_amd64.deb
        https://github.com/GPUOpen-Drivers/AMDVLK/releases/download/v-${major}/amdvlk_${major}_i386.deb)

extract_deb(){
  local tmpdir="$(basename "${1%.deb}")"
  rm -Rf "$tmpdir"
  mkdir "$tmpdir"
  cd "$tmpdir"
  ar x "$1"
  tar -C "${pkgdir}" -xf data.tar.gz
}

move_libdir(){
  local deb_libdir="$1"
  local arch_libdir="$2"

  if [ -d "${pkgdir}/${deb_libdir}" ]; then
    if [ ! -d "${pkgdir}/${arch_libdir}" ]; then
      mkdir -p "${pkgdir}/${arch_libdir}"
    fi
    mv -t "${pkgdir}/${arch_libdir}/" "${pkgdir}/${deb_libdir}"/*
    find ${pkgdir} -type d -empty -delete
  fi
}

move_copyright(){
  find ${pkgdir}/usr/share/doc -name "changelog.Debian.gz" -delete
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  find ${pkgdir}/usr/share/doc -name "copyright" -exec mv {} ${pkgdir}/usr/share/licenses/${pkgname} \;
  find ${pkgdir}/usr/share/doc -type d -empty -delete
}

package_amdvlk-bin(){
  pkgdesc="AMD's standalone Vulkan driver (Stable DEB Release)"
  arch=(x86_64)
  conflicts=(amdvlk)
  provides=(amdvlk vulkan-driver)

  extract_deb "${srcdir}"/amdvlk_${major}_amd64.deb

  move_libdir "usr/lib/x86_64-linux-gnu" "usr/lib"
  move_libdir "etc" "usr/share"

  sed -i 's|/x86_64-linux-gnu||' "$pkgdir/"usr/share/vulkan/icd.d/amd_icd64.json
  sed -i 's|/x86_64-linux-gnu||' "$pkgdir/"usr/share/vulkan/implicit_layer.d/amd_icd64.json
  mv "$pkgdir/"usr/share/vulkan/implicit_layer.d/amd_icd64.json "$pkgdir/"usr/share/vulkan/implicit_layer.d/amd_icd64.json.hide

  move_copyright
  mv "$pkgdir"/usr/share/doc/amdvlk/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/
  rm -rf "$pkgdir"/usr/share/doc

  # fix package file permission
  # filesystem: 755  package: 775
  chmod -R 755 "$pkgdir"/usr
}

package_lib32-amdvlk-bin(){
  pkgdesc="AMD's standalone Vulkan driver (32-bit) (Stable DEB Release)"
  arch=(i686 x86_64)
  depends=(amdvlk-bin=${major})
  conflicts=(lib32-amdvlk)
  provides=(lib32-amdvlk lib32-vulkan-driver)

  extract_deb "${srcdir}"/amdvlk_${major}_i386.deb

  move_libdir "usr/lib/i386-linux-gnu" "usr/lib32"
  move_libdir "etc" "usr/share"

  sed -i 's|/i386-linux-gnu||' "$pkgdir/"usr/share/vulkan/icd.d/amd_icd32.json
  sed -i 's|/lib|/lib32|' "$pkgdir/"usr/share/vulkan/icd.d/amd_icd32.json
  sed -i 's|/i386-linux-gnu||' "$pkgdir/"usr/share/vulkan/implicit_layer.d/amd_icd32.json
  sed -i 's|/lib|/lib32|' "$pkgdir/"usr/share/vulkan/implicit_layer.d/amd_icd32.json

  mv "$pkgdir/"usr/share/vulkan/implicit_layer.d/amd_icd32.json "$pkgdir/"usr/share/vulkan/implicit_layer.d/amd_icd32.json.hide

  move_copyright
  mv "$pkgdir"/usr/share/doc/amdvlk/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/
  rm -rf "$pkgdir"/usr/share/doc

  # fix package file permission
  # filesystem: 755  package: 775
  chmod -R 755 "$pkgdir"/usr
}

sha256sums=('187a112daa9cb0f4673610e87646a09acec3472b9b597dacda6e0513379a9139'
            'ba7894c6f557422fb02db34195dc2645c16e3f462d53e20346cf4b8e4cf2ccd7')

# vim:set ts=8 sts=2 sw=2 et:
