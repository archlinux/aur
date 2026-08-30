# Maintainer: prankstr <prankstr@users.noreply.github.com>
# Keep depends/optdepends/options in sync across vibepanel, vibepanel-bin, and vibepanel-git.
pkgname=vibepanel-git
_pkgname=vibepanel
pkgver=0.16.1.r0.g92420c6
pkgrel=1
pkgdesc="A GTK4 panel for Wayland with notifications, OSD, and quick settings (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/prankstr/vibepanel"
license=('MIT')
# systemd-libs provides libudev used by the brightness service.
depends=('gtk4' 'gtk4-layer-shell' 'libpulse' 'upower' 'networkmanager' 'bluez' 'systemd-libs')
makedepends=('git' 'cargo' 'rust' 'pkg-config')
optdepends=('power-profiles-daemon: power profile switching in battery popover'
            'modemmanager: cellular/mobile network support'
            'cava: audio visualizer in the media widget'
            'iwd: alternative to NetworkManager for Wi-Fi')
# ring native code fails with makepkg's default LTO flags.
options=(!lto !debug)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
source=("${_pkgname}::git+https://github.com/prankstr/vibepanel.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo"
  cargo build --release --frozen -p "${_pkgname}"
}

package() {
  cd "${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  # Font is embedded in the binary and extracted to cache on first run; no system font install needed.
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
