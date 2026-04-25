# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-authenticator-git
_name=${pkgname%-git}
pkgver=1.1.4.r58282.g0ff71a5
pkgrel=1
pkgdesc='2FA app from Proton to securely sync and backup 2FA codes'
arch=(x86_64)
url='https://proton.me/authenticator'
license=(GPL-3.0-or-later)
depends=(cairo
         dbus
         gdk-pixbuf2
         glib2
         glibc
         gtk3
         hicolor-icon-theme
         libgcc
         libsoup3
         webkit2gtk-4.1)
makedepends=(cargo git jq nodejs-lts-jod yarn)
provides=($_name)
conflicts=($_name)
source=(ProtonWebClients::git+https://github.com/ProtonMail/WebClients.git
        $_name.desktop)
b2sums=('SKIP'
        '2d31d11d97e4a8163b199eed52d920d6ef68bb51e91aa6270e00350a3f9f8f4d265a1dfc995eb6a6e3a4a7ba4a52c49dfe66da32c146f36a5c2c44b68bcda531')

pkgver() {
    cd ProtonWebClients
    printf "%s.r%s.g%s" \
        "$(cargo metadata --manifest-path applications/authenticator/src-tauri/Cargo.toml --no-deps --format-version 1 | jq -r '.packages[0].version')" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd ProtonWebClients

    # Configure Yarn workspaces to build only authenticator instead of all applications
    sed -i 's/"applications\/\*",/"applications\/authenticator",/' package.json

    # Modify tauri build script to use --frozen flag for reproducible builds
    sed -i 's/tauri build -v --no-bundle/tauri build -v --no-bundle -- --frozen/g' \
        applications/authenticator/tools/build.sh

    export YARN_CACHE_FOLDER="$srcdir/.yarn-cache"
    yarn install

    cd applications/authenticator/src-tauri
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd ProtonWebClients

    # Fix ring crate LTO incompatibility with fat LTO objects
    export CFLAGS="${CFLAGS} -ffat-lto-objects"
    export CXXFLAGS="${CXXFLAGS} -ffat-lto-objects"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true

    yarn workspace proton-authenticator build:desktop
}

check() {
    cd ProtonWebClients
    yarn workspace proton-authenticator test:ci
}

package() {
    cd ProtonWebClients/applications/authenticator

    install -Dm755 src-tauri/target/release/$_name -t "$pkgdir/usr/bin"
    install -Dm644 "$srcdir/$_name.desktop" -t "$pkgdir/usr/share/applications"

    cd src-tauri/icons
    install -Dm644 32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_name.png"
    install -Dm644 64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_name.png"
    install -Dm644 128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_name.png"
    install -Dm644 128x128@2x.png "$pkgdir/usr/share/icons/hicolor/128x128@2/apps/$_name.png"
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_name.png"
}
