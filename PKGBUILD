# Maintainer: prankstr <prankstr@users.noreply.github.com>
# Keep depends/optdepends/options in sync across vibepanel, vibepanel-bin, and vibepanel-git.
pkgname=vibepanel
pkgver=0.17.0
pkgrel=1
pkgdesc="A GTK4 panel for Wayland with notifications, OSD, and quick settings"
arch=('x86_64' 'aarch64')
url="https://github.com/prankstr/vibepanel"
license=('MIT')
# systemd-libs provides libudev used by the brightness service.
depends=('gtk4>=1:4.22' 'gtk4-layer-shell' 'libpulse' 'upower' 'networkmanager' 'bluez' 'systemd-libs')
makedepends=('cargo' 'rust' 'pkg-config')
optdepends=('power-profiles-daemon: power profile switching in battery popover'
            'modemmanager: cellular/mobile network support'
            'cava: audio visualizer in the media widget'
            'iwd: alternative to NetworkManager for Wi-Fi')
# ring native code fails with makepkg's default LTO flags.
options=(!lto !debug)
conflicts=('vibepanel-bin' 'vibepanel-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/prankstr/vibepanel/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d64032b48e04254ab5ef92bc9a15af021faa1b394331eed66ca3b908080537e7')

prepare() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo"
  cargo build --release --frozen -p "${pkgname}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # Font is embedded in the binary and extracted to cache on first run; no system font install needed.
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
