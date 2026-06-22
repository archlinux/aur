# Maintainer: Umar Alfarouk <medrivia@gmail.com>

# NOTE: tmux-mcp v0.5.0 via rmcp+schemars emits non-standard JSON Schema
# integer format values (int32/int64/uint32/uint64 etc.) for Rust integer
# types. These are OpenAPI/protobuf conventions, not part of JSON Schema
# 2020-12 spec; MCP clients such as opencode warn about every occurrence.
#
# Fix: patch schemars 1.2.1 via [patch.crates-io] to drop 'format' from
# integer type schemas. Only primitives.rs is touched; no behavioral change.
#
# Ideal upstream fixes:
#   rmcp:     add a StripIntegerFormats Transform in schema_for_type()
#             (SchemaSettings::with_transform() API already exists in 1.4.0)
#   schemars: make integer format emission opt-in via SchemaSettings

_upstream=tmux-mcp
pkgname=tmux-mcp-rs
pkgver=0.5.0
pkgrel=1
pkgdesc="A Model Context Protocol (MCP) server for tmux, written in Rust"
url="https://github.com/bnomei/tmux-mcp"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('libgcc' 'tmux')
makedepends=('cargo')
source=("${_upstream}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
        "LICENSE::${url}/raw/v${pkgver}/LICENSE"
        "schemars-1.2.1.crate::https://static.crates.io/crates/schemars/schemars-1.2.1.crate")
sha256sums=('7813536217920a3dd24eb719f8d0e8455987d67c85ff1d023c0ed1c8c1e73db1'
             '077d138387dd107179fec3cefab95ced64f27c20845d014488fc542c4093c962'
             'a2b42f36aa1cd011945615b92222f6bf73c599a102a300334cd7f8dbeec726cc')

prepare() {
    # .crate files are gzipped tarballs; bsdtar extracts them natively
    bsdtar -xf "$srcdir/schemars-1.2.1.crate" -C "$srcdir"

    local primitives="$srcdir/schemars-1.2.1/src/json_schema_impls/primitives.rs"

    # ranged_impl! (i8/i16/u8/u16) and unsigned_impl! (u32/u64/u128/usize):
    # remove the '"format": $format,' line (trailing-comma form, more fields follow)
    sed -i '/\"format\": \$format,$/d' "$primitives"

    # simple_impl! for signed integers (no trailing comma — last field in object):
    # switch i32/i64/i128/isize to the single-arg (no-format) macro variant
    sed -i \
        -e 's/simple_impl!(i32 => "integer", "int32");/simple_impl!(i32 => "integer");/' \
        -e 's/simple_impl!(i64 => "integer", "int64");/simple_impl!(i64 => "integer");/' \
        -e 's/simple_impl!(i128 => "integer", "int128");/simple_impl!(i128 => "integer");/' \
        -e 's/simple_impl!(isize => "integer", "int");/simple_impl!(isize => "integer");/' \
        "$primitives"

    # Wire the patched schemars into the build via [patch.crates-io].
    # cargo resolves patches before lockfile validation so the same version
    # (1.2.1) is used; only the source path changes.
    cat >> "${_upstream}-${pkgver}/Cargo.toml" << 'EOF'

[patch.crates-io]
schemars = { path = "../schemars-1.2.1" }
EOF
}

build() {
    cd "${_upstream}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    # [patch.crates-io] causes cargo to rewrite Cargo.lock (patch path changes
    # the checksum), so --frozen/--locked cannot be used here. --offline
    # prevents any network access while still allowing the lockfile update.
    cargo fetch --offline --target "$(rustc -vV | sed -n 's/host: //p')" || true
    cargo build --offline --release
}

check() {
    cd "${_upstream}-${pkgver}"
    cargo test --offline --release
}

package() {
    cd "${_upstream}-${pkgver}"
    install -Dm755 target/release/tmux-mcp-rs "$pkgdir/usr/bin/tmux-mcp-rs"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
