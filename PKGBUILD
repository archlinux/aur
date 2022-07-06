# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_distro="archlinux"
_pkgbase="${_pkg}-profiles"
_profile=baseline
pkgname="${_distro}-${_profile}"
pkgver=v0.1+11+g1afb2fc
pkgrel=1
pkgdesc='Builds an Archlinux install drive (encrypted)'
arch=('any')
license=('GPL3')
url="https://gitlab.${_distro}.org/tallero/${_pkgbase}"
depends=('archiso-persistent-git'
	 'cryptsetup-nested-cryptkey'
	 'fakepkg'
	 'mkinitcpio-archiso-encryption-git'
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
  install -d -m 0755 -- "${_profile}"
  cp -r "/usr/share/${_pkg}/configs/releng" "${_profile}"
  cd "${_profile}" || exit

  mkdir -p work
  ./build_repo.sh fakepkg
  install -d -m 0755 -- "${_dest}"
  pkexec mkarchiso -v \
	           -o "${_dest}" \
		   -w "${_profile}/work" \
                      "${_profile}"
}
