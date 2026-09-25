# Maintainer: Ammonium <diego.garcia.cr@gmail.com>
## This is a modified version of the original PKGBUILD for niri-git,
## Made to build from the barrulus/biri fork as an "alt install" that can coexist
## with niri: binaries, session files and config dir are all named biri.
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

pkgname=biri-altinstall-git
_srcname=biri
pkgver=26.04.r517.g7ba4192
pkgrel=1
pkgdesc="Niri compositor soft-fork with several added quality of life features (installed as biri, alongside niri)"
arch=(x86_64 aarch64)
url="https://github.com/barrulus/${_srcname}"
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
provides=("biri=${pkgver}")
conflicts=("biri")
options=(!debug !lto !strip)
source=("${_srcname}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "${_srcname}"
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
  cd "${_srcname}"
  # Tuning cargo
  export CARGO_HOME="${srcdir}/${_srcname}/.cargo"    # Download all to src directory, not in ~/.cargo

  # Rename everything user-visible from niri to biri so this can be installed
  # next to a regular niri. The IPC protocol and NIRI_* env vars are unchanged.
  sed -i \
    -e 's|ProjectDirs::from("", "", "niri")|ProjectDirs::from("", "", "biri")|' \
    -e 's|"/etc/niri/config.kdl"|"/etc/biri/config.kdl"|' \
    -e 's|env::set_var("XDG_CURRENT_DESKTOP", "niri")|env::set_var("XDG_CURRENT_DESKTOP", "biri:niri")|' \
    -e 's|^\( *\)"niri",$|\1"biri",|' \
    src/main.rs
  sed -i 's|\$XDG_CONFIG_HOME/niri/config.kdl|$XDG_CONFIG_HOME/biri/config.kdl|' src/cli.rs
  sed -i 's|~/\.config/niri/|~/.config/biri/|g' resources/default-config.kdl
  sed -i 's|\${NIRI:-niri}|${NIRI:-biri}|' resources/shaders/scripts/*

  sed -i 's/\bniri\b/biri/g' resources/niri-session resources/niri.service resources/niri-shutdown.target
  sed -i \
    -e 's|^ExecStart=biri |ExecStart=/usr/bin/biri |' \
    resources/niri.service
  sed -i \
    -e 's|^Name=Niri$|Name=Biri|' \
    -e 's|^Exec=niri-session$|Exec=biri-session|' \
    -e 's|^DesktopNames=niri$|DesktopNames=biri;niri|' \
    resources/niri.desktop

  # Fail loudly if upstream changed and a substitution silently missed.
  grep -qF 'ProjectDirs::from("", "", "biri")' src/main.rs
  grep -qF '"/etc/biri/config.kdl"' src/main.rs
  grep -qF '"XDG_CURRENT_DESKTOP", "biri:niri"' src/main.rs
  grep -qE '^ *"niri",$' src/main.rs && return 1
  grep -qF 'exec biri --session' resources/niri-session
  grep -qF 'niri.service' resources/niri-session && return 1
  grep -qxF 'ExecStart=/usr/bin/biri --session' resources/niri.service
  grep -qxF 'Exec=biri-session' resources/niri.desktop

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcname}"

  # Tuning rust compiler
  [[ -n "${_sccache}" ]] && export RUSTC_WRAPPER=sccache  # If $_sccache not empty, build using binary cache

  # Tuning cargo
  export CARGO_HOME="${srcdir}/${_srcname}/.cargo"    # Use downloaded earlier from src directory, not from ~/.cargo
  export CARGO_TARGET_DIR=target                        # Place the output in target relative to the current directory

  cargo build --frozen --release
}

package() {
  cd "${_srcname}"
  install -Dm755 target/release/niri                 "${pkgdir}/usr/bin/biri"
  install -Dm755 resources/niri-session              "${pkgdir}/usr/bin/biri-session"
  install -Dm644 resources/default-config.kdl     -t "${pkgdir}/usr/share/doc/biri"
  install -Dm644 resources/niri.desktop              "${pkgdir}/usr/share/wayland-sessions/biri.desktop"
  install -Dm644 resources/niri-portals.conf         "${pkgdir}/usr/share/xdg-desktop-portal/biri-portals.conf"
  install -Dm644 resources/niri.service              "${pkgdir}/usr/lib/systemd/user/biri.service"
  install -Dm644 resources/niri-shutdown.target      "${pkgdir}/usr/lib/systemd/user/biri-shutdown.target"

  # Bundle the shader collection so users have a local copy to seed
  # ~/.config/biri/ from (see resources/shaders/README.md).
  local shaderdir="${pkgdir}/usr/share/doc/biri/shaders"
  cp -r resources/shaders "${shaderdir}"
  find "${shaderdir}" -type d -exec chmod 755 {} +
  find "${shaderdir}" -type f -exec chmod 644 {} +
  chmod 755 "${shaderdir}"/scripts/*
}
