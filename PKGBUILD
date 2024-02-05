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
pkgrel=2
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
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz
        001.patch::${url}/commit/7a4bb8ba8ae9022c572c5d4b66182f1af7fd3fb7.patch # layout: Make rendering not Window-specific
        002.patch::${url}/commit/b824cf90ab10f4ba5e1e0b23e0b2cf840814c02a.patch # layout: Generalize traversal between rendering and input
        003.patch::${url}/commit/da826e42aaaa6dc559db67f4708db8bc23754f46.patch # layout: Add LayoutElementRenderElement
        004.patch::${url}/commit/57521c69c3a406789f38d8aa672b0bc15c947819.patch # layout: Add TileRenderElement

        005.patch::${url}/commit/bf978fe98db51c411fe7eedc0951b9ebc42a976d.patch # layout/tile: Return Iterator of render elements
        006.patch::${url}/commit/96016790b2f9f1356b6b581d5929d712058b73ca.patch # layout: Replace with_tiles_in_render_order() with Iterator
        007.patch::${url}/commit/b62a07956a112e4f34ebf51ddf83f2066398905c.patch # Add niri_render_elements! {}
        008.patch::${url}/commit/6bb83757ee907e5ce3be617251c441c02917388e.patch # Convert everything to niri_render_elements! {}
        009.patch::${url}/commit/3a23417e980de908c3183749da9309e9dabc9ece.patch # Add consume-or-expel-window-left/right commands
        010.patch::${url}/commit/3789d855886d490052e626c912b6e38dba691c68.patch # Add lib.rs, become a mixed lib-bin crate
        011.patch::${url}/commit/1706a46b2b89178e98d74eea55965b60f70b62cb.patch # layout: Mark some things as pub
        012.patch::${url}/commit/3dc4a5fdac0d1802372b9c90e374eb77c13de10c.patch # Fix Clippy warnings
        013.patch::${url}/commit/b0d0fce5f390479f7fef4814b325df1dfc25c63c.patch # Move use into feature-gated function
        #.patch::${url}/commit/.patch # sample
       )
b2sums=('94f85876a2ccea0eade10de85d4f5a155ddd603f480c165dda61c1a16814a1a37c080be2fed97a2efb1aef3bdc048ba308c221193bdaadc148db8e4604b88a80'
        'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'   # Skip checking hashsums of patches, Github issue
        'SKIP' 'SKIP' 'SKIP'
       )

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
