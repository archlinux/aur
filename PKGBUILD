# Maintainer: Pablo Pascual <pablocpascual@gmail.com>

pkgname=tiri
pkgver=0.1.1
pkgrel=1
pkgdesc='A tiling Wayland compositor derived from niri'
arch=('x86_64')
url='https://github.com/pablocpas/tiri'
license=('GPL-3.0-or-later')
depends=(
  'cairo'
  'glib2'
  'libdisplay-info'
  'libinput'
  'libpipewire'
  'libxkbcommon'
  'mesa'
  'pango'
  'pixman'
  'seatd'
  'systemd-libs'
  'wayland'
  'xdg-desktop-portal-impl'
)
makedepends=(
  'clang'
  'rust'
)
optdepends=(
  'alacritty: suggested GPU-accelerated terminal emulator'
  'bash: required by tiri-session'
  'fuzzel: suggested Wayland application launcher'
  'gnome-keyring: secrets portal provider configured by tiri-portals.conf'
  'mako: suggested Wayland notification daemon'
  'swaybg: suggested Wayland wallpaper tool'
  'swaylock: suggested Wayland screen locker'
  'waybar: suggested Wayland bar'
  'xdg-desktop-portal-gnome: required for screencasting'
  'xdg-desktop-portal-gtk: fallback portal configured by tiri-portals.conf'
  'xwayland-satellite: required for running X11 applications'
)
provides=('wayland-compositor')
conflicts=('tiri-git')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}-${pkgver}-vendored-dependencies.tar.xz::${url}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}-vendored-dependencies.tar.xz"
)
b2sums=(
  'a638f6cca8ccb46bcc063efdaf4b7c49604455ab73010c547ff407e91b2743c7f69d8d5065647b7f513f8ca664eeb0b8c3fd5f6f317cc25f1962215aba64d263'
  '6e7ea9fa763d89c1005a1e649a39ee1c80642431420f5d3c372b7863c9c465482e64811bfbfd3003c425adad7cc92ff786793846af4d40a2eeaecff3057733f4'
)

prepare() {
  cd "${pkgname}-${pkgver}"

  cp -a "${srcdir}/.cargo" .
  cp -a "${srcdir}/vendor" .
}

build() {
  cd "${pkgname}-${pkgver}"

  export TIRI_BUILD_VERSION_STRING="${pkgver}-${pkgrel} (AUR)"
  cargo build --release --frozen
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dpm0755 target/release/tiri "${pkgdir}/usr/bin/tiri"
  install -Dpm0755 resources/tiri-session "${pkgdir}/usr/bin/tiri-session"
  install -Dpm0644 resources/tiri.desktop "${pkgdir}/usr/share/wayland-sessions/tiri.desktop"
  install -Dpm0644 resources/tiri-portals.conf "${pkgdir}/usr/share/xdg-desktop-portal/tiri-portals.conf"
  install -Dpm0644 resources/tiri.service "${pkgdir}/usr/lib/systemd/user/tiri.service"
  install -Dpm0644 resources/tiri-shutdown.target "${pkgdir}/usr/lib/systemd/user/tiri-shutdown.target"
  install -Dpm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dpm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm0644 <(target/release/tiri completions bash) "${pkgdir}/usr/share/bash-completion/completions/tiri"
  install -Dm0644 <(target/release/tiri completions fish) "${pkgdir}/usr/share/fish/vendor_completions.d/tiri.fish"
  install -Dm0644 <(target/release/tiri completions zsh) "${pkgdir}/usr/share/zsh/site-functions/_tiri"
}
