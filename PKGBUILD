# Maintainer: Alex Potapenko <opotapenko@gmail.com>
# Submitter and original maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>

pkgname=vmware-host-modules-dkms-git
_pkgname=vmware-host-modules
pkgver=17.5.0.d20240112.2c6d66f
_branch_version=17.5.0
url='https://github.com/mkubecek/vmware-host-modules'
pkgrel=2
epoch=2
pkgdesc='VMware (Player and Workstation) host kernel modules with patches needed to build against recent kernels'
arch=('x86_64' 'aarch64' 'i386')
license=('GPL2')
provides=(vmware-host-modules-dkms vmware-host-modules)
conflicts=(vmware-host-modules-dkms vmware-host-modules vmware-workstation)
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/mkubecek/${_pkgname}.git#branch=workstation-${_branch_version}"
        dkms-vmmon.conf
        dkms-vmnet.conf)
sha256sums=('SKIP'
            'ed52e41b8f2b525915d47c350f4e6dec064b01d6f894e32b513a01e0f1162c4d'
            'b218e4ec45f5c2f960333d209442a0a98fa525ee034947c0be724f2f77d0a4a9')

pkgver(){
  cd ${srcdir}/${_pkgname}
  git show -s --date=short --format=format:"${_branch_version}.d%cd.%h" | tr -d -
}

package() {
  install -dm755 "${pkgdir}/usr/src/vmmon-1"
  install -dm755 "${pkgdir}/usr/src/vmnet-1"
  cp -r "${srcdir}/${_pkgname}/vmmon-only/"* "${pkgdir}/usr/src/vmmon-1/"
  cp -r "${srcdir}/${_pkgname}/vmnet-only/"* "${pkgdir}/usr/src/vmnet-1/"
  cp "${srcdir}/dkms-vmmon.conf" "${pkgdir}/usr/src/vmmon-1/dkms.conf"
  cp "${srcdir}/dkms-vmnet.conf" "${pkgdir}/usr/src/vmnet-1/dkms.conf"
  mkdir -p "$pkgdir/usr/lib/modules-load.d"
  echo -e "vmw_vmci\nvmmon" > "$pkgdir/usr/lib/modules-load.d/vmware.conf"
}
