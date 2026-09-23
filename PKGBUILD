# Maintainer: dreamscached <dreamscache.d@gmail.com>
# shellcheck shell=bash

pkgname=bedrock-on-linux-git
pkgver=v2.2.7.r2.gf6a7618
pkgrel=1
pkgdesc="Run Minecraft Bedrock for Windows seamlessly on Linux."
arch=('x86_64')
url="https://github.com/Wyze3306/BedrockOnLinux"
license=('MIT')
depends=('python' 'pyside6' 'python-cryptography' 'python-packaging' 'python-xlib'
         'webkit2gtk-4.1' 'tar' 'zstd' 'xdg-utils' 'xorg-xrandr' 'ca-certificates'
         'curl' 'vulkan-driver')
makedepends=('git')
optdepends=('xorg-xwayland: launcher and game support in Wayland sessions'
            'qt6-wayland: Qt Wayland platform plugin'
            'libnotify: support for desktop notifications'
            'gamescope: run the game inside a gamescope session')
provides=('bedrock-on-linux')
conflicts=('bedrock-on-linux')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"

  install -Dm755 bedrock-on-linux "$pkgdir/usr/lib/bedrock-on-linux/bedrock-on-linux"
  cp -r bol "$pkgdir/usr/lib/bedrock-on-linux/bol"
  find "$pkgdir/usr/lib/bedrock-on-linux" -name __pycache__ -type d -exec rm -rf {} +

  install -Dm644 data/icon.png "$pkgdir/usr/lib/bedrock-on-linux/data/icon.png"
  install -Dm644 data/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/bedrock-on-linux.png"
  install -Dm644 data/bedrock-on-linux.desktop "$pkgdir/usr/share/applications/bedrock-on-linux.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/bedrock-on-linux/README.md"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/bedrock-on-linux/bedrock-on-linux "$pkgdir/usr/bin/bedrock-on-linux"
}
