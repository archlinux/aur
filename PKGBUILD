# Maintainer: Alexander Björk <aur.operator320@passmail.net>
pkgname=sisr
pkgver=0.3.1
pkgrel=1
pkgdesc="Steam Input System Redirector"
arch=('x86_64')
url="https://github.com/Alia5/SISR"
license=('GPL-3.0-or-later')
depends=('gdk-pixbuf2' 'sdl3' 'gtk3' 'openssl' 'xdotool' 'glib2' 'glibc' 'viiper')
makedepends=('rust' 'git' 'cmake' 'libxss' 'alsa-lib' 'npm')
provides=('sisr')
conflicts=('sisr-bin' 'sisr-git')
install=sisr.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "sisr.desktop"
        "sisr.conf"
        "99-sisr.rules"
        "sisr.install")
sha256sums=('2b7f426158c306236d8101ced04e40fff871e743c8c01291d44fae69bfde6290'
            '1f720fb4555fe2a31ebfc0d1d924e15a144a5d5b90b9dcdfbef85f18d60a8a90'
            '8bd30d12950f630623b954da8caee6198d89f03d7ba16a25a0e8e96624b7a559'
            'e6484bcff94b3b10464e6bd69f6f75809382b0332db7008a6cfab06d18f5e829'
            '2e3e2d04ba1712b1ce2e3ad22369b9817509c04eab4a8336316a87b52c0f93e3')

prepare() {
    cd "SISR-$pkgver"

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

    cd cef_injectee
    npm install
}

build() {
    cd "SISR-$pkgver"

    cd cef_injectee
    npm run build
    cd ..

    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir"

    install -Dm755 "SISR-$pkgver/target/release/SISR" "$pkgdir/usr/bin/sisr"
    install -Dm644 "sisr.desktop" "$pkgdir/usr/share/applications/sisr.desktop"
    install -Dm644 "sisr.conf" "$pkgdir/usr/lib/modules-load.d/sisr.conf"
    install -Dm644 "99-sisr.rules" "$pkgdir/usr/lib/udev/rules.d/99-sisr.rules"
}
