# Maintainer: Alexander Björk <aur.operator320@passmail.net>
pkgname=sisr
pkgver=0.4.2
pkgrel=2
pkgdesc="Steam Input System Redirector"
arch=('x86_64')
url="https://github.com/Alia5/SISR"
license=('GPL-3.0-or-later')
depends=('gdk-pixbuf2' 'sdl3' 'gtk3' 'openssl' 'xdotool' 'glib2' 'glibc' 'viiper')
makedepends=('rust' 'git' 'cmake' 'libxss' 'alsa-lib' 'npm')
provides=('sisr')
conflicts=('sisr-bin' 'sisr-git')
options=('!lto')
install=sisr.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "sisr.desktop"
        "sisr.conf"
        "99-sisr.rules"
        "sisr.install")
sha256sums=('9f84c441dd1be6104e50f54f1f63c65107c035ca4bc14973f4a232824bfb4979'
            '1f720fb4555fe2a31ebfc0d1d924e15a144a5d5b90b9dcdfbef85f18d60a8a90'
            '8bd30d12950f630623b954da8caee6198d89f03d7ba16a25a0e8e96624b7a559'
            'e6484bcff94b3b10464e6bd69f6f75809382b0332db7008a6cfab06d18f5e829'
            '2e3e2d04ba1712b1ce2e3ad22369b9817509c04eab4a8336316a87b52c0f93e3')

prepare() {
    cd "SISR-$pkgver"
    
    # Cargo.toml says version 0.0.1 so we hack this a little bit so SISR stops complaining
    sed -i "s/version = \"0.0.1\"/version = \"$pkgver\"/" Cargo.toml

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"

    cd CEF_Payloads
    npm install
    cd ..

    cd UI
    echo "PUBLIC_LOG_LEVEL=info" > .env
    npm install
}

build() {
    cd "SISR-$pkgver"

    cd CEF_Payloads
    npm run build
    cd ..

    cd UI
    npm run build
    cd ..

    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

package() {
    cd "$srcdir"

    install -Dm755 "SISR-$pkgver/target/release/SISR" "$pkgdir/usr/bin/sisr"
    install -Dm644 "sisr.desktop" "$pkgdir/usr/share/applications/sisr.desktop"
    install -Dm644 "sisr.conf" "$pkgdir/usr/lib/modules-load.d/sisr.conf"
    install -Dm644 "99-sisr.rules" "$pkgdir/usr/lib/udev/rules.d/99-sisr.rules"
}
