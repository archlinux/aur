# Maintainer: Tempik25 <tempik@mail.tempestfoundation.org>
pkgname=rustffetch-git
pkgver=0.1.0.r2.gb928ea2
pkgdesc='Simple, fast and flexible neofetch-like information manager.'
pkgrel=1
arch=('x86_64')
url="https://github.com/tempik25/rustffetch"
license=('GPLv3.0-or-later')
depends=('rustup' 'cargo')
makedepends=('git')
source=("git+https://github.com/tempik25/rustffetch.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/rustffetch"
    echo "0.1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/rustffetch"
    cargo build --release
}

package() {
    cd "$srcdir/rustffetch"

    # bin
    install -Dm755 target/release/rustffetch "$pkgdir/usr/bin/rustffetch"

    # /usr/share
    install -d "$pkgdir/usr/share/rustffetch/distro"
    for f in distro/*; do
        install -Dm644 "$f" "$pkgdir/usr/share/rustffetch/distro/$(basename "$f")"
    done
    install -Dm644 default.jsonc "$pkgdir/usr/share/rustffetch/default.jsonc"

    # /etc/skel/.config
    install -d "$pkgdir/etc/skel/.config/rustffetch/distro"
    for f in distro/*; do
        install -Dm644 "$f" "$pkgdir/etc/skel/.config/rustffetch/distro/$(basename "$f")"
    done
    install -Dm644 default.jsonc "$pkgdir/etc/skel/.config/rustffetch/default.jsonc"
}
