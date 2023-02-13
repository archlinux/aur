# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>

pkgname=vmware-host-modules-dkms-git
_pkgname=vmware-host-modules
pkgver=w17.0.1.r12.g78b7781
_pkgver=$(echo $pkgver | cut -c 2-7)
url='https://github.com/mkubecek/vmware-host-modules'
pkgrel=1
epoch=1
pkgdesc='Patches needed to build VMware Player host modules against recent kernels'
arch=('x86_64' 'aarch64' 'i386')
license=('GPL2')
provides=(vmware-host-modules-dkms vmware-host-modules)
conflicts=(vmware-host-modules-dkms vmware-host-modules vmware-workstation)
depends=('dkms')
makedepends=('git' 'fd')
source=("git+https://github.com/mkubecek/${_pkgname}.git#branch=workstation-$_pkgver"
        dkms-vmmon.conf
        dkms-vmnet.conf)
sha256sums=('SKIP'
            'ed52e41b8f2b525915d47c350f4e6dec064b01d6f894e32b513a01e0f1162c4d'
            'b218e4ec45f5c2f960333d209442a0a98fa525ee034947c0be724f2f77d0a4a9')
pkgver(){
  cd ${srcdir}/${_pkgname}
  git describe --long | sed 's/p//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -dm755 "${pkgdir}/usr/src/vmmon-1"
  install -dm755 "${pkgdir}/usr/src/vmnet-1"
  cp -r "${srcdir}/${_pkgname}/vmmon-only/"* "${pkgdir}/usr/src/vmmon-1/"
  cp -r "${srcdir}/${_pkgname}/vmnet-only/"* "${pkgdir}/usr/src/vmnet-1/"
  cp "${srcdir}/dkms-vmmon.conf" "${pkgdir}/usr/src/vmmon-1/dkms.conf"
  cp "${srcdir}/dkms-vmnet.conf" "${pkgdir}/usr/src/vmnet-1/dkms.conf"
  cd "${srcdir}/${_pkgname}/"
  # is there even a point to doing this?
  #make clean
  #make
  #make DESTDIR="${pkgdir}/usr/src/" install

  # nuke files we don't want
  for file in o cmd symvers order ko mod
  do
  fd -HIig -tf '*.${file}' ${pkgdir}/usr/src/ -X rm
  done
  fd -HIig -tf 'mod.c' ${pkgdir}/usr/src/ -X rm
}
# vim:set ts=2 sw=2 etc
