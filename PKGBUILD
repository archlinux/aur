pkgname=banchoxterm
pkgver=1.3.1
pkgrel=1
pkgdesc='Multi-protocol terminal emulator and remote session manager'
arch=('x86_64')
url='https://github.com/Gargadon/banchoxterm'
license=('GPL-2.0-or-later')
depends=('qt6-base' 'qt6-serialport' 'freerdp')
makedepends=('cmake' 'ninja' 'qt6-tools' 'desktop-file-utils' 'pkgconf')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Gargadon/banchoxterm/archive/refs/tags/v${pkgver}.tar.gz"
  'qtermwidget::git+https://github.com/Gargadon/qtermwidget.git'
  # The SSH BREAK adapter uses private APIs from this upstream-pinned version.
  'libssh2::git+https://github.com/libssh2/libssh2.git#tag=libssh2-1.11.1'
  'libsodium::git+https://github.com/jedisct1/libsodium.git'
  'libvncserver::git+https://github.com/LibVNC/libvncserver.git'
)
sha256sums=('dc9238da6e36b6fa240844c93d877691524d0e5c0c17129f48fa9679177985b0'
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

  # Recent libvncserver revisions keep the public headers under include/rfb,
  # while BanchoXterm's VNC target uses the legacy source-root include path.
  if [[ -d "${srcdir}/libvncserver/include/rfb" ]]; then
    mkdir -p "${srcdir}/libvncserver/rfb"
    cp -a "${srcdir}/libvncserver/include/rfb/." \
      "${srcdir}/libvncserver/rfb/"
  fi

  sed -i \
    -e 's|KB_LAYOUT_DIR="${QTQ_LIB}/kb-layouts"|KB_LAYOUT_DIR="/usr/lib/banchoxterm/kb-layouts"|' \
    -e 's|COLORSCHEMES_DIR="${QTQ_LIB}/color-schemes"|COLORSCHEMES_DIR="/usr/lib/banchoxterm/color-schemes"|' \
    -e 's|TRANSLATIONS_DIR="${QTQ_LIB}/translations"|TRANSLATIONS_DIR="/usr/lib/banchoxterm/translations"|' \
    -e '/\${libvncserver_BINARY_DIR}/a\        ${libvncserver_BINARY_DIR}/include' \
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
