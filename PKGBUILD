# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_distro="archlinux"
_pkgbase="${_pkg}-profiles"
_profile=desktop
pkgname="${_distro}-${_profile}"
pkgver=v0.1+10+gb5d2eef
pkgrel=1
pkgdesc='Builds an Archlinux desktop'
arch=('any')
license=('GPL3')
url="https://gitlab.${_distro}.org/tallero/${_pkgbase}"
depends=('cryptsetup-nested-cryptkey'
	 'dwm'
	 'fakepkg'
	 'mkinitcpio-archiso-encryption-git'
	 'plymouth-nested-cryptkey'
         'polkit')
makedepends=('devtools' 'git')
checkdepends=('shellcheck')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "archiso-profiles" || exit
  git describe --tags | sed 's/-/+/g'
}

package() {
  # shellcheck disable=SC2154
  local _dest="${pkgdir}/usr/share/${_distro}"
  local _profile="${srcdir}/${_pkgbase}/${_profile}"
  cd "${_profile}" || exit

  mkdir work
  ./build_repo.sh fakepkg
  install -d -m 0755 -- "${_dest}"

  pkexec mkarchiso -v "${_profile}" \
	           -o "${_dest}" \
		   -w "${_profile}/work" \
                      "${_profile}"
}
