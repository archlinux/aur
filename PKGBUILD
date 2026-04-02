# Maintainer: Pascal Lynxon <gfcwfzkm@protonmail.com>

pkgname=wxuieditor-git
pkgver=1.2.1.r1009.g25d3a248
pkgrel=1
pkgdesc="RAD tool used to create and maintain wxWidgets UI elements (C++, Python, Ruby, XRC)"
arch=('x86_64')
url="https://github.com/KeyWorksRW/wxUiEditor"
license=('Apache-2.0')
depends=('wxwidgets-gtk3' 'pugixml' 'rapidjson')
makedepends=('git' 'cmake' 'ninja' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  
  # The developer officially recommends Ninja Multi-Config for this project
  cmake -B build -G "Ninja Multi-Config" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
    
  cmake --build build --config Release --target wxUiEditor
}

package() {
  cd "${pkgname%-git}"
  
  # Attempt to use the project's default CMake installation routines
  DESTDIR="$pkgdir" cmake --install build --config Release
  
  # --- PREPARE FILES FOR PACMAN ARCHIVE ---
  install -Dm755 "bin/Release/wxUiEditor" "$pkgdir/usr/bin/wxUiEditor"
  install -Dm644 "wxUiEditor.desktop" "$pkgdir/usr/share/applications/wxUiEditor.desktop"
  install -Dm644 "src/art_src/wxUiEditor.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/wxUiEditor.svg"
}
