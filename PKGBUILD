# Maintainer:  Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Markus Opitz <mastero23 at gmail dot com>

pkgname=oscam-svn
pkgver=11225
pkgrel=1

pkgdesc="The Open Source Conditional Access Module daemon"
url="http://oscam.to/"
arch=('i686' 'x86_64')
license=('GPL3')

depends=('bash' 'openssl' 'libusbx' 'pcsclite')
makedepends=('subversion')
provides=('oscam')
conflicts=('oscam')

install=oscam.install
source=("$pkgname::svn+http://www.streamboard.tv/svn/oscam/trunk"
        'oscam.service')
md5sums=('SKIP'
         '9feece4aed599a1ba005305c5e23960e')

pkgver() {  
  cd "$SRCDEST/$pkgname"
  svnversion
}

build() {
  cd "$srcdir/$pkgname"
  make allyesconfig
  ./config.sh --disable WITH_SSL
  make OSCAM_BIN=oscam CONF_DIR=/etc/oscam USE_LIBUSB=1 USE_PCSC=1
}

package() {
  install -D -m 755 "$srcdir/oscam-svn/oscam" "$pkgdir/usr/bin/oscam"
  install -D -m 644 "$srcdir/oscam.service" "$pkgdir/usr/lib/systemd/system/oscam.service"
  install -m 755 -d "$pkgdir/etc/oscam"
  install -m 755 -d "$pkgdir/usr/share/doc/oscam"/{example,monitor}
  install -m 644 "$srcdir/oscam-svn/Distribution/doc/txt"/* "${pkgdir}/usr/share/doc/oscam/"
  install -m 644 "$srcdir/oscam-svn/Distribution/doc/example"/* "${pkgdir}/usr/share/doc/oscam/example"
  install -m 644 "$srcdir/oscam-svn/Distribution/monitor"/* "${pkgdir}/usr/share/doc/oscam/monitor"
  install -m 755 -d "$pkgdir/usr/share/man"/{man1,man5}
  install -m 644 "$srcdir/oscam-svn/Distribution/doc/man"/*.1 "${pkgdir}/usr/share/man/man1"
  install -m 644 "$srcdir/oscam-svn/Distribution/doc/man"/*.5 "${pkgdir}/usr/share/man/man5"
}
