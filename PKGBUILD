# Maintainer: prankstr <prankstr@users.noreply.github.com>
# Keep depends/optdepends/options in sync across vibepanel, vibepanel-bin, and vibepanel-git.
pkgname=vibepanel
pkgver=0.16.1
pkgrel=1
pkgdesc="A GTK4 panel for Wayland with notifications, OSD, and quick settings"
arch=('x86_64' 'aarch64')
url="https://github.com/prankstr/vibepanel"
license=('MIT')
# systemd-libs provides libudev used by the brightness service.
depends=('gtk4' 'gtk4-layer-shell' 'libpulse' 'upower' 'networkmanager' 'bluez' 'systemd-libs')
makedepends=('cargo' 'rust' 'pkg-config')
optdepends=('power-profiles-daemon: power profile switching in battery popover'
            'modemmanager: cellular/mobile network support'
            'cava: audio visualizer in the media widget'
            'iwd: alternative to NetworkManager for Wi-Fi')
# ring native code fails with makepkg's default LTO flags.
options=(!lto !debug)
conflicts=('vibepanel-bin' 'vibepanel-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/prankstr/vibepanel/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('31afa52fb692db7a12c26462cdca29c4df218ae520a36d7aa01f6a735cc7e610')

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
