# Maintainer: yagopop42@gmail.com

pkgname=zapret-rust-git
_pkgname=zapret-rust
pkgver=2.1.0.r4.g76540dc
pkgrel=3

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

options=(
    '!lto'
)

install=zapret-rust.install

source=(
    "${_pkgname}::git+${url}.git"
)

sha256sums=(
    'SKIP'
)

pkgver() {
    git -C "${srcdir}/${_pkgname}" describe \
        --long \
        --tags \
        --match 'zapret-rust-v*' \
        --abbrev=7 |
        sed \
            -e 's/^zapret-rust-v//' \
            -e 's/-/.r/' \
            -e 's/-/./'
}

prepare() {
    RUSTUP_TOOLCHAIN=stable \
        CARGO_HOME="${srcdir}/cargo-home" \
        cargo fetch \
        --locked \
        --manifest-path "${srcdir}/${_pkgname}/Cargo.toml"
}

build() {
    RUSTUP_TOOLCHAIN=stable \
        CARGO_HOME="${srcdir}/cargo-home" \
        cargo build \
        --release \
        --frozen \
        --manifest-path "${srcdir}/${_pkgname}/Cargo.toml"
}

package() {
    install -Dm755 \
        "${srcdir}/${_pkgname}/target/release/${_pkgname}" \
        "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"

    install -dm755 \
        "${pkgdir}/var/lib/${_pkgname}"

    install -dm755 \
        "${pkgdir}/usr/bin"

    cat >"${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/sh

exec /usr/lib/zapret-rust/zapret-rust \
    --cache-dir /var/lib/zapret-rust \
    "$@"
EOF

    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
}
