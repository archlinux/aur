# Maintainer: Sébastien "Seblu" Luttringer
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=coreutils-selinux
pkgver=8.32
pkgrel=1
pkgdesc='The basic file, shell and text manipulation utilities of the GNU operating system with SELinux support'
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/coreutils/'
groups=('selinux')
depends=('glibc' 'acl' 'attr' 'gmp' 'libcap' 'openssl' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
source=("https://ftp.gnu.org/gnu/${pkgname/-selinux}/${pkgname/-selinux}-$pkgver.tar.xz"{,.sig})
validpgpkeys=('6C37DC12121A5006BC1DB804DF6FD971306037D9') # Pádraig Brady
sha256sums=('4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa'
            'SKIP')

prepare() {
  cd ${pkgname/-selinux}-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
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
  #make check
}

package() {
  cd ${pkgname/-selinux}-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
