# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=niri
pkgver=0.1.0_beta.1
pkgrel=3
pkgdesc="A scrollable-tiling Wayland compositor"
arch=(x86_64)
url="https://github.com/YaLTeR/${pkgname}"
license=(GPL-3.0-or-later)
makedepends=(cargo clang)
depends=(cairo dbus gcc-libs glib2 glibc libinput libpipewire libxkbcommon mesa pango seatd systemd-libs)
source=(${pkgname}-${pkgver//_/-}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz
        001.patch::${url}/commit/df48337d83f78bbd2a923863e73941b6bd236a28.patch # tty: Delay output config update until resume
        002.patch::${url}/commit/f5e9b40140e64cf907520aa0d8adf43f7141e1d2.patch # tty: Check changes against pending connectors and mode
        003.patch::${url}/commit/5cacd03e859d35e71ff17f0897cdee8a44a8935c.patch # Return error instead of broken screenshot for portal
        004.patch::${url}/commit/18566e336699fbf933dbd5584e9228b04196e893.patch # Watch for canonical filename, not just mtime
        005.patch::${url}/commit/cbbb7a26fc0bff426d67bb2804167f01ade5fbe4.patch # Update Smithay, use device changed session resume code
        006.patch::${url}/commit/743173ef643441f5e58cb078a53a6cf3c93179fa.patch # config: Bump precision on the default widths
        )
b2sums=('40d6d1b2e0072024a581674733328edddde71fe2876e240c5d4d61660275e4ef491ee39b421df411a88237e491cdce9972a0f735cbb7d8b163cd8f9638ca18c7'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')
optdepends=('mako: notification daemon for Wayland'
            'waybar: highly customizable Wayland bar'
            'swaybg: wallpaper tool for Wayland compositors'
            'xdg-desktop-portal-gtk: implements most of the basic functionality'
            'xdg-desktop-portal-gnome: screencasting support'
            'gnome-keyring: implements the secret portal, for certain apps to work'
            'polkit-gnome: when apps need to ask for root permissions')
conflicts=(${pkgname}-git)


prepare() {
  cd ${pkgname}-${pkgver//_/-}
  # apply patch from the source array
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  export RUSTUP_TOOLCHAIN=stable
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${pkgname}-${pkgver//_/-}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --all-features
}

check() {
  cd ${pkgname}-${pkgver//_/-}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver//_/-}
  install -Dm755 target/release/${pkgname}            -t ${pkgdir}/usr/bin/
  install -Dm755 resources/${pkgname}-session         -t ${pkgdir}/usr/bin/
  install -Dm644 resources/${pkgname}.desktop         -t ${pkgdir}/usr/share/wayland-sessions/
  install -Dm644 resources/${pkgname}-portals.conf    -t ${pkgdir}/usr/share/xdg-desktop-portal/
  install -Dm644 resources/${pkgname}.service         -t ${pkgdir}/usr/lib/systemd/user/
  install -Dm644 resources/${pkgname}-shutdown.target -t ${pkgdir}/usr/lib/systemd/user/
  install -Dm644 resources/default-config.kdl         -t ${pkgdir}/usr/share/doc/
}
