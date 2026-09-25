# Maintainer: scottbass3 <valentin dot carroy at hotmail dot fr>

pkgname=scottbass3-shell-git
_name=scottbass3-shell
pkgver=r61.2e85f63
pkgrel=1
pkgdesc="Material You desktop shell for Hyprland, built on Quickshell"
arch=('x86_64')
url="https://github.com/scottbass3/shell"
license=('GPL-3.0-only')
depends=('quickshell' 'hyprland' 'qt6-base' 'qt6-declarative' 'glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'cmake' 'qt6-shadertools')
optdepends=(
  'hyprpaper: wallpaper switcher'
  'matugen: Material You theme from the wallpaper'
  'imagemagick: light/dark detection for wallpaper themes'
  'cava: audio visualizer'
  'brightnessctl: brightness control'
  'networkmanager: Wi-Fi and VPN menus'
  'wireplumber: Bluetooth audio profile switching'
  'khal: calendar events'
  'vdirsyncer: calendar sync'
  'curl: online wallpaper downloads'
  'libsecret: YouTube Music companion token'
  'qt6-websockets: YouTube Music companion (realtime)'
)
provides=("$_name")
conflicts=("$_name")
source=("$_name::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -S "$_name/blobs-plugin" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DINSTALL_QMLDIR="/usr/lib/$_name/qml"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  local dest="$pkgdir/etc/xdg/quickshell/$_name"
  install -d "$dest"
  cd "$_name"
  cp -r --no-preserve=ownership \
    assets bar hypr panels scripts services theme widgets \
    shell.qml LockScreen.qml MainWindow.qml cava.conf launch.sh \
    "$dest/"

  install -d "$pkgdir/usr/bin"
  ln -s "/etc/xdg/quickshell/$_name/launch.sh" "$pkgdir/usr/bin/$_name"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
