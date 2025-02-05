# Maintainer: waltosoft <waltosoft at gmail dot com>
pkgname="curtains-close-git"
pkgver=0.1.1
pkgrel=2
pkgdesc="A configurable Wayland-native menu, for locking, rebooting, shuttondown, etc."
arch=("x86_64")
license=("MIT")
url="https://github.com/WaltoSoft/curtains-close"
source=("${pkgname}::git+${url}")
sha256sums=('SKIP') 
makedepends=("cargo" "git" "scdoc")
depends=("gtk4" "gtk4-layer-shell" "glib2" "ttf-material-design-icons-git" "noto-fonts")
backup=("etc/curtains-close/"{"style.css","settings.json"})

prepare() {
    cd "${srcdir}/${pkgname}"
    rustup default stable
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    scdoc < "${srcdir}/${pkgname}/man/curtains-close.1.scd" | gzip > "${srcdir}/${pkgname}/curtains-close.1.gz"
    scdoc < "${srcdir}/${pkgname}/man/curtains-close.5.scd" | gzip > "${srcdir}/${pkgname}/curtains-close.5.gz"

    cd "${srcdir}/${pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make curtains-close
}

package() {
    install -Dm755 "$srcdir/$pkgname/target/release/curtains-close" "$pkgdir/usr/bin/curtains-close"
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 -t "$pkgdir/etc/curtains-close" "$srcdir/$pkgname/"{"style.css","settings.json"}

    install -Dm644 "$srcdir/$pkgname/completions/curtains-close.bash" "$pkgdir/usr/share/bash-completion/completions/curtains-close"
    install -Dm644 "$srcdir/$pkgname/completions/_curtains-close" "$pkgdir/usr/share/zsh/site-functions/_curtains-close"
    install -Dm644 "$srcdir/$pkgname/completions/curtains-close.fish" "$pkgdir/usr/share/fish/vendor_completions.d/curtains-close.fish"

    install -Dm644 -t "$pkgdir/usr/share/man/man1" "${srcdir}/${pkgname}/curtains-close.1.gz"
    install -Dm644 -t "$pkgdir/usr/share/man/man5" "${srcdir}/${pkgname}/curtains-close.5.gz"
}
