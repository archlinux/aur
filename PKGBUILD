# Maintainer: pikl <me@pikl.uk>
_pgver=16  # postgresql version
_pkgbase=pgvecto.rs
pkgname=${_pkgbase}-immich
pkgver=0.1.11
pkgrel=1
pkgdesc="Postgres extension that provides vector similarity search functions. It is written in Rust and based on pgrx. Version required for Immich."
arch=(x86_64)
url="https://github.com/tensorchord/pgvecto.rs"
license=('Apache-2.0')
makedepends=('cargo-nightly' 'clang' "postgresql>=${_pgver}" 'openssl' 'readline'  'libxml2' 'libxslt' 'zlib' 'ccache' 'git')
# build fails with LTO enabled
options=('!lto')
provides=('pgvecto.rs=0.1.11')
conflicts=('pgvecto.rs')
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/tensorchord/pgvecto.rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db1dfa32b44a42fb3759c8a2798d9052a1073de57222e91f97da4ba04178864f')

# https://github.com/tensorchord/pgvecto.rs/blob/main/docs/installation.md

prepare() {
    cd ${_pkgbase}-${pkgver}
    # _pgrxver=$(cat Cargo.toml | grep "pgrx =" | awk -F'rev = "' '{print $2}' | cut -d'"' -f1)
    _pgrxver=7c30e2023876c1efce613756f5ec81f3ab05696b
    cargo install cargo-pgrx --git https://github.com/tensorchord/pgrx.git --rev "$_pgrxver"
}

build() {
    cd ${_pkgbase}-${pkgver}
    cargo pgrx init "--pg${_pgver}=/usr/bin/pg_config"
    # `cargo pgrx install --release` without installing
    cargo pgrx package
}

package() {
    cd "${_pkgbase}-${pkgver}/target/release/vectors-pg${_pgver}"
    install -Dm0755 usr/lib/postgresql/vectors.so "${pkgdir}/usr/lib/postgresql/vectors.so"
    install -Dm0644 "usr/share/postgresql/extension/vectors--${pkgver}.sql" "${pkgdir}/usr/share/postgresql/extension/vectors--${pkgver}.sql"
    install -Dm0644 usr/share/postgresql/extension/vectors.control "${pkgdir}/usr/share/postgresql/extension/vectors.control"
}
