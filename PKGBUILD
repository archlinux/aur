# Maintainer: Mopigames <mopigames@proton.me>
pkgname=vanilla-wiiu-git
pkgver=continuous.15.g7788aeb
pkgrel=1
pkgdesc="A work-in-progress Wii U GamePad software clone for Linux"
arch=('x86_64')
url="https://github.com/vanilla-wiiu/vanilla"
license=('GPL-2.0')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'ffmpeg' 'libnl' 'sdl2' 'dhclient')
makedepends=('git' 'cmake' 'make')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/^v//' | sed 's/-/./g' | tr -d ':'
}

build() {
    cd "$pkgname"
    git submodule update --init --recursive
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$pkgname/build"
    install -Dm755 "bin/vanilla-gui" "$pkgdir/usr/bin/vanilla-gui"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/vanilla-gui.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Vanilla Wii U GamePad
Comment=A work-in-progress Wii U GamePad software clone for Linux
Exec=vanilla-gui
Terminal=false
Categories=Game;Emulator;
EOF

}
