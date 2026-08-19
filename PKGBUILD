# Maintainer: Ammonium <diego.garcia.cr@gmail.com>
## This is a modified version of the original PKGBUILD for niri-git,
## Made to build from the barrulus/biri fork
## Credit to the original PKGBUILD code goes to their maintainers (see below)

# Maintainer: cosmo <aur@dawnson.is>
# Maintainer: FreeFull <jazz2rulez@gmail.com>
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

pkgname=biri-git
pkgver=26.04.r308.g999613f
pkgrel=2
pkgdesc="Niri compositor soft-fork with several added quality of life features"
arch=(x86_64 aarch64)
url="https://github.com/barrulus/${pkgname%-git}"
license=(GPL-3.0-or-later)
depends=(cairo glib2 libdisplay-info libinput libpipewire libxkbcommon mesa pango pixman seatd)
makedepends=(clang rust git)
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
conflicts=("niri-bin" "niri" "niri-git")
options=(!debug !lto !strip)
source=("${pkgname%-git}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  # This fork doesn't push tags to its own remote, but its history is a
  # direct continuation of upstream niri's, so pull niri's tags in to
  # describe against instead.
  git remote get-url upstream &>/dev/null || git remote add upstream "https://github.com/niri-wm/niri.git"
  # Don't abort in offline/network-isolated builds
  # where the tags are already cached from a previous fetch.
  git fetch -q upstream 'refs/tags/*:refs/tags/*' 2>/dev/null || true
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${pkgname%-git}"
  # Tuning cargo
  export CARGO_HOME="${srcdir}/${pkgname%-git}/.cargo"    # Download all to src directory, not in ~/.cargo

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"

  # Tuning rust compiler
  [[ -n "${_sccache}" ]] && export RUSTC_WRAPPER=sccache  # If $_sccache not empty, build using binary cache

  # Tuning cargo
  export CARGO_HOME="${srcdir}/${pkgname%-git}/.cargo"    # Use downloaded earlier from src directory, not from ~/.cargo
  export CARGO_TARGET_DIR=target                        # Place the output in target relative to the current directory

  cargo build --frozen --release
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/niri"                       -t "${pkgdir}/usr/bin/"
  install -Dm755 "resources/niri-session"                    -t "${pkgdir}/usr/bin/"
  install -Dm644 resources/default-config.kdl                         -t "${pkgdir}/usr/share/doc/niri"
  install -Dm644 "resources/niri.desktop"                    -t "${pkgdir}/usr/share/wayland-sessions/"
  install -Dm644 "resources/niri-portals.conf"               -t "${pkgdir}/usr/share/xdg-desktop-portal/"
  install -Dm644 "resources/niri"{.service,-shutdown.target} -t "${pkgdir}/usr/lib/systemd/user/"

  # Bundle the shader collection so users have a local copy to seed
  # ~/.config/biri/ from (see resources/shaders/README.md).
  local shaderdir="${pkgdir}/usr/share/doc/niri/shaders"
  cp -r resources/shaders "${shaderdir}"
  find "${shaderdir}" -type d -exec chmod 755 {} +
  find "${shaderdir}" -type f -exec chmod 644 {} +
  chmod 755 "${shaderdir}"/scripts/*
}
