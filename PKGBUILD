# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

## The following variable can be customized at build time.
## Use env or export to change at your wish
##
##   Example: env _sccache=y makepkg -sc
##
## Default is: None => not use sccache
##
## More info: https://github.com/mozilla/sccache
: ${_sccache:=}

pkgname=niri
pkgver=0.1.5
pkgrel=1
_commit=6a80078259ca3e3854b0748a15e98c7293d0822a
pkgdesc="Scrollable-tiling Wayland compositor"
arch=(aarch64 x86_64)
url="https://github.com/YaLTeR/$pkgname"
license=(GPL-3.0-or-later)
depends=(cairo gcc-libs glib2 glibc libinput libpipewire libxkbcommon mesa pango pixman seatd systemd-libs xdg-desktop-portal-gtk)
makedepends=(clang rust)
[[ -n $_sccache ]] && makedepends+=(sccache)
optdepends=('fuzzel: application launcher similar to rofi drun mode'
            'waybar: highly customizable Wayland bar'
            'alacritty: a cross-platform OpenGL terminal emulator'
            'mako: notification daemon for Wayland'
            'swaybg: wallpaper tool for Wayland compositors'
            'swaylock: screen locker for Wayland'
            'xdg-desktop-portal-gnome: screencasting support'
            'gnome-keyring: implements the secret portal, for certain apps to work'
            'polkit-gnome: when apps need to ask for root permissions')
options=(!debug !lto)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('deeea09391acaa5b576b230bf726cc5eb156ab918fe725929d9fbfbdcee273cd9790b2bf2b0ea1e85af405d1298d9c9a637c200c5297d3f002a58cb435d3308d')

prepare() {
    cd $pkgname-$pkgver
    sed -i 's/"unknown commit"/"'${_commit:0:7}'"/' src/utils/mod.rs
    export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    [[ -n $_sccache ]] && export RUSTC_WRAPPER=sccache
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
    export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 {target/release/$pkgname,resources/$pkgname-session} -t "$pkgdir"/usr/bin/
    install -Dm644 resources/$pkgname{.service,-shutdown.target}        -t "$pkgdir"/usr/lib/systemd/user/
    install -Dm644 {resources/default-config.kdl,README.md}             -t "$pkgdir"/usr/share/doc/$pkgname/
    install -Dm644 resources/$pkgname.desktop                           -t "$pkgdir"/usr/share/wayland-sessions/
    install -Dm644 resources/$pkgname-portals.conf                      -t "$pkgdir"/usr/share/xdg-desktop-portal/
}
