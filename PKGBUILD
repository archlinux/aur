# Maintainer: Konstantin Shalygin (k0ste@k0ste.ru)

pkgname='mailfromd'
pkgver='7.99.94'
pkgrel='0'
pkgdesc='General-Purpose Mail Filter'
arch=('any')
url='http://puszcza.gnu.org.ua/software/mailfromd'
depends=('smtp-server' 'gdbm' 'mailutils' 'geoip')
license=('GPL')
source=('mailfromd.service'
	"ftp://download.gnu.org.ua/pub/alpha/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('26a380c1bfe964c1aaaf351f85504c72ca7be5dca199e7cd79252c83382a9ce0'
            '84d771fd0d27d859125b0b4f69fd484aa9ba64356fc7a792d0173f4a7a38f325')
backup=('etc/mailfromd.mf')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
  --prefix=/usr \
  --sbindir=/usr/bin \
  --bindir=/usr/bin \
  --sysconfdir=/etc \
  --localstatedir=/var/lib \
  --with-gdbm \
  --with-geoip \
  --enable-ipv6 \
  --enable-syslog-async \
  DEFAULT_USER=mail \
  DEFAULT_SOCKET=inet:8890@localhost \
  DEFAULT_LOG_FACILITY=mail
  make
  cd tests
  ./testsuite -e --color=always
}

package() {
  pushd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  popd
  install -dm770 -o 8 -g 12 "$pkgdir/var/lib/$pkgname"
  install -Dm644 "mailfromd.service" "$pkgdir/usr/lib/systemd/system/mailfromd.service"
}
