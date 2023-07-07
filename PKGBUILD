# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>

# shellcheck disable=SC2034
_pkg=archiso
_variant=encryption
_branch=raid
_pkgname="${_pkg}-${_variant}"
pkgname="${_pkgname}-git"
pkgver=v70.r341.g5684342
pkgrel=1
_pkgdesc=('Tools for creating Arch Linux live and '
	  'install ISO images (LUKS image type support).')
arch=('any')
license=('GPL3')
_ns=tallero
_url="https://gitlab.archlinux.org/${_ns}/${_pkg}"
url="https://gitlab.archlinux.org/archlinux/${_pkg}/-/issues/156"
depends=(
  'arch-install-scripts'
  'bash'
  'cryptsetup-nested-cryptkey'
  'dosfstools'
  'e2fsprogs'
  'erofs-utils'
  'fakeroot'
  'libarchive'
  'libisoburn'
  'mtools'
  'squashfs-tools'
)
makedepends=(
  'git'
  'python-docutils'
)
checkdepends=('shellcheck')
provides=(
  "${_pkg}"
  "${_pkg}-${_variant}"
  "${_pkg}-persistent-git"
  "an${_pkg}"
)
conflicts=(
  "${_pkg}"
  "${_pkg}-${_variant}"
  "${_pkg}-persistent-git"
  "an${_pkg}"
)
optdepends=(
  'archiso-profiles: extra profiles for archiso'
  'edk2-ovmf: for emulating UEFI with run_archiso'
  'openssl: for codesigning support when building netboot artifacts'
  'qemu: for run_archiso'
)
_branch=raid
source=(
  "${_pkg}::git+${_url}#branch=${_branch}"
)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkg}" || exit
  echo "v$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

check() {
  cd "${_pkg}" || exit
  make -k check
}

# shellcheck disable=SC2154
package() {
  local _opts=(
    DESTDIR="${pkgdir}"
    PREFIX=/usr
  )
  cd "${_pkg}" || exit
  make "${_opts[@]}" install
}

# vim:set sw=2 sts=-1 et:
