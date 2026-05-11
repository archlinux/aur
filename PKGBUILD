# Maintainer: k4lizen <k4lizen (awa) proton.me>
# I hacked this package together by looking at niri-dinit and niri-git.
# Contributor: Mark Karlinsky <mark.devnull@gmail.com>
# Contributor: cosmo <aur@dawnson.is>
# Contributor: FreeFull <jazz2rulez@gmail.com>
# Contributor: Julius Michaelis <gitter@liftm.de.de>
# Contributor: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

## The following variable can be customized at build time.
## Use env or export to change at your wish
##
##   Example: env _sccache=y makepkg -sc
##
## Default is: None => not use sccache
##
## More info: https://github.com/mozilla/sccache
: ${_sccache:=}

pkgname=niri-dinit-git
pkgver=26.04.r20.g3819182
pkgrel=3
pkgdesc="Scrollable-tiling Wayland compositor, with dinit instead of systemd, from source."
arch=(x86_64 aarch64)
url="https://github.com/niri-wm/niri"
license=(GPL-3.0-or-later)
depends=(cairo glib2 libdisplay-info libinput libpipewire libxkbcommon mesa pango pixman seatd)
makedepends=(clang rust git makepkg-git-lfs-proto)
[[ -n "${_sccache}" ]] && makedepends+=(sccache)
optdepends=('fuzzel: application launcher similar to rofi drun mode'
            'waybar: highly customizable Wayland bar'
            'alacritty: a cross-platform OpenGL terminal emulator'
            'mako: notification daemon for Wayland'
            'swaybg: wallpaper tool for Wayland compositors'
            'swaylock: screen locker for Wayland'
            'xdg-desktop-portal-gtk: implements most of the basic functionality'
            'xdg-desktop-portal-gnome: screencasting support'
            'gnome-keyring: implements the secret portal, for certain apps to work'
            'polkit-gnome: when apps need to ask for root permissions')
provides=("niri=${pkgver}")
conflicts=("niri" "niri-git" "niri-dinit")
options=(!debug !lto !strip)
source=("niri::git-lfs+$url.git#branch=main")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/niri"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/niri"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$(pwd)/.cargo"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/niri"

  # Prevent warning: 'Package contains reference to $srcdir'
  export CARGO_ENCODED_RUSTFLAGS="--remap-path-prefix=${srcdir}=/"
  # If $_sccache not empty, build using binary cache
  [[ -n "${_sccache}" ]] && export RUSTC_WRAPPER=sccache

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$(pwd)/.cargo"
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --no-default-features --features dinit,dbus,xdp-gnome-screencast
}

package() {
  cd "$srcdir/niri"
  install -Dm755 "target/release/niri"           -t "$pkgdir/usr/bin/"
  install -Dm755 "resources/niri-session"        -t "$pkgdir/usr/bin/"
  install -Dm644 "resources/niri.desktop"        -t "$pkgdir/usr/share/wayland-sessions/"
  install -Dm644 "resources/niri-portals.conf"   -t "$pkgdir/usr/share/xdg-desktop-portal/"
  install -Dm644 "resources/dinit/niri"          -t "$pkgdir/usr/lib/dinit.d/user/"
  install -Dm644 "resources/dinit/niri.target"   -t "$pkgdir/usr/lib/dinit.d/user/"
  install -Dm644 "resources/default-config.kdl"  -t "$pkgdir/usr/share/doc/$pkgname/"
}
