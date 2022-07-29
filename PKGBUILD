# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_distro="archlinux"
_pkgbase="${_pkg}-profiles"
profile=ebaseline
_pkgname="${_distro}-${profile}"
pkgname="${_distro}-${profile}-git"
pkgver=v0.1+11+g1afb2fc
pkgrel=1
pkgdesc='Builds an Arch Linux desktop'
arch=('any')
license=('GPL3')
url="https://gitlab.${_distro}.org/tallero/${_pkgbase}"
depends=("${_pkg}-encryption"
         "${_pkgbase}"
         "cryptsetup-sigfile"
	 "fakepkg"
	 "mkinitcpio-${_pkg}-encryption")
makedepends=('git')
conflicts=()
checkdepends=('shellcheck')

pkgver() {
  # shellcheck disable=SC2154
  pacman -Q "${_pkgbase}" | awk '{print $2}'
}

# shellcheck disable=SC2154
package() {
  local _pkg_path="usr/share/${_pkg}"
  local _dest="${pkgdir}/usr/share/${_distro}"
  local _iso="${_pkgname}-${pkgver}-x86_64.iso"
  local _keys_iso="${_pkgname}-keys-${pkgver}-x86_64.iso"
  local _profile_src="/${_pkg_path}/configs/${profile}"
  local _profile="${srcdir}/${profile}"
  cp -r "${_profile_src}" "${srcdir}"
  cd "${_profile}" || exit
  mkdir -p work
  mkarchisorepo "fakepkg" "packages.extra"
  install -d -m 0755 -- "${_dest}"
  machinectl shell --uid=0 \
	           --setenv=profile="${profile}" \
		   --setenv=_dest="${_dest}" \
		   mkarchiso -v \
	           -o "${_dest}" \
		   -w "${_profile}/work" \
                      "${_profile}"
  mv "${_dest}/${_iso}" "${_dest}/${pkgname}-x86_64.iso"
  mv "${_dest}/${_keys_iso}" "${_dest}/${pkgname}-keys-x86_64.iso"
}
