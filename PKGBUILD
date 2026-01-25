# Maintainer: Barry <howtoedittv@gmail.com>
pkgname=drawy-build
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight and user-friendly drawing application"
arch=('x86_64')
url="https://invent.kde.org/prayag/drawy"
license=('GPL')
depends=('qt6-tools' 'qt6-base' 'extra-cmake-modules' 'cmake' 'zstd' 'gcc' 'git')
makedepends=('git' 'cmake' 'yay')   # yay needed to install kf6 from AUR

source=("git+https://invent.kde.org/prayag/drawy.git")
sha256sums=('SKIP')

is_installed() {
  pacman -Qi "$1" &>/dev/null
}

install_kf6_from_aur() {
  if ! is_installed "kf6"; then
    yay -S --noconfirm kf6
  fi
}

build() {
  install_kf6_from_aur

  cd "$srcdir/drawy"
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
}

package() {
  cd "$srcdir/drawy"

  # create required directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -dm755 "$pkgdir/usr/share/applications"


  install -Dm755 build/bin/drawy "$pkgdir/usr/bin/drawy"

  install -Dm644 assets/icon.ico \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/drawy.ico"

  cat > "$pkgdir/usr/share/applications/drawy.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=Drawy
Comment=Lightweight drawing application
Exec=drawy
Icon=drawy
Terminal=false
Type=Application
Categories=Graphics;Utility;
StartupWMClass=drawy
EOF
}


