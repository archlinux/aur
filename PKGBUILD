# $Id: PKGBUILD 195613 2016-11-14 07:40:36Z bpiotrowski $
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: kevku <kevku@msn.com>
# Contributor: Andrew Rembrandt <andrew@rembrandt.me.uk>

_pkgname=OpenSC
pkgname=opensc-git
pkgver=0.16.0+131+g9e6dddb
pkgrel=1
pkgdesc='Tools and libraries for smart cards'
arch=('x86_64' 'i686')
url='https://github.com/OpenSC/OpenSC/wiki'
license=('LGPL')
backup=('etc/opensc.conf')
makedepends=('docbook-xsl')
depends=('pcsclite' 'libltdl')
options=('!emptydirs')
conflicts=(opensc)
source=("git+https://github.com/OpenSC/OpenSC.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^opensc-//;s/-/+/g'
}


prepare() {
  cd $_pkgname
  patch -Np0 -i $startdir/bash-completion-path.patch
}

build() {
  cd $_pkgname
  export LIBS=-lltdl
  _sheetdir=(/usr/share/xml/docbook/xsl-stylesheets-*)
  ./bootstrap
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-man \
    --enable-doc \
    --enable-readline \
    --enable-openssl \
    --enable-pcsc \
    --enable-zlib \
    --enable-sm \
    --with-xsl-stylesheetsdir="$_sheetdir"
  make
}

package(){
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -D -m644 etc/opensc.conf "$pkgdir/etc/opensc.conf"
}

# vim:set ts=2 sw=2 et:
