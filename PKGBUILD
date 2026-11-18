# Maintainer: Vade <72322348+MetanoicArmor@users.noreply.github.com>
# Builds the FTXUI TUI from MetanoicArmor/I2PChat-ng (not the Qt5 i2pchat-git).
pkgname=i2pchat-ng-tui-git
pkgver=1.6.1.r0.g0000000
pkgrel=1
pkgdesc="P2P (peer-to-peer) chat client over I2P network (TUI version)"
arch=('x86_64' 'aarch64')
url="https://github.com/MetanoicArmor/I2PChat-ng"
license=('AGPL-3.0-or-later')
depends=('libsodium' 'hicolor-icon-theme' 'zlib')
makedepends=('git' 'cmake' 'ninja' 'boost' 'nlohmann-json')
provides=('i2pchat-tui')
conflicts=('i2pchat-tui' 'i2pchat-tui-bin')
options=('!lto')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd I2PChat-ng
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  # FTXUI is FetchContent'd when not installed as a system package.
  cmake -S I2PChat-ng/cpp -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DI2PCHAT_BUILD_GUI=OFF \
    -DI2PCHAT_BUILD_TUI=ON \
    -DI2PCHAT_BUILD_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 I2PChat-ng/icon.png "${pkgdir}/usr/share/pixmaps/i2pchat-tui.png"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/i2pchat-tui.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=I2P Chat (TUI)
Comment=P2P chat over I2P (terminal)
Exec=i2pchat-tui
Icon=i2pchat-tui
Terminal=true
Categories=Network;Chat;
EOF
}
