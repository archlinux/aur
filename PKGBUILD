# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_distro="archlinux"
_pkgbase="${_pkg}-profiles"
profile=desktop
pkgname="${_distro}-${profile}"
pkgver="$(date +%Y.%m.%d)"
pkgrel=1
pkgdesc='Builds an Archlinux desktop'
arch=('any')
license=('AGPL3')
url="https://gitlab.${_distro}.org/tallero/${_pkgbase}"
depends=('archiso-persistent-git'
	 'cryptsetup-nested-cryptkey'
	 'dwm'
	 'fakepkg'
	 'mkinitcpio-archiso-encryption-git'
	 'plymouth-nested-cryptkey'
         'polkit')
makedepends=('devtools' 'git' "${_pkgbase}-git')
checkdepends=('shellcheck')
sha256sums=('SKIP')

# shellcheck disable=SC2154
package() {
  local _dest="${pkgdir}/usr/share/${_distro}"
  local _profile="${srcdir}/${_pkgbase}/${profile}"
  local _build_repo="${srcdir}/${_pkgbase}/.gitlab/ci/build_repo.sh"
  cp -r "/usr/share/archiso-profiles/${profile}" "${_profile}"
  cd "${_profile}" || exit
  mkdir -p work
  "${_build_repo} fakepkg"
  install -d -m 0755 -- "${_dest}"
  pkexec mkarchiso -v \
	           -o "${_dest}" \
		   -w "${_profile}/work" \
                      "${_profile}"
}
