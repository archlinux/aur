# Maintainer: Pablo Pascual <pablocpascual@gmail.com>

pkgname=tiri
pkgver=0.1.0
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
  '31fbfc9b1ee7b219aea2210ec9806d54822ebcae0a10b886f829f035001db9ff11a02d62900bde5359d392127ceb8a745a5de6e6dd4222dacd5750a33099f70c'
  '272c0b32b5882155ab51d9ac1c7b9837549aae4b4e59f0d1ab0a22facb0ab38091729d5435a3caf7294d683b11c25711c8fc2296343262b0babfa097668d55fa'
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
