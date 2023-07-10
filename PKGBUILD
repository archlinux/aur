# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

# shellcheck disable=SC2034
_pkgbase=mkinitcpio-archiso
variant="encryption"
_pkgname="${_pkgbase}-${variant}"
pkgname="${_pkgname}-git"
pkgver=v65
pkgrel=1
pkgdesc="Initcpio scripts used by archiso (encrypt hook support)"
arch=(any)
_gitlab="https://gitlab.archlinux.org"
url="${_gitlab}/mkinitcpio/mkinitcpio-archiso/-/merge_requests/25"
license=(GPL3)
depends=(
  bash
  device-mapper
  mkinitcpio
  cryptsetup
)
conflicts=("${_pkgbase}")
conflicts+=("${_pkgname}")
provides=("${_pkgbase}")
provides+=("${_pkgname}")
makedepends=(git)
checkdepends=(shellcheck shfmt)
optdepends=(
  'curl: for PXE over HTTP'
  'mkinitcpio-nfs-utils: for PXE over NFS'
  'nbd: for PXE over NBD'
  'pv: for status display during copy to RAM'
)
source=("${_pkgbase}::git+${_gitlab}/tallero/${_pkgbase}.git#branch=crypto")
sha256sums=('SKIP')

# shellcheck disable=SC2154
pkgver() {
  cd "${srcdir}/${_pkgbase}" || exit
  git describe --tags | sed 's/-/+/g'
}

check() {
  make -k check -C "${_pkgbase}"
}

package() {
  make DESTDIR="$pkgdir/" PREFIX=/usr install -C "${_pkgbase}"
}
