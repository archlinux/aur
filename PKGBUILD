# Maintainer : Keshav P R <skodabenz at rocketmail dot com>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

_pkgname="efibootmgr"

pkgname="${_pkgname}-git"
pkgver=20110122
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

sha256sums=('db7f0819071a452b434f81baf5b231af87fd9eaaf6c84b9af13d60b81c33881f')

_gitroot="http://linux.dell.com/git/efibootmgr.git"
_gitname="${_pkgname}"


update_git() {
  
  cd "${srcdir}"
  msg "Connecting to GIT server...."
  
  if [ -d ${srcdir}/${_gitname}/ ]
  then
      cd ${srcdir}/${_gitname}/
      git reset --hard
      git fetch
      git checkout master
      git merge remotes/origin/master
      msg "The local GIT repo has been updated."
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
