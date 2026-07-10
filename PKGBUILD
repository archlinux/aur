# Maintainer: temidaradev <temidaradev@proton.me>
# Contributor: umceko
pkgname=kopuz-git
pkgver=0.9.0.r2.g45515c01
pkgrel=1
pkgdesc="A modern music player (latest git, built from source)"
arch=('x86_64')
url="https://github.com/Kopuz-org/kopuz"
license=('MIT')
provides=('kopuz')
conflicts=('kopuz')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
    'glib-networking'
    'alsa-lib'
    'openssl'
    'xdotool'
    'dbus'
    'opus'
    'libayatana-appindicator'
)
makedepends=(
    'git'
    'rust'
    'nodejs'
    'npm'
    'cmake'
    'pkgconf'
)
optdepends=(
    'yt-dlp'
    'python-mutagen'
)
# makepkg's default lto option injects -flto=auto into CFLAGS; the bundled
# sqlite3.c then compiles to LTO bitcode that rustc's link of sqlx's proc-macro
# dylib silently drops, and the macro fails to load with
# "undefined symbol: sqlite3_value_type".
options=('!lto')
source=("$pkgname::git+https://github.com/Kopuz-org/kopuz.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    npm install
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    # tailwind.css is include_str!-embedded; regenerate it from the current
    # sources like upstream's own builds do, so styling matches this checkout.
    npx @tailwindcss/cli -i ./tailwind.css -o ./crates/kopuz/assets/tailwind.css \
        --content './crates/kopuz/**/*.rs,./crates/components/**/*.rs,./crates/pages/**/*.rs,./crates/hooks/**/*.rs,./crates/player/**/*.rs,./crates/reader/**/*.rs'
    cargo build --frozen --release -p kopuz
}

package() {
    cd "$pkgname"

    install -Dm755 target/release/kopuz "$pkgdir/usr/bin/kopuz"

    install -Dm644 "data/com.temidaradev.kopuz.desktop" \
        "$pkgdir/usr/share/applications/com.temidaradev.kopuz.desktop"
    sed -i "s|Exec=kopuz|Exec=/usr/bin/kopuz|" \
        "$pkgdir/usr/share/applications/com.temidaradev.kopuz.desktop"

    install -Dm644 "crates/kopuz/assets/logo.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.temidaradev.kopuz.png"

    install -Dm644 "data/com.temidaradev.kopuz.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/com.temidaradev.kopuz.metainfo.xml"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
