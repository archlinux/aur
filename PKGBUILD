# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Danilo Luvizotto <danilo.luvizotto@gmail.com>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=p910nd
pkgver=0.97
pkgrel=1
pkgdesc='Small printer daemon intended for diskless workstations that passes jobs directly to the printer'
arch=('x86_64')
url='https://github.com/kenyapcomau/p910nd'
license=('GPL2')
depends=('glibc')
backup=('etc/conf.d/p910nd')
source=("https://github.com/kenyapcomau/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.service")
sha256sums=('a1bcc2dd75bad4e00a9de5098dbd970e8380f978fc09292bcfa15852af6a6964'
            '63ff1acd6908b2c5437ec53a959e24089366dc0e27430321862dfc77e1b3f891')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|/var/run|/run|
          s|/var/lock/subsys|/run/lock|' p910nd.c
  sed -i '/INITSCRIPT/d' Makefile
}

build() {
  cd $pkgname-$pkgver
  make LIBS="$LDFLAGS"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" BINDIR='/usr/bin' CONFIG='aux/p910nd.conf' CONFIGDIR='/etc/conf.d' SCRIPTDIR='' install
  install -Dm644 ../$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

