# Maintainer: Christopher Snowhill <kode54@gmail.com>
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

pkgname=niri-spicy-git
pkgver=26.04.r87.g56b2df0
pkgrel=1
pkgdesc="Scrollable-tiling Wayland compositor, with some out of tree spice"
arch=(x86_64 aarch64)
url="https://github.com/niri-wm/${pkgname%-spicy-git}"
license=(GPL-3.0-or-later)
depends=(cairo glib2 libdisplay-info libinput libpipewire libxkbcommon mesa pango pixman seatd shaderc)
makedepends=(clang cmake rust git)
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
provides=("${pkgname%-spicy-git}=${pkgver}" 'wayland-compositor')
conflicts=("${pkgname%-spicy-git}-bin" "${pkgname%-spicy-git}")
options=(!debug !lto !strip)
source=("${pkgname%-spicy-git}::git+https://github.com/losnoco/niri.git#branch=spicy-main"
        "smithay::git+https://github.com/losnoco/smithay.git#branch=spicy-master")
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd "${pkgname%-spicy-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${pkgname%-spicy-git}"
  # Tuning cargo
  export CARGO_HOME="${srcdir}/${pkgname%-spicy-git}/.cargo"    # Download all to src directory, not in ~/.cargo

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-spicy-git}"

  # Tuning rust compiler
  export CARGO_ENCODED_RUSTFLAGS="--remap-path-prefix=${srcdir}=/"    # Prevent warning: 'Package contains reference to $srcdir'
  [[ -n "${_sccache}" ]] && export RUSTC_WRAPPER=sccache  # If $_sccache not empty, build using binary cache

  # Tuning cargo
  export CARGO_HOME="${srcdir}/${pkgname%-spicy-git}/.cargo"    # Use downloaded earlier from src directory, not from ~/.cargo
  export CARGO_TARGET_DIR=target                        # Place the output in target relative to the current directory

  cargo build --frozen --release
}

package() {
  cd "${pkgname%-spicy-git}"
  install -Dm755 "target/release/${pkgname%-spicy-git}"                       -t "${pkgdir}/usr/bin/"
  install -Dm755 "resources/${pkgname%-spicy-git}-session"                    -t "${pkgdir}/usr/bin/"
  install -Dm644 resources/default-config.kdl                         -t "${pkgdir}/usr/share/doc/niri"
  install -Dm644 "resources/${pkgname%-spicy-git}.desktop"                    -t "${pkgdir}/usr/share/wayland-sessions/"
  install -Dm644 "resources/${pkgname%-spicy-git}-portals.conf"               -t "${pkgdir}/usr/share/xdg-desktop-portal/"
  install -Dm644 "resources/${pkgname%-spicy-git}"{.service,-shutdown.target} -t "${pkgdir}/usr/lib/systemd/user/"
}
