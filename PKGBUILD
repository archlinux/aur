# $Id$
# Maintainer:
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=findutils-selinux
pkgver=4.6.0
pkgrel=2
pkgdesc="GNU utilities to locate files with SELinux support"
arch=('i686' 'x86_64')
license=('GPL3')
groups=('selinux')
depends=('glibc' 'sh' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
url="http://www.gnu.org/software/findutils"
source=(https://ftp.gnu.org/pub/gnu/findutils/${pkgname/-selinux}-${pkgver}.tar.gz
        gnulib-glibc2.28-compatibility.patch)
sha1sums=('f18e8aaee3f3d4173a1f598001003be8706d28b0'
          '089b2f56a7c4b24e03184c158f1352ade2b5d050')
#validpgpkeys=('A15B725964A95EE5') # James Youngman <james@youngman.org>

prepare() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"
  patch -Np1 -i ../gnulib-glibc2.28-compatibility.patch
}

build() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

  # Don't build or install locate because we use mlocate,
  # which is a secure version of locate.
  sed -i '/^SUBDIRS/s/locate//' Makefile.in

  ./configure --prefix=/usr
  # don't build locate, but the docs want a file in there.
  make -C locate dblocation.texi
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
