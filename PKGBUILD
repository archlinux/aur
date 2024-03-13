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
pkgver=0.1.3
pkgrel=2
pkgdesc="Scrollable-tiling Wayland compositor"
arch=(aarch64 x86_64)
url="https://github.com/YaLTeR/$pkgname"
license=(GPL-3.0-or-later)
depends=(cairo gcc-libs glib2 glibc libinput libpipewire libxkbcommon mesa pango pixman seatd systemd-libs)
makedepends=(clang rust)
[[ -n $_sccache ]] && makedepends+=(sccache)
optdepends=('fuzzel: application launcher similar to rofi drun mode'
            'waybar: highly customizable Wayland bar'
            'alacritty: a cross-platform OpenGL terminal emulator'
            'mako: notification daemon for Wayland'
            'swaybg: wallpaper tool for Wayland compositors'
            'swaylock: screen locker for Wayland'
            'xdg-desktop-portal-gtk: implements most of the basic functionality'
            'xdg-desktop-portal-gnome: screencasting support'
            'gnome-keyring: implements the secret portal, for certain apps to work'
            'polkit-gnome: when apps need to ask for root permissions'
            'meld: to synchronize config.kdl with new options from default-config.kdl')
conflicts=($pkgname)
options=(!debug !lto)
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('c28bb7ef1a71f352f199cbfe3c0eab3cde4432c357e4bb16eed026e68b48215087da723f03a2484c7bb5d0e84f83444570b4b36277bcec9ab7da8e5c25a00e62')

prepare() {
    cd $pkgname-$pkgver
    export CARGO_HOME=$srcdir/.cargo                                     # Download all to src directory, not in ~/.cargo
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    [[ -n $_sccache ]] && export RUSTC_WRAPPER=sccache                   # If $_sccache not empty, build using binary cache
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/"                     # Prevent warning: 'Package contains reference to $srcdir'
    export CARGO_HOME=$srcdir/.cargo                                     # Use downloaded earlier from src directory, not from ~/.cargo
    export CARGO_TARGET_DIR=target                                       # Place the output in target relative to the current directory
    cargo build --frozen --release
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 {target/release/$pkgname,resources/$pkgname-session} -t $pkgdir/usr/bin/
    install -Dm644 resources/$pkgname{.service,-shutdown.target}        -t $pkgdir/usr/lib/systemd/user/
    install -Dm644 {resources/default-config.kdl,README.md}             -t $pkgdir/usr/share/doc/$pkgname/
    install -Dm644 resources/$pkgname.desktop                           -t $pkgdir/usr/share/wayland-sessions/
    install -Dm644 resources/$pkgname-portals.conf                      -t $pkgdir/usr/share/xdg-desktop-portal/
}
