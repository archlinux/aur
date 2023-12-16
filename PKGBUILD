# Maintainer: pikl <me@pikl.uk>
pkgname=pgvecto.rs
pkgver=0.1.13
pkgrel=1
pkgdesc="Postgres extension that provides vector similarity search functions. It is written in Rust and based on pgrx."
arch=(x86_64)
url="https://github.com/tensorchord/pgvecto.rs"
license=('Apache-2.0')
depends=('cargo-nightly' 'clang' 'postgresql' 'postgresql-libs' 'openssl' 'readline'  'libxml2' 'libxslt' 'zlib' 'ccache' 'git')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tensorchord/pgvecto.rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e78105b94b20f072d1330c9e5dead1f91b3e210f9f824afe858f2b10d5a9d2a6')

prepare() {
    cd $pkgname-$pkgver
    cargo install cargo-pgrx --git https://github.com/tensorchord/pgrx.git --rev $(cat Cargo.toml | grep "pgrx =" | awk -F'rev = "' '{print $2}' | cut -d'"' -f1)
}

build() {
    cd ${pkgname}-${pkgver}
    # cargo install cargo-pgrx --git https://github.com/tensorchord/pgrx.git --rev $(cat Cargo.toml | grep "pgrx =" | awk -F'rev = "' '{print $2}' | cut -d'"' -f1)
    cargo pgrx init --pg16=/usr/bin/pg_config
    cargo pgrx install --release
}

package() {
    cd "${pkgname}-${pkgver}/release/vectors-pg16"
    install -Dm0755 usr/lib/postgresql/vectors.so "${pkgdir}/usr/lib/postgresql/vectors.so"
    install -Dm0644 "usr/share/postgresql/extension/vectors--${pkgver}.sql" "${pkgdir}/usr/share/postgresql/extension/vectors--${pkgver}.sql"
    install -Dm0644 usr/share/postgresql/extension/vectors.control "${pkgdir}/usr/share/postgresql/extension/vectors.control"
}
