pkgname=banchoxterm
pkgver=1.5.0
pkgrel=1
pkgdesc='Multi-protocol terminal emulator and remote session manager'
arch=('x86_64')
url='https://github.com/Gargadon/banchoxterm'
license=('GPL-2.0-or-later')
depends=('qt6-base>=6.12.0' 'qt6-serialport>=6.12.0' 'freerdp' 'kwindowsystem')
makedepends=('cmake' 'ninja' 'qt6-tools>=6.12.0' 'desktop-file-utils' 'pkgconf' 'git')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Gargadon/banchoxterm/archive/refs/tags/v${pkgver}.tar.gz"
  'qtermwidget::git+https://github.com/Gargadon/qtermwidget.git#commit=481b1f7deaa75268cf74c6e4e516b30211f6c73c'
  # The SSH BREAK adapter uses private APIs from this upstream-pinned version.
  'libssh2::git+https://github.com/libssh2/libssh2.git#tag=libssh2-1.11.1'
  'libsodium::git+https://github.com/jedisct1/libsodium.git#tag=1.0.20-RELEASE'
  'libvncserver::git+https://github.com/LibVNC/libvncserver.git#tag=LibVNCServer-0.9.14'
)
sha256sums=('a2478c8d1720ad44621921e9e8bbca1dd34264d548368a53ba1bf5296236d387'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cat > "${srcdir}/banchoxterm.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=BanchoXterm
Comment=Multi-protocol terminal emulator and remote session manager
Exec=banchoxterm %U
Icon=banchoxterm
Terminal=false
Categories=System;TerminalEmulator;Network;
StartupNotify=true
EOF

  rm -rf "${srcdir}/${pkgname}-${pkgver}/third_party/qtermwidget"
  cp -a "${srcdir}/qtermwidget" "${srcdir}/${pkgname}-${pkgver}/third_party/qtermwidget"

  sed -i \
    -e 's|KB_LAYOUT_DIR="${QTQ_LIB}/kb-layouts"|KB_LAYOUT_DIR="/usr/lib/banchoxterm/kb-layouts"|' \
    -e 's|COLORSCHEMES_DIR="${QTQ_LIB}/color-schemes"|COLORSCHEMES_DIR="/usr/lib/banchoxterm/color-schemes"|' \
    -e 's|TRANSLATIONS_DIR="${QTQ_LIB}/translations"|TRANSLATIONS_DIR="/usr/lib/banchoxterm/translations"|' \
    "${srcdir}/${pkgname}-${pkgver}/CMakeLists.txt"
}

build() {
  rm -rf "${srcdir}/build"
  cmake -S "${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBANCHO_ENABLE_IPO=OFF \
    -DFETCHCONTENT_SOURCE_DIR_LIBSSH2="${srcdir}/libssh2" \
    -DFETCHCONTENT_SOURCE_DIR_LIBSODIUM="${srcdir}/libsodium" \
    -DFETCHCONTENT_SOURCE_DIR_LIBVNCSERVER="${srcdir}/libvncserver"
  cmake --build build --target banchoxterm
}

check() {
  desktop-file-validate banchoxterm.desktop
}

package() {
  local appdir="${pkgdir}/usr/lib/banchoxterm"

  install -Dm755 build/banchoxterm "${appdir}/banchoxterm"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}-${pkgver}/icons/logo.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/banchoxterm.svg"
  install -Dm644 banchoxterm.desktop \
    "${pkgdir}/usr/share/applications/banchoxterm.desktop"

  cp -r build/color-schemes "${appdir}/"
  cp -r build/kb-layouts "${appdir}/"
  cp -r build/translations "${appdir}/"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/banchoxterm/banchoxterm "${pkgdir}/usr/bin/banchoxterm"
}
