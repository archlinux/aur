# Maintainer: Alex Potapenko <opotapenko@gmail.com>
# Submitter and original maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>

pkgname=vmware-host-modules-dkms-git
_pkgname=vmware-host-modules
pkgver=17.5.1.d20240112.083033.g2c6d66f
_branch_version=17.5.1
url='https://github.com/mkubecek/vmware-host-modules'
pkgrel=1
epoch=2
pkgdesc='VMware (Player and Workstation) host kernel modules with patches needed to build against recent kernels'
arch=('x86_64' 'aarch64' 'i386')
license=('GPL2')
provides=(vmware-host-modules-dkms vmware-host-modules)
conflicts=(vmware-host-modules-dkms vmware-host-modules)
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
  git log -n1 --format="%at %h" | awk "{print \"${_branch_version}.d\" strftime(\"%Y%m%d.%H%M%S.g\",\$1) \$2}"
}

package() {
  install -dm755 "${pkgdir}/usr/src/vmmon-1"
  install -dm755 "${pkgdir}/usr/src/vmnet-1"
  cp -r "${srcdir}/${_pkgname}/vmmon-only/"* "${pkgdir}/usr/src/vmmon-1/"
  cp -r "${srcdir}/${_pkgname}/vmnet-only/"* "${pkgdir}/usr/src/vmnet-1/"
  cp "${srcdir}/dkms-vmmon.conf" "${pkgdir}/usr/src/vmmon-1/dkms.conf"
  cp "${srcdir}/dkms-vmnet.conf" "${pkgdir}/usr/src/vmnet-1/dkms.conf"
}
