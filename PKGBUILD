# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_variant="persistent"
_distro="archlinux"
_pkgbase="${_pkg}-profiles"
profile="ereleng"
pkgname="an${_distro}"
pkgver="$(date +%Y.%m.%d)"
pkgrel=1
pkgdesc="Builds the Arch Linux install drive."
arch=('x86_64'
      'i686'
      'pentium4')
license=('AGPL3')
url="https://gitlab.archlinux.org/archlinux/archiso/-/issues/156"
makedepends=("${_pkg}-${_variant}-git"
             "${_pkgbase}-git"
             "cryptsetup-nested-cryptkey"
             "fakepkg"
             "git"
	     "gnupg"
             "mkinitcpio-${_pkg}-encryption"
             "polkit")
provides=("${_distro}-${profile}"
	  "${_distro}")
checkdepends=('shellcheck')

prepare() {
  gpg_key=$(gpgconf --list-options gpg | awk -F: '$1 == "default-key" {print $10}')
  if [ "${gpg_key}" == "" ]; then
    echo "Generate a GPG key!" || exit
  fi
}

# shellcheck disable=SC2154
package() {
  local _pkg_path="usr/share/${_pkg}"
  local _pkg_lib_path="/usr/lib/${_pkg}"
  local _dest="${pkgdir}/usr/share/${_distro}"
  local _iso="${pkgname}-${pkgver}-x86_64.iso"
  local _keys_iso="${pkgname}-keys-${pkgver}-x86_64.iso"
  local _profile_src="/${_pkg_path}/configs/${profile}"
  local _profile="${srcdir}/${profile}"
  cp -r "${_profile_src}" "${srcdir}"
  cd "${_profile}" || exit
  mkdir -p work
  mkarchisorepo "fakepkg" "packages.extra"
  install -d -m 0755 -- "${_dest}"
  pkexec mkarchiso -v \
	           -g "${gpg_key}" \
	           -o "${_dest}" \
		   -w "${_profile}/work" \
                      "${_profile}"
  mv "${_dest}/${_iso}" "${_dest}/${pkgname}-x86_64.iso"
  mv "${_dest}/${_keys_iso}" "${_dest}/${pkgname}-keys-x86_64.iso"
}
