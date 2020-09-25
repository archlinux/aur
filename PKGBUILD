# Contributor: Sergio Tridente <tioduke at gmail dot com>

_pkgname=onics
pkgname=onics-git
pkgver=639.fed6e01
pkgrel=1
pkgdesc="A command line tool suite to capture, dissect, manipulate and send network data."
arch=('i686' 'x86_64')
url="https://gitorious.org/onics/pages/Home"
license=('GPL')
depends=('libpcap')
makedepends=('git' 'make')
conflicts=('onics')
provides=('onics')
options=(!emptydirs)
source=('git+https://github.com/ctelfer/catlib.git#branch=master'
        'git+https://github.com/ctelfer/onics.git#branch=master')
md5sums=('SKIP' 'SKIP')


pkgver() {
  cd "$srcdir/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  # Make catlib
  cd "$srcdir/catlib"
  make

  # Make ONICS
  cd "$srcdir/${_pkgname}"
  ./configure
  make INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/${_pkgname}"
  make INSTALL_PREFIX=${pkgdir}/usr install

  # Move man pages to /usr/share
  mkdir -p "$pkgdir/usr/share"
  mv "$pkgdir/usr/man" "$pkgdir/usr/share"
  
  # Correct man pages symlinks
  for _file in "$pkgdir"/usr/share/man/man1/{mkicmp.1,mkicmp6.1,mktcp.1,mktcp6.1,mkudp.1,mkudp6.1}; do
     rm ${_file}
     ln -s mkpkt.1 ${_file}
  done
  for _file in "$pkgdir"/usr/share/man/man1/{ethwrap.1,ipwrap.1,ip6wrap.1,icmpwrap.1,icmp6wrap.1,tcpwrap.1,udpwrap.1,mkarp.1}; do
     rm ${_file}
     ln -s oprotowrap.1 ${_file}
  done
}
