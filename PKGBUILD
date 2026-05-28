pkgname=spectrometerui-git
pkgver=r1.a69e031
pkgrel=1
pkgdesc='A small desktop application providing a user interface for spectrometer measurements (Y21B7W10034CCPD)'
arch=('x86_64')
url='https://github.com/zaps166/SpectrometerUI'
license=('BSD-3-Clause')
depends=('qt6-base' 'qt6-declarative' 'qt6-serialport')
makedepends=('qt6-shadertools')
provides=('spectrometerui')
conflicts=('spectrometerui')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "SpectrometerUI"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cat > "${srcdir}/SpectrometerUI.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=SpectrometerUI
Comment=Spectrometer measurements for Y21B7W10034CCPD
Exec=SpectrometerUI
Icon=SpectrometerUI
Categories=Science;Education;
EOF
}

build() {
  cmake -B "build" -S "SpectrometerUI" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT_SERIAL_PORT=ON
  cmake --build build
}

package() {
  install -Dm755 "${srcdir}/build/SpectrometerUI" "${pkgdir}/usr/bin/SpectrometerUI"
  install -Dm644 "${srcdir}/SpectrometerUI.desktop" "${pkgdir}/usr/share/applications/SpectrometerUI.desktop"
  install -Dm644 "SpectrometerUI/icons/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/SpectrometerUI.svg"
  install -Dm644 "SpectrometerUI/LICENSE" "${pkgdir}/usr/share/licenses/SpectrometerUI/LICENSE"
}
