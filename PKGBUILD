# Maintainer: buj <buj351@outlook.com>
pkgbase=surrealql-language-server-git
pkgname=(surrealql-language-server-git surrealql-tree-sitter-git)
pkgver="0.1.2"
pkgrel=2
pkgdesc="SurrealQL Language Server"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=(Apache-2.0)
source=(surql::git+https://github.com/surrealdb/surrealql-language-server.git
        surql-ts::git+https://github.com/surrealdb/surrealql-tree-sitter.git)
makedepends=(cargo jq grep)
sha256sums=(SKIP SKIP)
options=(!lto)

pkgver() {
    cd "$srcdir/surql"
    cargo metadata --format-version 1 --no-deps | jq -r '.packages.[] | select(.name=="surrealql-language-server") | .version'
}

prepare() {
    cd "$srcdir/surql"
    cargo fetch --locked --target host-tuple
}

check() {
    export RUST_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS="${CFLAGS//-flto}"
    export CXXFLAGS="$CFLAGS"

    cd "$srcdir/surql"
    TREE_SITTER_SURREALQL_DIR="$(realpath "../surql-ts")" cargo test --frozen --all-features
}

build() {
    export RUST_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS="${CFLAGS//-flto}"
    export CXXFLAGS="$CFLAGS"

    cd "$srcdir/surql"

    #cargo build --release
    TREE_SITTER_SURREALQL_DIR="$(realpath "../surql-ts")" cargo build --frozen --release --all-features

    cd "../surql-ts"

    gcc -shared $CFLAGS $(find -name '*.c') -o tssurreal.so
}

package_surrealql-language-server-git() {
    provides=(surrealql-language-server)
    conflicts=(surrealql-language-server)

    mkdir -p "$pkgdir/usr/bin"
    _target_dir="$(cd "$srcdir/surql" && cargo metadata --format-version 1 --no-deps | jq -r .target_directory)"
    install -Dm0755 "$_target_dir/release/surrealql-language-server" "$pkgdir/usr/bin/surrealql-language-server"
}

package_surrealql-tree-sitter-git() {
    provides=(surrealql-tree-sitter)
    conflicts=(surrealql-tree-sitter)

    mkdir -p "$pkgdir/usr/lib/tree_sitter"
    install -Dm0755 "$srcdir/surql-ts/tssurreal.so" "$pkgdir/usr/lib/libtree-sitter-surrealql.so"
    ln -s "/usr/lib/libtree-sitter-surrealql.so" "$pkgdir/usr/lib/tree_sitter/surrealql.so"
}
