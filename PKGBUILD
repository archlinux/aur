# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=asciiworld-git
pkgver=15.03
pkgrel=1
pkgdesc="ASCII world map and tools"
arch=('i686' 'x86_64')
url="https://github.com/vain/asciiworld"
license=('custom:PIZZA-WARE')
depends=('gd' 'shapelib')
makedepends=('git')
optdepends=('curl: Retrieving various data'
            'python: Additional tools, e.g. satellite tracking'
            'python-pyephem: Calculating satellite positions'
            'python-pygeoip: Reading GeoIP databases'
            'geoip-citydata: An actual GeoIP database'
            'python2: Additional tools, e.g. calculating tracks'
            'python2-geographiclib: Calculating geodetics'
            'ncurses: For tput')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://github.com/vain/asciiworld.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --always | sed 's|-|.|g; s|v||'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make DEFAULT_MAP=/usr/share/"${pkgname%-git}"/ne_110m_land.shp
}

package() {
  cd "$srcdir/${pkgname%-git}"

  # Core program
  install -Dm755 asciiworld "$pkgdir"/usr/bin/asciiworld

  # Map data
  for i in ne_110m_land.sh{p,x}
  do
    install -Dm644 "$i" "$pkgdir/usr/share/${pkgname%-git}/$i"
  done

  # Satellite tracking suite
  for i in asciiworld{-sat-get,-sat-calc,-sat-track}
  do
    install -Dm755 "$i" "$pkgdir"/usr/bin/"$i"
  done

  # TCP monitor
  for i in asciiworld{-ip-geo,-tcp-monitor}
  do
    install -Dm755 "$i" "$pkgdir"/usr/bin/"$i"
  done

  # Generic helpers
  for i in asciiworld-waypoints
  do
    install -Dm755 "$i" "$pkgdir"/usr/bin/"$i"
  done

  # Documents
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 README-tools.md \
    "$pkgdir/usr/share/doc/${pkgname%-git}/README-tools.md"
}
