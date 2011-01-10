# Maintainer : Keshav P R <skodabenz at rocketmail dot com>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

_pkgname="efibootmgr"

pkgname="${_pkgname}-git"
pkgver=20110110
pkgrel=1
pkgdesc="Tool to modify (U)EFI Runtime Variables - GIT version. Needs kernel module 'efivars' to be loaded."
arch=('i686' 'x86_64')
url="http://linux.dell.com/efibootmgr/"
license=('GPL2')
depends=('zlib')
makedepends=('git')
conflicts=('efibootmgr')
provides=('efibootmgr')
source=('efibootmgr_default_to_grub2.patch')

sha256sums=('a6450ce3be0e87d047febf761ca90f3298996811ae2b7ff9428f3d5dd45afa8f')

_gitroot="http://linux.dell.com/git/efibootmgr.git"
_gitname="${_pkgname}"


update_git() {
    
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/${_gitname}/ ]
  then
      cd ${_gitname} && git fetch && git checkout origin/master && git reset --hard
      msg "The local files are updated."
  else
      git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"

}


build() {
  
  update_git
  
  rm -rf ${srcdir}/${_gitname}_1/ || true

  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}_1

  cd ${srcdir}/${_gitname}_1/
  
  patch -Np1 -i ${srcdir}/efibootmgr_default_to_grub2.patch
  
  make || return 1

}


package() {
  
  mkdir -p ${pkgdir}/usr/sbin/
  mkdir -p ${pkgdir}/usr/share/man/man8/
  
  cd ${srcdir}/${_gitname}_1/
  
  install -D -m755 ${srcdir}/${_gitname}_1/src/efibootmgr/efibootmgr ${pkgdir}/usr/sbin/${_pkgname}
  install -D -m644 ${srcdir}/${_gitname}_1/src/man/man8/efibootmgr.8 ${pkgdir}/usr/share/man/man8/${_pkgname}.8

}
