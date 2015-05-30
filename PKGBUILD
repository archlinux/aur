# $Id$
# Maintainer: Sébastien "Seblu" Luttringer
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)

pkgname=coreutils-selinux
pkgver=8.23
pkgrel=3
pkgdesc='The basic file, shell and text manipulation utilities of the GNU operating system with SELinux support'
arch=('i686' 'x86_64')
license=('GPL3')
url='http://www.gnu.org/software/coreutils'
groups=('selinux')
depends=('glibc' 'acl' 'attr' 'gmp' 'libcap' 'openssl' 'libselinux')
install=${pkgname/-selinux}.install
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
source=("ftp://ftp.gnu.org/gnu/${pkgname/-selinux}/${pkgname/-selinux}-$pkgver.tar.xz"{,.sig}
        '01-btrfs-alloc.patch')
validpgpkeys=('6C37DC12121A5006BC1DB804DF6FD971306037D9') # Pádraig Brady
md5sums=('abed135279f87ad6762ce57ff6d89c41'
         'SKIP'
         '7333cea9afddff017dd0445fc5b8cc8f')

prepare() {
  local _p
  for _p in *.patch; do
   [[ -e $_p ]] || continue
   msg2 "Applying $_p"
   patch -p1 -d ${pkgname/-selinux}-$pkgver < "$_p"
  done
}

build() {
  cd ${pkgname/-selinux}-$pkgver
  ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --with-openssl \
      --enable-no-install-program=groups,hostname,kill,uptime \
      --with-selinux
  make
}

check() {
  cd ${pkgname/-selinux}-$pkgver
  RUN_VERY_EXPENSIVE_TESTS=yes make check
}

package() {
  cd ${pkgname/-selinux}-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
