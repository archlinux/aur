# Maintainer: Javier Torres <jtorres@carto.com>
pkgname=carto-tiler
pkgver=2.87.1.r13.34424e71
pkgrel=1
pkgdesc="CARTO Maps API tiler. It extends Windshaft with some extra functionality"
arch=('x86_64')
url="https://github.com/CartoDB/Windshaft-cartodb"
license=('BSD')
groups=()
depends=('mapnik' 'nodejs' 'pango' 'redis')
makedepends=('git' 'npm' 'boost')
provides=()
conflicts=()
replaces=()
backup=('etc/carto/tiler.conf')
options=()
install=
source=('git+https://github.com/CartoDB/Windshaft-cartodb.git#branch=node-v6'
        'configuration.patch'
        'carto-tiler.service')
noextract=()
sha256sums=('SKIP'
            '86dc381424fe5b1babeac830b0bcab8bc8d582b66026145124ccec5478139922'
            'e0a7912e260c6dfc1e0fe42fde7f01d1f2dbbab17587d1cfb43b75277745dfa7')

pkgver() {
	cd "$srcdir/Windshaft-cartodb"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/Windshaft-cartodb"
  patch -p1 < "$srcdir/configuration.patch"
}

build() {
	cd "$srcdir/Windshaft-cartodb"
  npm install
}

package() {
	cd "$srcdir/Windshaft-cartodb"
  mkdir -p "$pkgdir/opt/carto/tiler"
  cp -ar app.js assets lib node_modules package.json "$pkgdir/opt/carto/tiler"

  install -Dm0644 "$srcdir/carto-tiler.service" "$pkgdir/usr/lib/systemd/system/carto-tiler.service"
  install -Dm0644 config/environments/development.js.example "$pkgdir/etc/carto/tiler.conf"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/var/log/carto/tiler"
}
