# $Id$
# Maintainer:
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>

pkgname=findutils-selinux
pkgver=4.4.2
pkgrel=6
pkgdesc="GNU utilities to locate files with SELinux support"
arch=('i686' 'x86_64')
license=('GPL3')
groups=('selinux')
depends=('glibc' 'sh' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
url="http://www.gnu.org/software/findutils"
source=("ftp://ftp.gnu.org/pub/gnu/findutils/${pkgname/-selinux}-${pkgver}.tar.gz"{,.sig}
        "http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-apps/${pkgname/-selinux}/files/${pkgname/-selinux}-${pkgver}-selinux.diff")
install=findutils.install
sha1sums=('e8dd88fa2cc58abffd0bfc1eddab9020231bb024'
          '77d9585d9feea0814752a31bf109fe287f528243'
          '96318be5586d324a13805da81907406a95c6514c')

prepare() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"
  # SELinux patch
  patch -Np1 -i "${srcdir}/${pkgname/-selinux}-${pkgver}-selinux.diff"
}

build() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

  # Don't build or install locate because we use mlocate,
  # which is a secure version of locate.
  sed -i '/^SUBDIRS/s/locate//' Makefile.in

  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
