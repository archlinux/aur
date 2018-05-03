# $Id$
# Maintainer: Aleksei Lissitsin <aldgracil@gmail.com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: kevku <kevku@msn.com>

pkgname=opensc-esteid
pkgver=0.17.0.311218
pkgrel=1
pkgdesc='Tools and libraries for smart cards (patched version for EstEID)'
arch=('i686' 'x86_64')
url='https://github.com/metsma/OpenSC/tree/0.17-esteid'
license=('LGPL')
backup=('etc/opensc.conf')
makedepends=('docbook-xsl')
depends=('pcsclite' 'libltdl')
options=('!emptydirs')
conflicts=('opensc')
provides=('opensc')
source=("https://github.com/metsma/OpenSC/archive/0.17-esteid.zip"
        bash-completion-path.patch)
sha256sums=('cc8efebe17c229a5200881e3b1bc15b9e78cd29c212664f4df3ecaba92401b9f'
            'bd0991dc8d68b21704104aba4d3470f4f4f50bf36547569ed032b48fd3aed811')

prepare() {
  mv OpenSC-0.17-esteid $pkgname-$pkgver 
  cd $pkgname-$pkgver
  patch -Np0 -i "$srcdir"/bash-completion-path.patch
}

build() {
  cd $pkgname-$pkgver
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
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 etc/opensc.conf "$pkgdir/etc/opensc.conf"
}

# vim:set ts=2 sw=2 et:
