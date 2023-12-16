# Maintainer: pikl <me@pikl.uk>
pkgname=pgvecto.rs
pkgver=0.1.13
pkgrel=1
pkgdesc="Postgres extension that provides vector similarity search functions. It is written in Rust and based on pgrx."
arch=(x86_64)
url="https://github.com/tensorchord/pgvecto.rs"
license=('Apache-2.0')
makedepends=('cargo-nightly' 'clang' 'postgresql' 'postgresql-libs' 'openssl' 'readline'  'libxml2' 'libxslt' 'zlib' 'ccache' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tensorchord/pgvecto.rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ba0be19c5f77c08526fe723ffe8d2fa14031d02ff4cb1685497e789f2f88b9b3')

# prepare() {
#     cd $pkgname-$pkgver
# }

build() {
    cd $pkgname-$pkgver
    cargo install cargo-pgrx --git https://github.com/tensorchord/pgrx.git --rev $(cat Cargo.toml | grep "pgrx =" | awk -F'rev = "' '{print $2}' | cut -d'"' -f1)
    cargo pgrx init --pg16=/usr/bin/pg_config
    cargo pgrx install --release
}

package() {
    cd "${pkgname}-${pkgver}/release/vectors-pg16"
    install -Dm0755 usr/lib/postgresql/vectors.so "$pkgdir/usr/lib/postgresql/vectors.so"
    install -Dm0644 usr/share/postgresql/extension/vectors--0.1.13.sql "$pkgdir/usr/share/postgresql/extension/vectors--${pkgver}.sql"
    install -Dm0644 usr/share/postgresql/extension/vectors.control "$pkgdir/usr/share/postgresql/extension/vectors.control"
}
