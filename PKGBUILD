# Maintainer: dllud <dllud riseup net>
# Contributor: tee < teeaur at duck dot com >

pkgname='sqlpage'
_pkgname='SQLPage'
pkgver=0.41.0
pkgrel=1
pkgdesc='Fast SQL-only data application builder. Automatically build a UI on top of SQL queries.'
url='https://sql-page.com'
_srcurl='https://github.com/sqlpage/SQLPage'
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::${_srcurl}/archive/v$pkgver.tar.gz")
b2sums=('13d5a6a860bef037fd8581b70616cabbc3149f107a2a50645b0bb11efd942d8ed157982df74ffe006f8607c61bafecc81099cf4e4b7f269e6576ce006a241a6a')
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
