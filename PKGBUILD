# Maintainer: Peter Petrov <onestone at gmail dot com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: kevku <kevku@msn.com>

pkgname=opensc-0.15
pkgver=0.15.0
pkgrel=1
pkgdesc='Tools and libraries for smart cards'
arch=('x86_64' 'i686')
url='https://github.com/OpenSC/OpenSC/wiki'
license=('LGPL')
backup=('etc/opensc.conf')
makedepends=('docbook-xsl')
depends=('openssl' 'pcsclite' 'libltdl')
provides=('opensc')
conflicts=('opensc')
options=('!emptydirs')
source=("http://downloads.sourceforge.net/opensc/opensc-$pkgver.tar.gz"
        bash-completion-path.patch)
md5sums=('34c55315b7f381bd047b6435933baab4'
         '3912c0a976700a5bba535f1c4278aec0')

prepare() {
  cd opensc-$pkgver
  patch -Np0 -i "$srcdir"/bash-completion-path.patch
}

build() {
  cd opensc-$pkgver
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
  cd opensc-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 etc/opensc.conf "$pkgdir/etc/opensc.conf"
}

# vim:set ts=2 sw=2 et:
