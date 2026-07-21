# Maintainer: René Preuß <hello@ghostzero.de>
pkgname=openwave-mixer
_pkgsrc=openwave
pkgver=0.7.0
pkgrel=1
pkgdesc="Dual-mix virtual audio mixer for PipeWire"
arch=('x86_64' 'aarch64')
url="https://github.com/ghostzero/openwave"
license=('MIT')
depends=('gtk4' 'libadwaita' 'libpulse' 'alsa-lib' 'pipewire-pulse' 'hicolor-icon-theme')
makedepends=('cargo')
checkdepends=('desktop-file-utils')
optdepends=('lilv: LV2 effect plugin browser'
            'carla: VST2/VST3 effect support'
            'python: required by the Carla VST host helper')
# "openwave" on the AUR is an unrelated project that also ships
# /usr/bin/openwave.
provides=('openwave')
conflicts=('openwave')
source=("$_pkgsrc-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('39a9bebf53b7fc76e191720b61b531e36aa50d1310c356d09b0366d611bbcc8a')

prepare() {
  cd "$_pkgsrc-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgsrc-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd "$_pkgsrc-$pkgver"
  desktop-file-validate data/de.ghostzero.OpenWave.desktop
}

package() {
  cd "$_pkgsrc-$pkgver"
  install -Dm755 target/release/openwave "$pkgdir/usr/bin/openwave"
  install -Dm644 data/de.ghostzero.OpenWave.desktop \
    "$pkgdir/usr/share/applications/de.ghostzero.OpenWave.desktop"
  install -Dm644 data/icons/hicolor/scalable/apps/de.ghostzero.OpenWave.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/de.ghostzero.OpenWave.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
