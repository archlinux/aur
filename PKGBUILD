# Maintainer: yagopop42@gmail.com

pkgname=zapret-rust-bin
_pkgname=zapret-rust
pkgver=2.1.0
pkgrel=2

pkgdesc="Zapret-Rust TUI for DPI bypass (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Sergeydigl3/zapret-discord-youtube-rust"
license=('MIT')

depends=(
    'glibc'
    'gcc-libs'
    'nftables'
    'polkit'
)

provides=("zapret-rust=${pkgver}")
conflicts=('zapret-rust')

install=zapret-rust.install

options=('!strip')

source_x86_64=(
    "${_pkgname}-${pkgver}::${url}/releases/download/zapret-rust-v${pkgver}/zapret-rust-linux-${arch[0]}"
)

sha256sums_x86_64=(
    '518409cc1322d21ce2b2497a08a185ce6e1a9604fa8d32b623d5828ac47431c9'
)

package() {
    # Upstream binary
    install -Dm755 \
        "${srcdir}/${_pkgname}-${pkgver}" \
        "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"

    # Persistent application data directory
    install -dm755 \
        "${pkgdir}/var/lib/${_pkgname}"

    # Wrapper
    install -dm755 "${pkgdir}/usr/bin"

    cat > "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/sh

exec /usr/lib/zapret-rust/zapret-rust \
    --cache-dir /var/lib/zapret-rust \
    "$@"
EOF

    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
}
