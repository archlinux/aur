# Maintainer: Pablo Pascual <pablocpascual@gmail.com>

pkgname=tiri
pkgver=0.1.3
pkgrel=2
pkgdesc='A tiling Wayland compositor derived from niri'
arch=('x86_64')
url='https://github.com/pablocpas/tiri'
license=('GPL-3.0-or-later')
options=('!lto')
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
  'e8c2c2c5a0d6bb47d1a653b5eed61ac79d39eaa76427af84b8fa2ea98bd0bf3dc375df3a54c775bab641e035d44aa8de7b3f09451678888c64555762bb095511'
  '318f39b2d5a0158e576c443f3b38149c1e59207a4dbe697c841b1e2e0784b5dc59e40b9613ab5023fcd09d8336ea69df25fa3b23861045fdc104fa7dea054f27'
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
  install -Dpm0644 resources/profiles/i3.kdl "${pkgdir}/usr/share/tiri/profiles/i3.kdl"
  install -Dpm0644 resources/tiri.service "${pkgdir}/usr/lib/systemd/user/tiri.service"
  install -Dpm0644 resources/tiri-shutdown.target "${pkgdir}/usr/lib/systemd/user/tiri-shutdown.target"
  install -Dpm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dpm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm0644 <(target/release/tiri completions bash) "${pkgdir}/usr/share/bash-completion/completions/tiri"
  install -Dm0644 <(target/release/tiri completions fish) "${pkgdir}/usr/share/fish/vendor_completions.d/tiri.fish"
  install -Dm0644 <(target/release/tiri completions zsh) "${pkgdir}/usr/share/zsh/site-functions/_tiri"
}
