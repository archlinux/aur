# Maintainer: zitro <0 ät zitro [point] id>

_main_pkgname=$'linux-cachyos-dbg'
_debug_image=$'/usr/src/debug/linux-cachyos/vmlinux'
pkgdesc=$'Build-id store link for the CachyOS kernel debug image'
arch=($'x86_64')
license=($'GPL-2.0-only')
depends=("${_main_pkgname}")
options=('!strip' '!debug')
pkgrel=1

pkgname="${_main_pkgname}-link"
pkgver=7.2.9_2
pkgver() {
  local dbg_version;
  dbg_version="$(pacman -Q linux-cachyos-dbg | cut -d' ' -f2)";
  printf $'%s\n' "${dbg_version//-/_}";
}

package() {
  local build_id;
  build_id="$(readelf -n "${_debug_image}" | sed -n 's/.*Build ID: //p' | tr 'A-F' 'a-f')";

  if [[ -z ${build_id} ]]; then
    error $'%s states no GNU build-id for its vmlinux\n' "${_main_pkgname}";
    return 1;
  fi

  install -d "${pkgdir}/usr/lib/debug/.build-id/${build_id:0:2}";
  ln -s "${_debug_image}" "${pkgdir}/usr/lib/debug/.build-id/${build_id:0:2}/${build_id:2}.debug";
}
