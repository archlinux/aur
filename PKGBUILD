# Maintainer: Natty4 <natty.sh.git at gmail dot com>
pkgname="wleave-git"
pkgver=0.3.0.r0.ge2a7f50
pkgrel=1
pkgdesc="A Wayland-native logout menu, fork of Wlogout"
arch=("x86_64")
license=("MIT")
url="https://github.com/AMNatty/wleave"
source=("${pkgname}::git+${url}?signed")
validpgpkeys=('4F9434A2EAC21BEC148F3656BF6CB659ADEE60EC')
sha1sums=('SKIP')
makedepends=("cargo" "git" "scdoc")
depends=("gtk3" "gtk-layer-shell")
optdepends=("swaylock: default buttons"
            "systemd: default buttons")
backup=("etc/wleave/"{"style.css","layout"})

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    scdoc < "${srcdir}/${pkgname}/man/wleave.1.scd" | gzip > "${srcdir}/${pkgname}/wleave.1.gz"
    scdoc < "${srcdir}/${pkgname}/man/wleave.5.scd" | gzip > "${srcdir}/${pkgname}/wleave.5.gz"

    cd "${srcdir}/${pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make wleave
}

package() {
    install -Dm755 "$srcdir/$pkgname/target/release/wleave" "$pkgdir/usr/bin/wleave"
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 -t "$pkgdir/etc/wleave" "$srcdir/$pkgname/"{"style.css","layout"}

    install -Dm644 "$srcdir/$pkgname/completions/wleave.bash" "$pkgdir/usr/share/bash-completion/completions/wleave"
    install -Dm644 "$srcdir/$pkgname/completions/_wleave" "$pkgdir/usr/share/zsh/site-functions/_wleave"
    install -Dm644 "$srcdir/$pkgname/completions/wleave.fish" "$pkgdir/usr/share/fish/vendor_completions.d/wleave.fish"

    install -Dm644 -t "$pkgdir/usr/share/wleave/icons" "$srcdir/$pkgname/icons"/*

    install -Dm644 -t "$pkgdir/usr/share/man/man1" "${srcdir}/${pkgname}/wleave.1.gz"
    install -Dm644 -t "$pkgdir/usr/share/man/man5" "${srcdir}/${pkgname}/wleave.5.gz"
}
