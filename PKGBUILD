# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_distro="archlinux"
distro="Arch Linux"
_pkgbase="${_pkg}-profiles"
profile="baseline"
_pkgname="${_distro}-${profile}"
pkgname=("${_pkgname}-libvirt")
pkgver="v1.0"
pkgrel=1
pkgdesc="${distro} ${profile} (libvirt VM)."
arch=('x86_64'
      'i686'
      'pentium4')
license=('AGPL3')
url="https://gitlab.${_distro}.org/tallero/${_pkgbase}"
depends=("${_pkgname}"
	 "libvirt")
makedepends=("python")
checkdepends=('libvirt'
              'shellcheck')
source=("${_pkg}-template.xml"
	"${_pkg}-storage-template.xml"
	"${_pkg}-storage-private-template.xml"
        "uuidgen")
sha256sums=("SKIP"
	    "SKIP"
	    "SKIP"
	    "ef927dee368018633409f651b200cba4623a305a90c917fb3eb3d119446194bd")

## shellcheck disable=SC2154
prepare() {
  local _uuidgen="${srcdir}/uuidgen"
  chmod +x "${_uuidgen}"
  sed "s|%UUID%|$("${_uuidgen}")|g;
       s|%_DISTRO%|${_distro}|g;
       s|%DISTRO%|${distro}|g;
       s|%PROFILE%|${profile}|g;
       s|%_PKGNAME%|${_pkgname}|g" "${_pkg}-template.xml" > "${_pkgname}.xml"
  sed "s|%_PKGNAME%|${_pkgname}|g;
       s|%UUID%|$("${_uuidgen}")|g;
       s|%DISTRO%|${_distro}|g" "${_pkg}-storage-template.xml" > "${_pkgname}-storage.xml"
  sed "s|%_PKGNAME%|${_pkgname}|g;
       s|%UUID%|$("${_uuidgen}")|g;
       s|%DISTRO|${_distro}|g" "${_pkg}-storage-private-template.xml" > "${_pkgname}-storage-private.xml"
}

## shellcheck disable=SC2154
package() {
  local _libvirt="${pkgdir}/etc/libvirt"
  local _qemu="${_libvirt}/qemu"
  local _storage="${_libvirt}/storage"
  install -dm755 "${_qemu}"
  install -dm755 "${_storage}"
  install -Dm644 "${_pkgname}.xml" "${_qemu}"
  install -Dm644 "${_pkgname}-storage.xml" "${_storage}"
  install -Dm644 "${_pkgname}-storage-private.xml" "${_storage}"
}
