# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgbase=sqldef
groups=('sqldef')
pkgname=(
  mysqldef
  sqlite3def
  mssqldef
  psqldef
)
pkgver=3.11.17
pkgrel=1
pkgdesc='Idempotent schema management for MySQL, PostgreSQL, SQLite, and SQL Server'
arch=(x86_64 aarch64)
url='https://github.com/sqldef/sqldef'
license=('MIT')
conflicts=("${pkgname}-bin")
depends=(glibc)
makedepends=('go')
options=(!lto)
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5d58aed7e90c7754882adaeab8f07cf44aab2313a693c1ccb65d03964b865265')

prepare() {
  cd "$pkgbase-$pkgver"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "$pkgbase-$pkgver"
  mkdir -p build

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  for _bin in "${pkgname[@]}"; do
    echo "Building $_bin"
    go build -o "build/$_bin" "cmd/$_bin/$_bin.go"
  done

  # Clean up deps
  go clean -modcache
}

package_mysqldef() {
  cd "$pkgbase-$pkgver"
  install -Dm755 build/mysqldef "$pkgdir/usr/bin/mysqldef"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/mysqldef/LICENSE"
}

package_sqlite3def() {
  cd "$pkgbase-$pkgver"
  install -Dm755 build/sqlite3def "$pkgdir/usr/bin/sqlite3def"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/sqlite3def/LICENSE"
}

package_mssqldef() {
  cd "$pkgbase-$pkgver"
  install -Dm755 build/mssqldef "$pkgdir/usr/bin/mssqldef"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/mssqldef/LICENSE"
}

package_psqldef() {
  cd "$pkgbase-$pkgver"
  install -Dm755 build/psqldef "$pkgdir/usr/bin/psqldef"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/psqldef/LICENSE"
}
