# Maintainer: pikl <me@pikl.uk>

_pgver=16  # postgresql version
_pkgbase=pgvecto.rs
pkgname=${_pkgbase}-immich
pkgver=0.2.0
pkgrel=6
pkgdesc="Postgres extension that provides vector similarity search functions. It is written in Rust and based on pgrx. Version required for Immich."
arch=(x86_64)
url="https://github.com/tensorchord/pgvecto.rs"
license=('Apache-2.0')
# make deps determined from here - https://docs.pgvecto.rs/developers/development.html
makedepends=('rustup' 'bison' 'ccache' 'flex' 'gcc' 'git' 'gnupg' 'readline' 'libxml2' 'libxslt' 'lsb-release' 'pkgconf' 'tzdata' 'zlib' "postgresql>=${_pgver}" 'clang16' 'make')
# build fails with LTO enabled
options=('!lto')
provides=("pgvecto.rs=$pkgver")
conflicts=('pgvecto.rs')
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/tensorchord/pgvecto.rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('671bfe39a3b87d5dfa5229ab0beffff1bd09686b53779dc511248e79aa4b2646')

_gettcstr() {
    cd ${srcdir}/${_pkgbase}-${pkgver}
    _toolchain=$(cat rust-toolchain.toml | grep ^channel | cut -d" " -f 3 | tr -d '"')
    echo "$_toolchain-$CARCH-unknown-linux-gnu"
}

prepare() {

    # https://docs.pgvecto.rs/developers/development.html

    cd ${srcdir}/${_pkgbase}-${pkgver}

    # workaround to 0.0.0 version number in Cargo.toml
    # TODO report to upstream
    sed -i -e "s/version = \"0.0.0\"/version = \"${pkgver}\"/" Cargo.toml

    # determine required version of cargo-pgrx
    _pgrxver=$(grep 'pgrx = { version =' Cargo.toml | cut -d '"' -f 2)
    
    # specifying toolchain version is not strictly necessary since cargo will do it automatically
    # although can bt overwritten easily with environment variables, e.g. RUSTUP_TOOLCHAIN=stable
    # so most probably best to install is explicitly with this command
    rustup toolchain install "$(_gettcstr)"
    
    # an alternative method for installing cargo-pgrx for debug is to clone the repo direct using
    # sources, however:
    #    * ensure https://github.com/tensorchord/pgrx.git fork is cloned
    #    * often the version number is not tagged, so use the commit hash to checkout the correct version
    #    * only build the cargo-pgrx sub-module using `cargo build --release --locked -p cargo-pgrx`
    cargo install --locked --version ${_pgrxver} cargo-pgrx
}

build() {

    # https://docs.pgvecto.rs/developers/development.html
    # https://docs.pgvecto.rs/getting-started/installation.html

    rustup toolchain install "$(_gettcstr)"
    cd ${srcdir}/${_pkgbase}-${pkgver}

    # workaround problem in pgrx.git cargo-pgrx/src/command/schema.rs:531 where an empty argument
    # to the rustc compiler command is generated if RUSTFLAGS environment variable is defined but
    # empty - as is typical in arch build environment
    # TODO report upstream
    unset RUSTFLAGS

    # add clang-16 to the path so it back be found by cargo pgrx
    export PATH="${PATH}:/usr/lib/llvm16/bin"

    # desired postgresql version only
    cargo pgrx init --pg16=/usr/bin/pg_config
    
    # equivalent to `cargo pgrx install --release` without installing
    cargo pgrx package
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}/target/release/vectors-pg${_pgver}"
    install -Dm0755 usr/lib/postgresql/vectors.so "${pkgdir}/usr/lib/postgresql/vectors.so"
    install -Dm0644 "usr/share/postgresql/extension/vectors--${pkgver}.sql" "${pkgdir}/usr/share/postgresql/extension/vectors--${pkgver}.sql"
    install -Dm0644 usr/share/postgresql/extension/vectors.control "${pkgdir}/usr/share/postgresql/extension/vectors.control"

    cd "${srcdir}/${_pkgbase}-${pkgver}/sql/upgrade"
    # upgrade scripts
    cp -r vectors--*.sql "${pkgdir}/usr/share/postgresql/extension"
}
