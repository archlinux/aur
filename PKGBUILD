# maintainer: luka null <lukadevnull@vivaldi.net>
# old maintainer: Alexey Kh <aur@devass.club>
pkgname=pg_strict
pkgver=1.0.3
pkgrel=1
pkgdesc='Blocks dangerous UPDATE and DELETE statements in PostgreSQL'
arch=('x86_64')
url='https://github.com/spa5k/pg_strict'
license=('PostgreSQL')
depends=('postgresql')
makedepends=('cargo' 'clang' 'llvm' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ceeda6696d7985f07866d99d8d98a40ea525c260f36de910c2ca9f8aba6726e8')

build() {
  cd "$pkgname-$pkgver"
  local pg_major pg_feature pgrx_home
  pg_major="$(pg_config --version | awk '{print $2}' | cut -d. -f1)"
  pg_feature="pg${pg_major}"
  pgrx_home="$srcdir/.pgrx"

  cargo install cargo-pgrx --locked --version 0.16.1 --root "$srcdir/.cargo-pgrx"
  PATH="$srcdir/.cargo-pgrx/bin:$PATH" PGRX_HOME="$pgrx_home" \
    cargo pgrx init --pg"${pg_major}" "$(command -v pg_config)"
  PATH="$srcdir/.cargo-pgrx/bin:$PATH" PGRX_HOME="$pgrx_home" \
    cargo pgrx package \
    --pg-config "$(command -v pg_config)" \
    --no-default-features \
    --features "${pg_feature}"
}

package() {
  cd "$pkgname-$pkgver"
  local pg_major package_root
  pg_major="$(pg_config --version | awk '{print $2}' | cut -d. -f1)"
  package_root="target/release/pg_strict-pg${pg_major}"

  install -Dm755 "$package_root/usr/lib/postgresql/pg_strict.so" \
    "$pkgdir/usr/lib/postgresql/pg_strict.so"
  install -Dm644 "$package_root/usr/share/postgresql/extension/pg_strict.control" \
    "$pkgdir/usr/share/postgresql/extension/pg_strict.control"
  install -Dm644 "$package_root/usr/share/postgresql/extension/pg_strict--${pkgver}.sql" \
    "$pkgdir/usr/share/postgresql/extension/pg_strict--${pkgver}.sql"
}
