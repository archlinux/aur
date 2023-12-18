# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Danilo Luvizotto <danilo.luvizotto@gmail.com>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=p910nd
pkgver=0.97
pkgrel=1
pkgdesc="A small printer daemon intended for diskless workstations that passes jobs directly to the printer"
arch=('i686' 'x86_64' 'armv5' 'armv5h' 'armv6' 'armv6h' 'armv7' 'armv7h')
url="https://github.com/kenyapcomau/p910nd/"
license=('GPL2')
depends=('glibc')
backup=('etc/conf.d/p910nd')
#options=('emptydirs')
source=(https://github.com/kenyapcomau/p910nd/archive/$pkgver/$pkgname-$pkgver.tar.gz \
        $pkgname.service \
        $pkgname.conf)
sha256sums=('a1bcc2dd75bad4e00a9de5098dbd970e8380f978fc09292bcfa15852af6a6964'
            '63ff1acd6908b2c5437ec53a959e24089366dc0e27430321862dfc77e1b3f891'
            'c62fdc7cfdea0411ebcbc2f879fb860477bf9883b8f673c7a8ca1440544fd1c4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # TODO: this should be in its own subdir, but needs to be created at boot 
  sed -i "s|/var/lock/subsys|/run/lock|" $pkgname.c
  # modern linux FSH
  sed -i 's|sbin|bin|' Makefile $pkgname.*
  sed -i 's|var/lock|run/lock|' Makefile $pkgname.*
  sed -i 's|var/run|run|' Makefile $pkgname.*
  sed -i 's|$(INSTALL) $(INITSCRIPT) $(DESTDIR)$(SCRIPTDIR)/$(PROG)||' Makefile
  sed -i 's| $(CFLAGS)| $(CFLAGS) $(LDFLAGS)|' Makefile
  sed -i 's|P910ND_OPTS=""|P910ND_OPTS="-f /dev/usb/lp0"|' $pkgname.conf
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make CONFIG='aux/p910nd.conf' CONFIGDIR='/etc/conf.d' SCRIPTDIR="" DESTDIR="$pkgdir" install
  #install -dm755 "$pkgdir/run/lock/$pkgname"
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$srcdir/$pkgname.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

