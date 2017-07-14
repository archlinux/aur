# $Id$
# Maintainer: None

pkgname=gnunet-git
pkgdesc="A framework for secure peer-to-peer networking"
pkgver=0.10.1.24826.cd8ffdb97
pkgrel=1
arch=('i686' 'x86_64')
url="http://gnunet.org"
license=('GPL')
conflicts=('gnunet')
provides=('gnunet')
depends=('gmp' 'libgcrypt' 'libextractor' 'sqlite' 'gnurl'
	 'libmicrohttpd' 'libunistring' 'libidn')
makedepends=('gettext' 'pkgconfig' 'git'
	     'bluez-libs' 'python' 'glpk' 'libpulse' 'opus')
optdepends=('bluez-libs'
	    'python'
	    'glpk'
	    'libpulse'
	    'opus')
backup=(etc/gnunetd.conf)
options=('!makeflags')
source=(git+https://gnunet.org/git/gnunet.git
        gnunet.service
        defaults.conf)
md5sums=('SKIP'
         '54cce3d2415d95b2e5bd1bd88db3a0ea'
         '0fe23b2ca5b3fc47a0b5645e04406da0')

pkgver() {
  cd "${srcdir}/gnunet/"
  local _version=$(head -n 30 configure.ac | grep 'AC_INIT' | grep -o '\([0-9].*[0-9]\)')
  printf "%s.%s.%s" ${_version} "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/gnunet/
  ./bootstrap
  sed -i 's|contrib doc|doc|' Makefile.*
  [ -f Makefile ] || ./configure --prefix=/usr \
    --without-mysql \
    --with-nssdir=/usr/lib
  make
  make -C contrib
}

package() {
  cd "$srcdir"/gnunet/
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C contrib install
  install -D -m0644 "$srcdir"/defaults.conf "$pkgdir"/etc/gnunetd.conf
  rm -rf "$pkgdir"/usr/include/libltdl "$pkgdir"/usr/lib/libltdl.* "$pkgdir"/usr/include/ltdl.h
  install -Dm0644 "$srcdir"/gnunet.service "$pkgdir"/usr/lib/systemd/system/gnunet.service
}
