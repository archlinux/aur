# Maintainer:  Kyle Keen <keenerd at gmail>
# Contributor: evr <evanroman at gmail>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=weather
pkgver=2.3
pkgrel=1
pkgdesc="CLI tool which shows weather forecasts from METAR data"
arch=('any')
url="http://fungi.yuggoth.org/weather/"
depends=('python')
license=("custom:BSD2")
source=("http://fungi.yuggoth.org/weather/src/$pkgname-$pkgver.tar.gz")
md5sums=('1356e37f74097007b20987742927921b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # set up correlation sets
  sed -i 's| else: default_setpath = ".:~/.weather|&:/usr/share/weather-util|' weather.py
  sed -i 's|elif searchtype is |elif searchtype == |' weather.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 airports "$pkgdir/usr/share/weather-util/airports"
  install -Dm644 places   "$pkgdir/usr/share/weather-util/places"
  install -Dm644 stations "$pkgdir/usr/share/weather-util/stations"
  install -Dm644 zctas    "$pkgdir/usr/share/weather-util/zctas"
  install -Dm644 zones    "$pkgdir/usr/share/weather-util/zones"

  _python_path=$(python3 -c "import sys ; print([p for p in sys.path if p.startswith('/usr/lib/python3.')][0])")
  install -Dm755 weather    "$pkgdir/usr/bin/weather-report"
  install -Dm644 weather.py "$pkgdir/$_python_path/weather.py"

  install -Dm644 weatherrc "$pkgdir/etc/weatherrc"

  install -Dm644 weather.1   "$pkgdir/usr/share/man/man1/weather.1"
  install -Dm644 weatherrc.5 "$pkgdir/usr/share/man/man5/weatherrc.5"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/BSD2"
}

