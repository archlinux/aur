# Maintainer:  Kyle Keen <keenerd at gmail>
# Contributor: evr <evanroman at gmail>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=weather
pkgver=2.0
pkgrel=2
pkgdesc="CLI tool which shows weather forecasts from METAR data"
arch=('any')
url="http://fungi.yuggoth.org/weather/"
depends=('python2')
license=("custom:BSD2")
source=(http://fungi.yuggoth.org/weather/src/$pkgname-$pkgver.tar.gz)
#md5sums=('a15517825595f73dc06ccd6628c4c2f6')
# checksums seem to be changing every hour or something weird
md5sums=('be49f38f2da59dfc4716e2370f029a65')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|env python|env python2|' *

  # set up correlation sets
  sed -i 's| else: default_setpath = ".:~/.weather|&:/usr/share/weather-util|' weather.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 airports "$pkgdir/usr/share/weather-util/airports"
  install -Dm644 places   "$pkgdir/usr/share/weather-util/places"
  install -Dm644 stations "$pkgdir/usr/share/weather-util/stations"
  install -Dm644 zctas    "$pkgdir/usr/share/weather-util/zctas"
  install -Dm644 zones    "$pkgdir/usr/share/weather-util/zones"

  _python_path=$(python2 -c "import sys ; print [p for p in sys.path if p.startswith('/usr/lib/python2.')][0]")
  install -Dm755 weather    "$pkgdir/usr/bin/weather-report"
  install -Dm644 weather.py "$pkgdir/$_python_path/weather.py"

  install -Dm644 weatherrc "$pkgdir/etc/weatherrc"

  install -Dm644 weather.1   "$pkgdir/usr/share/man/man1/weather.1"
  install -Dm644 weatherrc.5 "$pkgdir/usr/share/man/man5/weatherrc.5"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/BSD2"
}

