# Maintainer: vi <vi@example.com>
pkgname=vibepanel-git
_pkgname=vibepanel
pkgver=0.14.1.r33.g22e53ed
pkgrel=1
pkgdesc="A GTK4 panel for Wayland with notifications, OSD, and quick settings (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/prankstr/vibepanel"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'libpulse' 'upower' 'networkmanager' 'bluez')
makedepends=('git' 'cargo' 'rust' 'pkg-config')
optdepends=('power-profiles-daemon: power profile switching in battery popover'
            'modemmanager: cellular/mobile network support'
            'cava: audio visualizer in the media widget'
            'iwd: alternative to NetworkManager for Wi-Fi')
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
  
  # Clean environment from aggressive Arch defaults that break 'ring' crate linking
  unset RUSTFLAGS
  unset LDFLAGS
  unset CFLAGS
  unset CXXFLAGS
  
  export CARGO_HOME="${srcdir}/cargo"
  # Force safe defaults and standard linker
  export RUSTFLAGS="-C debuginfo=none -C codegen-units=16 -C lto=off"
  
  cargo build --release --frozen
}

package() {
  cd "${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Install the Material Symbols font to system fonts directory
  install -Dm644 "assets/fonts/MaterialSymbolsRounded.ttf" "${pkgdir}/usr/share/fonts/TTF/MaterialSymbolsRounded.ttf"
}
