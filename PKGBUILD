# Maintainer: Alex Potapenko <opotapenko@gmail.com>
# Submitter and original maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Temporary Maintainer: bluetail
pkgname=vmware-host-modules-dkms-fix-git
_pkgname=vmware-host-modules
pkgver=17.6.3.r17.g6797e55
_branchversion=17.6.3
url="https://github.com/philipl/vmware-host-modules"
pkgrel=1
epoch=2
pkgdesc="VMware (Player and Workstation) host kernel modules with patches needed to build against recent kernels"
arch=('x86_64' 'aarch64' 'i386')
license=('GPL2')
provides=(vmware-host-modules-dkms vmware-host-modules)
conflicts=(vmware-host-modules-dkms vmware-host-modules)
depends=('dkms')
makedepends=('git')
source=(
  "${_pkgname}::git+https://github.com/philipl/vmware-host-modules.git#commit=6797e552638a28d1fa1e9ebd7ab5d3c628671ba0"
  dkms-vmmon.conf
  dkms-vmnet.conf
)
sha256sums=('SKIP'
            'ed52e41b8f2b525915d47c350f4e6dec064b01d6f894e32b513a01e0f1162c4d'
            'b218e4ec45f5c2f960333d209442a0a98fa525ee034947c0be724f2f77d0a4a9')

pkgver() {
  cd "${_pkgname}"
  # Get the latest tag and commit info
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^workstation-//;s/^w//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # The repository should already be at the correct commit
}

package() {
  install -dm755 "${pkgdir}/usr/src/vmmon-${_branchversion}"
  install -dm755 "${pkgdir}/usr/src/vmnet-${_branchversion}"
  
  cp -r "${srcdir}/${_pkgname}/vmmon-only/"* "${pkgdir}/usr/src/vmmon-${_branchversion}/"
  cp -r "${srcdir}/${_pkgname}/vmnet-only/"* "${pkgdir}/usr/src/vmnet-${_branchversion}/"
  
  # Install DKMS configs
  cp "${srcdir}/dkms-vmmon.conf" "${pkgdir}/usr/src/vmmon-${_branchversion}/dkms.conf"
  cp "${srcdir}/dkms-vmnet.conf" "${pkgdir}/usr/src/vmnet-${_branchversion}/dkms.conf"
}
