# Maintainer: dllud <dllud riseup net>
# Contributor: tee < teeaur at duck dot com >

pkgname='sqlpage'
_pkgname='SQLPage'
pkgver=0.46.1
pkgrel=1
pkgdesc='Fast SQL-only data application builder. Automatically build a UI on top of SQL queries'
url='https://sql-page.com'
_srcurl='https://github.com/sqlpage/SQLPage'
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::${_srcurl}/archive/v$pkgver.tar.gz")
b2sums=('d679d88aa45e10353e2ca8aeabe8fb39d0cb47599ec3a8d7f575493c82977c84227d0cb2846719edbdbf161300e449e0e517e4ce11ec5a29f33584d8ffc360c3')
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
