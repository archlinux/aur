# Maintainer: dllud <dllud riseup net>
# Contributor: tee < teeaur at duck dot com >

pkgname='sqlpage'
_pkgname='SQLPage'
pkgver=0.47.0
pkgrel=2
pkgdesc='Fast SQL-only data application builder. Automatically build a UI on top of SQL queries'
url='https://sql-page.com'
_srcurl='https://github.com/sqlpage/SQLPage'
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'npm')
source=("$pkgname-$pkgver.tar.gz::${_srcurl}/archive/v$pkgver.tar.gz")
b2sums=('4d77f0cacb381c1beb9d37b4991d353795b1a2d964722d949a0473cd50c97319659ce1b2e94034e3f1553540d2382e4acb43b9d1213f2eda7506815a6775b44d')
options=(!lto)

prepare() {
  cd "${_pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  npm ci
}

build() {
  cd "${_pkgname}-${pkgver}"
  npm run build
  cargo build --frozen --release --all-features
}

check() {
  cd "${_pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  sed -i "s|/var/www/sqlpage|/srv/http|" "$pkgname.service"
  sed -i "s|/usr/local/bin/sqlpage\.bin|/usr/bin/$pkgname|" "$pkgname.service"
  install -Dm644 "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 configuration.md "$pkgdir/usr/share/doc/$pkgname/configuration.md"
  install -Dm644 "$pkgname/migrations/README.md" "$pkgdir/usr/share/doc/$pkgname/migrations/README.md"
  install -Dm644 "$pkgname/templates/README.md" "$pkgdir/usr/share/doc/$pkgname/templates/README.md"
  install -Dm644 "$pkgname/sqlpage.json" "$pkgdir/usr/share/$pkgname/sqlpage.json"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
