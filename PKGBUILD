# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>

pkgname=vmware-host-modules-dkms-git
_pkgname=vmware-host-modules
pkgver=16.2.4.k5.18.r3.gc06f22f
_pkgver=$(echo $pkgver | cut -c 1-6)
url='https://github.com/mkubecek/vmware-host-modules'
pkgrel=2
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
            '90aacfffdb25d7e993045d9147c8b02537abb717eab505b0ba33631d916032c4'
            '19bbf42896be9c743d8786b390ccab85a97da1060ffc29fda720bb835c35ad25')
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
