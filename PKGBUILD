# Maintainer:
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=findutils-selinux
pkgver=4.9.0
pkgrel=2
pkgdesc="GNU utilities to locate files with SELinux support"
arch=('x86_64' 'aarch64')
license=('GPL3')
groups=('selinux')
depends=('glibc' 'sh' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
url='https://www.gnu.org/software/findutils/'
source=("https://ftp.gnu.org/pub/gnu/findutils/${pkgname/-selinux}-${pkgver}.tar.xz"{,.sig})
sha256sums=('a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d547573cb08065fd462fe'
            'SKIP')
validpgpkeys=('A5189DB69C1164D33002936646502EF796917195') # Bernhard Voelker <mail@bernhard-voelker.de>

build() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

  # Don't build or install locate because we use mlocate,
  # which is a secure version of locate.
  sed -e '/^SUBDIRS/s/locate//' -e 's/frcode locate updatedb//' -i Makefile.in

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
