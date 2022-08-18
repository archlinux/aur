# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>

pkgname=vmware-host-modules-dkms-git
_pkgname=vmware-host-modules
pkgver=16.2.4.k5.18.r3.gc06f22f
_pkgver=$(echo $pkgver | cut -c 1-6)
url='https://github.com/mkubecek/vmware-host-modules'
pkgrel=5
pkgdesc='Patches needed to build VMware Player host modules against recent kernels'
arch=('x86_64' 'aarch64' 'i386')
license=('GPL2')
provides=(vmware-host-modules-dkms vmware-host-modules)
conflicts=(vmware-host-modules-dkms vmware-host-modules vmware-workstation)
depends=('dkms')
makedepends=('git' 'fd')
source=("git+https://github.com/mkubecek/${_pkgname}.git#branch=player-$_pkgver"
        dkms-vmmon.conf
        dkms-vmnet.conf)
sha256sums=('SKIP'
            '82e8cddffbc272e854867c6c82bae509c9687b100a5aa770d6d528eb441759ee'
            'aa5d53732ea414d51648e9275dd3f8ffd48fd742a96c634df9ec545bdc8904db')
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
