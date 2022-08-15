# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>

pkgname=vmware-host-modules-dkms-git
_pkgname=vmware-host-modules
pkgver=16.2.4.k5.18.r3.gc06f22f
_pkgver=$(echo $pkgver | cut -c 1-6)
url='https://github.com/mkubecek/vmware-host-modules'
pkgrel=1
pkgdesc='Patches needed to build VMware Player host modules against recent kernels'
arch=('x86_64' 'aarch64' 'i386')
license=('GPL2')
provides=(vmware-host-modules-dkms vmware-host-modules)
depends=('dkms')
makedepends=('git' 'fd')
source=("git+https://github.com/mkubecek/${_pkgname}.git#branch=player-$_pkgver"
        dkms-vmmon.conf
        dkms-vmnet.conf)
sha256sums=('SKIP'
            '25cb7849d46ab89d1d82c702d26e11a2bbf72f77232eddf87ec9689cf6aa17a1'
            '653e457b476b40e6d51d0736e8bc6891d8248e356501a67969ca2c3ff9a8edc3')
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
  make clean
  make
  make DESTDIR="${pkgdir}/usr/src/" install
  for file in o cmd symvers order ko mod mod.c
  do
  fd -HIig0 \*.${file} ${pkgdir}/usr/src/ | xargs -0 rm
  done
}
# vim:set ts=2 sw=2 etc
