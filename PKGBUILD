# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=niri
pkgver=0.1.0
pkgrel=2
pkgdesc="Scrollable-tiling Wayland compositor"
arch=(x86_64)
url="https://github.com/YaLTeR/${pkgname}"
license=(GPL-3.0-or-later)
makedepends=(clang rust sccache)
depends=(cairo glib2 libinput libpipewire libxkbcommon mesa pango pixman seatd)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz
        001.patch::${url}/commit/367e4955ea05044b0151e0a39ea7061788d73af9.patch # Mark Msg as pub
        002.patch::${url}/commit/64c85d865ed4e5b97e8941135c742fd390738c50.patch # winit: Don't remove output on CloseRequested
        003.patch::${url}/commit/0ebcc3e0d6ff7eda50d54fce312d0d1a42bd8224.patch # Create default config file if missing
        004.patch::${url}/commit/51243a0a505a533057e7326fbbae882420f0d363.patch # Show notification about creating a default config
       )
b2sums=('b6160952c52033250922aaf7f7fc57094c678c9a3c0e54c2e63e33b5a8d46328f9cf58608b4b35b50078e953691d4ac448b5ac3e927833f757f23dba338e0847'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
       )
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
install=${pkgname}.install
#In devtools LTO is enabled by default, make sure this option is disabled
options=(!lto)

prepare() {
  cd ${pkgname}-${pkgver}
  # apply patch from the source array
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  export CARGO_HOME=${srcdir}/.cargo
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${pkgname}-${pkgver}
  export RUSTC_WRAPPER=sccache
  export CARGO_TARGET_DIR=target
  export CARGO_HOME=${srcdir}/.cargo
  cargo build --frozen --release
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 target/release/${pkgname}            -t ${pkgdir}/usr/bin/
  install -Dm755 resources/${pkgname}-session         -t ${pkgdir}/usr/bin/
  install -Dm644 resources/${pkgname}.desktop         -t ${pkgdir}/usr/share/wayland-sessions/
  install -Dm644 resources/${pkgname}-portals.conf    -t ${pkgdir}/usr/share/xdg-desktop-portal/
  install -Dm644 resources/${pkgname}.service         -t ${pkgdir}/usr/lib/systemd/user/
  install -Dm644 resources/${pkgname}-shutdown.target -t ${pkgdir}/usr/lib/systemd/user/
  install -Dm644 resources/default-config.kdl         -t ${pkgdir}/usr/share/doc/${pkgname}
}
