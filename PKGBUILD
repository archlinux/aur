# Maintainer: npil

pkgname=ddccontrol-db
pkgver=20260902
pkgrel=2
pkgdesc="Monitor database for DDCControl"
arch=('any')
url="https://github.com/ddccontrol/ddccontrol-db"
license=('GPL-2.0-only')
depends=()
source=("https://github.com/ddccontrol/ddccontrol-db/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "check-db-report.sh")
sha256sums=('70ecf4ab6e1952234e9b2740bca8fd10e6cf7b290fa9d464bde08d11969d3e46'
            '14d855f1a28121ebe39991e19f1275249ab6ebe174b9384b3c3f5609aec504a5')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check

  # check db using ddccontrol if available
  if command -v ddccontrol >/dev/null 2>&1; then
    sh "$srcdir/check-db-report.sh"
  else
    echo "check-db: ddccontrol not found, skipping profile validation"
  fi
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
