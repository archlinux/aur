# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Kyle Keen <keenerd at gmail>
# Contributor: evr <evanroman at gmail>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=weather
pkgver=2.5.0
pkgrel=1
pkgdesc="A command-line utility intended to provide quick access to current weather conditions and forecasts"
url="http://fungi.yuggoth.org/weather"
license=('ISC')
arch=('any')
depends=('python')
source=("http://fungi.yuggoth.org/weather/src/weather-$pkgver.tar.xz")
sha256sums=('c27ddca607eb96a9ed308895161e37d7b0eb6c6810e18467173dca1d769c4f0e')
backup=("etc/weatherrc")

prepare() {
  cd weather-$pkgver
# set up correlation sets
  sed -i 's| else: default_setpath = ".:~/.weather|&:/usr/share/weather-util|' weather.py
  sed -i 's|elif searchtype is |elif searchtype == |' weather.py
}

package() {
  cd weather-$pkgver
  install -Dm644 airports places stations zctas zones -t "$pkgdir/usr/share/weather-util"
  install -Dm644 weatherrc -t "$pkgdir/etc"
  install -Dm644 weather.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 weatherrc.5 -t "$pkgdir/usr/share/man/man5"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/weather"

  _python_path=$(python3 -c "import sys ; print([p for p in sys.path if p.startswith('/usr/lib/python3.')][0])")
  install -Dm644 weather.py -t "$pkgdir/$_python_path"
  install -Dm755 weather -t "$pkgdir/usr/bin"
}
