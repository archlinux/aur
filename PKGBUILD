# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_distro="archlinux"
_pkgbase="${_pkg}-profiles"
profile=baseline
pkgname="${_distro}-${_profile}"
pkgver="$(date +%Y.%m.%d)"
pkgrel=1
pkgdesc="Builds an Archlinux install drive."
arch=('i686'
      'pentium4'
      'x86_64')
license=('AGPL3')
url="https://gitlab.${_distro}.org/tallero/${_pkgbase}"
makedepends=("${_pkg}"
             "git"
             "polkit")
checkdepends=('shellcheck')

# shellcheck disable=SC2154
package() {
  local _pkg_path="/usr/share/${_pkg}"
  local _dest="${pkgdir}/usr/share/${_distro}"
  local _iso="${pkgname}-${pkgver}-x86_64.iso"
  local _profile="${srcdir}/${profile}"
  cp -r "${_pkg_path}/configs/${profile}" "${_profile}"
  cd "${_profile}" || exit
  mkdir -p work
  install -d -m 0755 -- "${_dest}"
  pkexec mkarchiso -v \
	           -o "${_dest}" \
		   -w "${_profile}/work" \
                      "${_profile}"
  mv "${_dest}/${_iso}" "${_dest}/${pkgname}-x86_64.iso"
}
