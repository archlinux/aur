# Maintainer: dllud <dllud riseup net>
# Contributor: tee < teeaur at duck dot com >

pkgname='sqlpage'
_pkgname='SQLPage'
pkgver=0.40.0
pkgrel=1
pkgdesc='Fast SQL-only data application builder. Automatically build a UI on top of SQL queries.'
url='https://sql-page.com'
_srcurl='https://github.com/sqlpage/SQLPage'
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::${_srcurl}/archive/v$pkgver.tar.gz")
b2sums=('ce4284ce3ac27c578f8c73f643bdece66623e70067bdce951cac612389497c479f1908639b77057d59b6029fce291f65e307715a53384468dea17bb4882b0cbd')
options=(!lto)

prepare() {
  cd "${_pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  cd "${_pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  sed -i "s|/var/www/sqlpage|/srv/http|" "$pkgname.service"
  sed -i "s|/usr/local/bin/sqlpage\.bin|/usr/bin/$pkgname|" "$pkgname.service"
  install -Dm644 "$pkgname.service" "$pkgdir/etc/systemd/system/$pkgname.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 configuration.md "$pkgdir/usr/share/doc/$pkgname/configuration.md"
  install -Dm644 "$pkgname/migrations/README.md" "$pkgdir/usr/share/doc/$pkgname/migrations/README.md"
  install -Dm644 "$pkgname/templates/README.md" "$pkgdir/usr/share/doc/$pkgname/templates/README.md"
  install -Dm644 "$pkgname/sqlpage.json" "$pkgdir/usr/share/$pkgname/sqlpage.json"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
