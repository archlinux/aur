# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>
pkgname=wleave
pkgver=0.6.2
pkgrel=1
pkgdesc="A Wayland-native logout script written in GTK4 "
arch=('x86_64')
url="https://github.com/AMNatty/wleave"
source=("wleave::git+https://github.com/AMNatty/wleave#tag=${pkgver}")
b2sums=('SKIP')
depends=('librsvg' 'libadwaita')
makedepends=('cargo' 'git' 'scdoc')
license=("MIT")
conflicts=("wleave-git")

prepare() {
    cd "$pkgname" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --locked
}

build() {
    scdoc < "${pkgname}/man/wleave.1.scd" | gzip > "${pkgname}/wleave.1.gz"
    scdoc < "${pkgname}/man/wleave.5.scd" | gzip > "${pkgname}/wleave.5.gz"

    cd "${pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make wleave
}

package() {
    install -Dm755 "$pkgname/target/release/wleave" "$pkgdir/usr/bin/wleave"
    install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 -t "$pkgdir/etc/wleave" "$pkgname/"{"style.css","layout.json"}

    install -Dm644 "$pkgname/completions/wleave.bash" "$pkgdir/usr/share/bash-completion/completions/wleave"
    install -Dm644 "$pkgname/completions/_wleave" "$pkgdir/usr/share/zsh/site-functions/_wleave"
    install -Dm644 "$pkgname/completions/wleave.fish" "$pkgdir/usr/share/fish/vendor_completions.d/wleave.fish"

    install -Dm644 -t "$pkgdir/usr/share/wleave/icons" "$pkgname/icons"/*.svg

    install -Dm644 -t "$pkgdir/usr/share/man/man1" "${pkgname}/wleave.1.gz"
    install -Dm644 -t "$pkgdir/usr/share/man/man5" "${pkgname}/wleave.5.gz"
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
