# Maintainer: Onxy <onxy@example.com>
pkgname=betterwallpaper-git
pkgver=0.3.1
pkgrel=1
pkgdesc="A modern, high-performance animated wallpaper manager for Linux"
arch=('x86_64')
url="https://github.com/Misiix9/BetterWallpaper"
license=('GPL3')
depends=(
    'gtk4'
    'libadwaita'
    'gtk4-layer-shell'
    'mpv'
    'curl'
    'wayland'
    'libayatana-appindicator'
    'glew'
)
optdepends=(
    'linux-wallpaperengine: for Wallpaper Engine scene support'
    'swaybg: alternative wallpaper backend'
    'swww: alternative wallpaper backend with animations'
    'hyprpaper: Hyprland native wallpaper support'
)
makedepends=('git' 'cmake' 'base-devel' 'wayland-protocols' 'nlohmann-json')
provides=('betterwallpaper')
conflicts=('betterwallpaper')
source=("git+https://github.com/Misiix9/BetterWallpaper.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/BetterWallpaper"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/BetterWallpaper"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/BetterWallpaper"
  DESTDIR="$pkgdir" cmake --install build
  
  # Install desktop file
  install -Dm644 betterwallpaper.desktop "$pkgdir/usr/share/applications/betterwallpaper.desktop"
  
  # Install systemd service
  install -Dm644 packaging/betterwallpaper-daemon.service "$pkgdir/usr/lib/systemd/user/betterwallpaper-daemon.service"
}
