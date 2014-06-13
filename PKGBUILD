# Maintainer: Ian D. Scott <ian@perebruin.com>
pkgname=pianod
pkgver=158
pkgrel=2
pkgdesc="Pandora Client Daemon"
url="http://deviousfish.com/pianod/"
arch=('x86_64' 'i686')
license=('mit')
depends=('mksh' 'libao' 'libgcrypt' 'gnutls' 'json-c' 'faad2' 'libmad' 'libbsd')
source=("http://deviousfish.com/Downloads/pianod/${pkgname}-${pkgver}.tar.gz" 
       "mtim.patch"
       "patch-json-c-0.12.diff")
md5sums=('68ed14772e0caa1391da5aac9bbbf056'
        'a4f433a16ea2bc9a64dde9b035507b97'
        'a93d668815249a36710df53c9ca5a789')
backup=('etc/pianod.startscript' 'etc/pianod.env')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/contrib"
  sed -i 's|/bin/ksh|/bin/mksh|' piano runmix
  cd ..
  patch -p1 -i ../mtim.patch
  patch -p0 -i ../patch-json-c-0.12.diff
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 contrib/pianod.service "$pkgdir/usr/lib/systemd/system/pianod.service"
  install -Dm644 contrib/pianod.env "$pkgdir/etc/pianod.env"
  install -Dm644 contrib/startscript-example "$pkgdir/etc/pianod.startscript"
}

# vim:set ts=2 sw=2 et:
