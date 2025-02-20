# Maintainer: Luke Alonso <lalonso@gmail.com>
pkgname=openconnect-gp-git
_pkgname=openconnect
pkgver=40a377d4fc3c2cfa16b7408b769d43bcac7c21e8
pkgrel=2
pkgdesc="Open client for Cisco AnyConnect VPN, with minor fixes for the existing upstream GlobalProtect support"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.infradead.org/openconnect.html"
depends=('libproxy' 'vpnc' 'pcsclite' 'trousers' 'stoken' 'oath-toolkit')
makedepends=('intltool' 'python' 'git' 'autoconf' 'automake' 'libtool')
options=('!emptydirs')
provides=($_pkgname 'libopenconnect.so')
conflicts=($_pkgname)
commit=40a377d4fc3c2cfa16b7408b769d43bcac7c21e8
source=("$pkgname::git+https://github.com/lukealonso/openconnectgp.git/#commit=$commit")
md5sums=('SKIP')

pkgver() {
  echo $commit
}

build() {
  cd $pkgname
  find . -name "libtool" -o -name "ltmain.sh" -o -name "aclocal.m4" -o -name "config.guess" -o -name "config.sub" | xargs rm -f

  ./autogen.sh
  autoreconf -fi

  PYTHON=/usr/bin/python ./configure --prefix=/usr \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib \
      --disable-static \
      --without-gnutls \
      --with-vpnc-script=/etc/vpnc/vpnc-script
  # Fight unused direct deps
  sed -i -e "s/ -shared / $LDFLAGS\0 /g" libtool
  sed -i 's|update-desktop-database|true|' Makefile

  export MAKEFLAGS="-j $(grep -c ^processor /proc/cpuinfo)"
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

post_install() {
    update-desktop-database -q
}

post_remove() {
    update-desktop-database -q
}
