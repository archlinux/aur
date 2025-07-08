# Maintainer: PandaDEV <contact@pandadev.net>
pkgname=gauntlet-git
pkgver=20
pkgrel=1
pkgdesc='Raycast-inspired open-source cross-platform application launcher with React-based plugins'
arch=('x86_64')
url='https://github.com/project-gauntlet/gauntlet'
license=('MPL-2.0')
depends=('libxkbcommon'
         'fontconfig'
         'freetype2'
         'openssl')
makedepends=('git'
             'rust'
             'cargo'
             'nodejs'
             'npm'
             'protobuf'
             'cmake')
optdepends=('libx11: for X11'
            'libxcursor: for X11'
            'libxi: for X11'
            'libxkbcommon-x11: for X11'
            'libxrandr: for X11'
            'wayland: for Wayland')
provides=('gauntlet')
conflicts=('gauntlet' 'gauntlet-bin')
install="gauntlet.install"
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd gauntlet
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gauntlet
  npm ci
}

build() {
  cd gauntlet
  npm run build
  cargo build --release --features release
}

package() {
  cd gauntlet

  # Install binary
  install -Dm755 "target/release/gauntlet" "$pkgdir/usr/bin/gauntlet"

  # Install desktop file, icon, and service file
  install -Dm644 "assets/linux/icon_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gauntlet.png"
  install -Dm644 "assets/linux/gauntlet.desktop" "$pkgdir/usr/share/applications/gauntlet.desktop"
  install -Dm644 "assets/linux/gauntlet.service" "$pkgdir/usr/lib/systemd/user/gauntlet.service"
} 
