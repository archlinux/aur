# Maintainer: bbaa <bbaa@bbaa.fun>
_pkgname=i915-sriov-dkms
pkgname=i915-sriov-dkms-bbaa-git
pkgver=2024.12.26.r0.g70ebb59
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
source=("git+https://github.com/bbaa-bbaa/i915-sriov-dkms.git#branch=kernel-v6.12" "i915-set-sriov-numvfs.conf")
sha256sums=('SKIP'
            'e85e4d4c97cb1f6e825c47ea5e3a9c18f10761714307985f67b58c8e55a1e2c2')

package() {
  cd "$srcdir/$_pkgname"

  local module_version
  module_version=$(grep -oP '(?<=^PACKAGE_VERSION=").*(?="$)' dkms.conf)

  echo module_version: $module_version

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${module_version}/dkms.conf

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${_pkgname}-${_module_version}"
  cp -r ${srcdir}/$_pkgname/* "${pkgdir}/usr/src/${_pkgname}-${module_version}"

  cd "$srcdir"
  install -Dm644 i915-set-sriov-numvfs.conf "${pkgdir}/etc/tmpfiles.d/i915-set-sriov-numvfs.conf"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
