# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=asciiworld-git
pkgver=20.01
pkgrel=2
pkgdesc="ASCII world map and tools"
arch=('i686' 'x86_64')
url="https://uninformativ.de/git/asciiworld"
license=('MIT')
depends=('gd' 'shapelib')
makedepends=('git')
optdepends=('curl: Retrieving various data'
            'python: Additional tools, e.g. satellite tracking'
            'python-geographiclib: Geographic calculations, used by tools'
            'python-pyephem: Calculating satellite positions'
            'python-pygeoip: Reading GeoIP databases'
            'geoip-database-extra: An actual GeoIP database'
            'ncurses: For tput')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://uninformativ.de/git/asciiworld.git')
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
  install -Dm644 README "$pkgdir/usr/share/doc/${pkgname%-git}/README"
  install -Dm644 README-tools.md \
    "$pkgdir/usr/share/doc/${pkgname%-git}/README-tools.md"
}
