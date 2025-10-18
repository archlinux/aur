pkgname=bluetooth-bitrate-manager
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK4 app and CLI that monitor PipeWire Bluetooth codecs with an optional high-bitpool SBC rebuild"
arch=('any')
url="https://github.com/ezrakhuzadi/bluetooth-bitrate-manager"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'pipewire'
  'wireplumber'
)
provides=('bluetooth-audio-boost')
conflicts=('bluetooth-audio-boost')
optdepends=(
  'pipewire-pulse: provides pactl for bitrate detection (alternative: pulseaudio)'
  'pulseaudio: provides pactl if pipewire-pulse is not used'
  'git: rebuild the SBC high-bitpool codec from the GUI'
  'meson: rebuild the SBC high-bitpool codec from the GUI'
  'ninja: rebuild the SBC high-bitpool codec from the GUI'
  'gcc: rebuild the SBC high-bitpool codec from the GUI'
  'pkgconf: rebuild the SBC high-bitpool codec from the GUI'
  'curl: fetch gdbus-codegen helper when rebuilding the SBC codec'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+https://github.com/ezrakhuzadi/bluetooth-bitrate-manager.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  rm -rf dist
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 bluetooth_bitrate_manager/resources/bluetooth-bitrate-manager.desktop \
    "$pkgdir/usr/share/applications/bluetooth-bitrate-manager.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  if [[ -x "$pkgdir/usr/bin/bluetooth-bitrate-gui" && ! -e "$pkgdir/usr/bin/bluetooth-bitrate-manager" ]]; then
    ln -s bluetooth-bitrate-gui "$pkgdir/usr/bin/bluetooth-bitrate-manager"
  fi
}
