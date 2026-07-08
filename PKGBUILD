# Maintainer: yobson <aur@yobson.xyz>
pkgname=steam-screenshot-importer
pkgdesc='Automates importing images to steam screenshots'
pkgver=0.4.0
pkgrel=1
arch=('any')
url='https://github.com/yobson1/steam-screenshot-importer'
license=('GPL-3.0-only')
makedepends=('git' 'cargo' 'cargo-tauri' 'pnpm')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'xdg-utils' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'cef')
source=("git+${url}.git?signed#tag=v${pkgver}")
validpgpkeys=('A41EB2986F63F6C40FCF2D03ED26A71EB8EB7A34') # Bradley (github commit signing key) <contact@yobson.xyz>
b2sums=('3bd916aa6cd934c95d1a94f56e17204adb59919c59897cf1616d31c5c6e336f8f97e5e864667af1525ee0e7d9cbe4966d922cad1689826ba717e0e8ec90a6c58')
options=('!lto')

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$srcdir/$pkgname"

    pnpm clean-install

    cd "src-tauri"
    cargo fetch --locked --target host-tuple

    # to grab the required steamworks sdk
    cd "tools/steamworks-fetcher"
    cargo fetch --locked --target host-tuple
    cargo run
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export NO_STEAMWORKS=1 # we already did this in prepare

    # a makepkg conf file may overwrite RUSTFLAGS, we need to set it here as per upstream:
    # https://github.com/yobson1/steam-screenshot-importer/blob/master/src-tauri/.cargo/config.toml
    export RUSTFLAGS="$RUSTFLAGS -C link-arg=-Wl,-rpath,\$ORIGIN:/usr/lib/cef:/usr/lib/steam-screenshot-importer"

    cd "$srcdir/$pkgname"
    cargo tauri build -b deb -- --frozen
}

package() {
    cd "$srcdir/$pkgname"

    local basever
    basever=$(echo "$pkgver" | cut -d. -f1-3)

    cp -a src-tauri/target/release/bundle/deb/${pkgname}_${basever}_*/data/* "${pkgdir}"
}
