# Maintainer: yobson <aur@yobson.xyz>
pkgname=steam-screenshot-importer
pkgdesc='Automatic importing of screenshots into Steam using the Steamworks SDK'
pkgver=0.5.0
pkgrel=1
_steamworks_rs_ver=0.13.1
arch=('x86_64')
url="https://github.com/yobson1/${pkgname}"
license=('GPL-3.0-only')
makedepends=('git' 'cargo' 'cargo-tauri' 'pnpm')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'xdg-utils' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'cef' 'dav1d')
source=("git+${url}.git?signed#tag=v${pkgver}"
    "https://github.com/Noxime/steamworks-rs/raw/refs/tags/v${_steamworks_rs_ver}/steamworks-sys/lib/steam/redistributable_bin/linux64/libsteam_api.so")
validpgpkeys=('A41EB2986F63F6C40FCF2D03ED26A71EB8EB7A34') # Bradley (github commit signing key) <contact@yobson.xyz>
b2sums=('274b907acbd1bd0eed6fe60f38de17d78dbb4ec6249cb1819c9e4efd8a4987eff04ed1f86dfcfb7d2d60953377cdceefc81be0816400933126e766053135658a'
        '8e4502c07a034bcfbae2b57439d56c2bc3b48ef5f9d4737ee627bf2d0a82921c41a34df7611dd1f582e2782af2f4340e65e9f9b8409a563726d1bd7edcbeaf47')
options=('!lto')

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    mv libsteam_api.so "$srcdir/$pkgname/src-tauri/"
    cd "$srcdir/$pkgname"

    pnpm clean-install

    cd "src-tauri"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export NO_STEAMWORKS=1 # we already got this in our source array

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
