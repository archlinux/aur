# Maintainer: ianux <ianux at free dot fr>
# Contributor: priyank
# Contributor: etix

pkgname=ices0
pkgver=0.4.11
pkgrel=2
pkgdesc="Source client for broadcasting in MP3 format to an Icecast2 server"
arch=('i686' 'x86_64')
license=('GPL')
url="http://icecast.org/ices.php"
depends=('libxml2' 'lame' 'libvorbis' 'libshout' 'python2' 'perl')
source=(https://github.com/Moonbase59/ices0/archive/v${pkgver}.tar.gz)
sha512sums=('df8d7d7a52c690ee26d5b3716a8ac92f1bf79f84efb975b9036c8cd42d0fcd3a5a07b04a78de39afe80e50e341da476b42b03a7e241e83496ec7f8ac1a42710a')
options=('!docs')
install=$pkgname.install

build() {
  cd ${srcdir}/$pkgname-$pkgver
  aclocal
  autoreconf -fi
  automake --add-missing
  ./configure --prefix=/usr --sysconfdir=/usr/share/$pkgname -mandir=/usr/share \
    --with-python=/usr/bin/python2 --without-faad --without-flac
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install
  # Rename files to avoid conflict with ices2
  mv ${pkgdir}/usr/bin/ices ${pkgdir}/usr/bin/ices0
  mv ${pkgdir}/usr/share/man1/ices.1 ${pkgdir}/usr/share/man1/ices0.1
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING
}
