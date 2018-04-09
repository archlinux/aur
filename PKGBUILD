# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: kevku <kevku@msn.com>
# Contributor: Andrew Rembrandt <andrew@rembrandt.me.uk>

_pkgname=OpenSC
pkgname=opensc-git
pkgver=0.17.0+227+g54097c0f
pkgrel=1
pkgdesc='Tools and libraries for smart cards'
arch=('x86_64')
url='https://github.com/OpenSC/OpenSC/wiki'
license=('LGPL')
backup=('etc/opensc.conf')
makedepends=('docbook-xsl' 'git')
depends=('pcsclite' 'libltdl')
options=('!emptydirs')
conflicts=(opensc)
source=("git+https://github.com/OpenSC/OpenSC.git#branch=master"
        'bash-completion-path.patch')
sha256sums=('SKIP'
            'bd0991dc8d68b21704104aba4d3470f4f4f50bf36547569ed032b48fd3aed811')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^opensc-//;s/-/+/g'
}


prepare() {
  cd $_pkgname
  patch -Np0 -i $srcdir/bash-completion-path.patch
}

build() {
  cd $_pkgname
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
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package(){
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -D -m644 etc/opensc.conf "$pkgdir/etc/opensc.conf"
}

# vim:set ts=2 sw=2 et:
