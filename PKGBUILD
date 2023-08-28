# Maintainer: Yifan Zhu <fanzhuyifan[at]gmail[dot]com>

pkgname=eltrafico-git
pkgver=2.3.6.r14.2d32285
pkgrel=2
pkgdesc='NetLimiter-like traffic shaping for Linux'
arch=('x86_64')
url='https://github.com/sigmaSd/Eltrafico'
license=('GPL3')
depends=('bandwhich' 'iproute' 'polkit'
    'libgtk-3.so' 'libgdk-3.so' 'libpango-1.0.so' 'libcairo-gobject.so' 'libcairo.so'
    'libgdk_pixbuf-2.0.so' 'libgio-2.0.so' 'libgobject-2.0.so' 'libglib-2.0.so' 
)
optdepends=('nethogs: network traffic monitoring, alternative to bandwhich')
makedepends=('git' 'cargo' 'gtk3')
provides=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/sigmaSd/Eltrafico")
md5sums=('SKIP')

_pkgname="${pkgname%-git}"
_lib_path="/usr/lib/${_pkgname}"

pkgver() {
    cd "$srcdir/$pkgname"

    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cat > "${_pkgname}" << EOF
#!/usr/bin/env sh
exec ${_lib_path}/gui --eltrafico-tc ${_lib_path}/${_pkgname}-tc "\$@"
EOF
    chmod +x "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$pkgname"
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/${_lib_path}/" {} +
    install -Dm0755 -T "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
