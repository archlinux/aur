# Maintainer: yagopop42@gmail.com

pkgname=zapret-rust-git
_pkgname=zapret-rust
pkgver=2.1.0.r0.g0000000
pkgrel=1

pkgdesc="Zapret-Rust TUI for DPI bypass (git version)"
arch=('x86_64')
url="https://github.com/Sergeydigl3/zapret-discord-youtube-rust"
license=('MIT')

depends=(
    'glibc'
    'gcc-libs'
    'nftables'
    'polkit'
)

makedepends=(
    'cargo'
    'git'
)

provides=(
    "zapret-rust"
)
conflicts=(
    'zapret-rust'
)

install=zapret-rust.install

source=(
    "${_pkgname}::git+${url}.git"
)

sha256sums=(
    'SKIP'
)

_src_root="${srcdir}/${_pkgname}"

pkgver() {
    git -C "$_src_root" \
        describe \
        --long \
        --tags \
        --match 'zapret-rust-v*' \
        --abbrev=7 |
        sed \
            -e 's/^zapret-rust-v//' \
            -e 's/-/.r/' \
            -e 's/-/./'
}

_cargo_home="${srcdir}/cargo-home"
_manifest_path="${_src_root}/Cargo.toml"

prepare() {
    CARGO_HOME="${_cargo_home}" cargo fetch --locked --manifest-path "$_manifest_path"
}

build() {
    CARGO_HOME="${_cargo_home}" cargo build --release --frozen --manifest-path "$_manifest_path"
}

package() {
    # Actual binary
    install -Dm755 "${_src_root}/target/release/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"

    # Persistent application data
    install -dm755 "${pkgdir}/var/lib/${_pkgname}"

    # Wrapper
    install -dm755 "${pkgdir}/usr/bin"

    cat >"${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/sh

exec /usr/lib/zapret-rust/zapret-rust \
    --cache-dir /var/lib/zapret-rust \
    "$@"
EOF

    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
}
