# Maintainer: bbaa <bbaa@bbaa.fun>
_pkgname=i915-sriov-dkms
pkgname=i915-sriov-dkms-bbaa-git
pkgver=2024.11.20
pkgrel=1
pkgdesc="Linux i915 module patched with SR-IOV support"
arch=('x86_64')
url="https://github.com/bbaa-bbaa/i915-sriov-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
backup=("etc/tmpfiles.d/i915-set-sriov-numvfs.conf")
conflicts=("${_pkgname}" "${_pkgname}-git")
install=${_pkgname}.install
source=("git+https://github.com/bbaa-bbaa/i915-sriov-dkms.git#branch=6.6-base" "i915-set-sriov-numvfs.conf")
sha256sums=('SKIP'
            'e85e4d4c97cb1f6e825c47ea5e3a9c18f10761714307985f67b58c8e55a1e2c2')

package() {
  cd "$srcdir/$_pkgname"
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  cp -rv ${srcdir}/$_pkgname/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  cd "$srcdir"
  install -Dm644 i915-set-sriov-numvfs.conf "${pkgdir}/etc/tmpfiles.d/i915-set-sriov-numvfs.conf"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  grep -oP '(?<=^PACKAGE_VERSION=").*(?="$)' dkms.conf
}
