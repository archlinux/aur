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
pkgver=0.1.1
pkgrel=1
pkgdesc="Scrollable-tiling Wayland compositor"
arch=(x86_64 aarch64)
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
options=(!lto) # devtools issue
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('94f85876a2ccea0eade10de85d4f5a155ddd603f480c165dda61c1a16814a1a37c080be2fed97a2efb1aef3bdc048ba308c221193bdaadc148db8e4604b88a80')

prepare() {
  cd ${pkgname}-${pkgver}

  # Apply commits (fixies and new features) from source Github since last release, in proper order
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  #Tuning cargo
  export CARGO_HOME=${srcdir}/${pkgname}-${pkgver}/.cargo   # Download all to src folder, not in ~/.cargo

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${pkgname}-${pkgver}

  #Tuning rust compiler
  export RUSTFLAGS="--remap-path-prefix=${srcdir}=/"        # Prevent warning: 'Package contains reference to $srcdir'
  [[ -n ${_sccache} ]] && export RUSTC_WRAPPER=sccache      # If $_sccache not empty, build using binary cache

  #Tuning cargo
  export CARGO_HOME=${srcdir}/${pkgname}-${pkgver}/.cargo   # Use downloaded earlier from src folder, not from ~/.cargo
  export CARGO_TARGET_DIR=target                            # Place the output in target relative to the current directory

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
