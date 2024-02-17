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
pkgver=0.1.2
pkgrel=1
pkgdesc="Scrollable-tiling Wayland compositor"
arch=(aarch64 x86_64)
url="https://github.com/YaLTeR/${pkgname}"
license=(GPL-3.0-or-later)
depends=(cairo glib2 libinput libpipewire libxkbcommon mesa pango pixman seatd)
makedepends=(clang rust)
[[ -n ${_sccache} ]] && makedepends+=(sccache)
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
conflicts=(${pkgname}-git ${pkgname}-bin)
options=(!debug !lto)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('e2883a3a2abfc1a0f4532b1b7ec2f256dca8c9f49921205d3827a42837aa5dfb0013a3092bd2558205cd6bbb299ba7ed571ecb8900869710cb1ac917d2195e53')

prepare() {
  cd ${pkgname}-${pkgver}
  export CARGO_HOME=${srcdir}/${pkgname}-${pkgver}/.cargo         # Download all to src directory, not in ~/.cargo
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${pkgname}-${pkgver}
  [[ -n ${_sccache} ]] && export RUSTC_WRAPPER=sccache            # If $_sccache not empty, build using binary cache
  export RUSTFLAGS="--remap-path-prefix=${srcdir}=/"              # Prevent warning: 'Package contains reference to $srcdir'
  export CARGO_HOME=${srcdir}/${pkgname}-${pkgver}/.cargo         # Use downloaded earlier from src directory, not from ~/.cargo
  export CARGO_TARGET_DIR=target                                  # Place the output in target relative to the current directory
  cargo build --frozen --release
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 target/release/${pkgname}                       -t ${pkgdir}/usr/bin/
  install -Dm755 resources/${pkgname}-session                    -t ${pkgdir}/usr/bin/
  install -Dm644 resources/${pkgname}.desktop                    -t ${pkgdir}/usr/share/wayland-sessions/
  install -Dm644 resources/${pkgname}-portals.conf               -t ${pkgdir}/usr/share/xdg-desktop-portal/
  install -Dm644 resources/${pkgname}{.service,-shutdown.target} -t ${pkgdir}/usr/lib/systemd/user/
}
