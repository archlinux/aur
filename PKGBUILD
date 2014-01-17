# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)

pkgname=coreutils-selinux
pkgver=8.22
pkgrel=1
pkgdesc="The basic file, shell and text manipulation utilities of the GNU operating system with SELinux support"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.gnu.org/software/coreutils"
groups=('selinux')
depends=('glibc' 'pam-selinux' 'acl' 'gmp' 'libcap' 'libselinux')
install=${pkgname/-selinux}.install
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}" "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
source=(ftp://ftp.gnu.org/gnu/${pkgname/-selinux}/${pkgname/-selinux}-$pkgver.tar.xz{,.sig}
        '0001-copy-fix-SELinux-context-preservation-for-existing-d.patch'
        '0002-copy-fix-a-segfault-in-SELinux-context-copying-code.patch')
md5sums=('8fb0ae2267aa6e728958adc38f8163a2'
         'SKIP'
         'a320632626e1639643f3510ae1c62ed0'
         '40575ec80e895b5db52dafa6556e6e26')

prepare() {
  cd "${pkgname/-selinux}-$pkgver"
  patch -Np1 < "$srcdir/0001-copy-fix-SELinux-context-preservation-for-existing-d.patch"
  patch -Np1 < "$srcdir/0002-copy-fix-a-segfault-in-SELinux-context-copying-code.patch"
}

build() {
  cd ${srcdir}/${pkgname/-selinux}-${pkgver}
  ./configure --prefix=/usr --libexecdir=/usr/lib --with-openssl \
              --enable-no-install-program=groups,hostname,kill,uptime \
              --with-selinux
  make
}

check() {
  cd ${srcdir}/${pkgname/-selinux}-${pkgver}
  #make RUN_EXPENSIVE_TESTS=yes check
}

package() {
  cd ${srcdir}/${pkgname/-selinux}-${pkgver}
  make DESTDIR=${pkgdir} install
}
