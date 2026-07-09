# Maintainer: AntheaLaffy <anthealaffy@gmail.com>
pkgname=mvsep-gui
pkgver=1.2.1
pkgrel=4
pkgdesc="MVSEP GUI - Music separation desktop application"
arch=('x86_64')
url="https://github.com/AntheaLaffy/mvsep-rs"
license=('Apache-2.0')
depends=('webkit2gtk' 'libappindicator-gtk3' 'librsvg' 'libvips')
makedepends=('cargo' 'npm' 'nodejs')
optdepends=()
conflicts=('mvsep-gui-bin')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/mvsep-rs-${pkgver}/src-tauri"

  export CARGO_HOME="${srcdir}/cargo"

  cargo fetch
}

build() {
  cd "${srcdir}/mvsep-rs-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo"

  # Remove -flto from CFLAGS/CXXFLAGS: the cc crate compiles bundled SQLite
  # with these flags, and LTO bytecode cannot be linked by rust-lld
  export CFLAGS="${CFLAGS//-flto=auto/}"
  export CFLAGS="${CFLAGS//-flto/}"
  export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
  export CXXFLAGS="${CXXFLAGS//-flto/}"

  npm install
  npm run build

  cd src-tauri
  # Enable custom-protocol feature so the binary uses embedded frontend assets
  # instead of connecting to the dev server (http://localhost:1420)
  cargo build --release --features tauri/custom-protocol
}

package() {
  cd "${srcdir}/mvsep-rs-${pkgver}"
  
  install -Dm755 "src-tauri/target/release/mvsep-gui" "${pkgdir}/usr/bin/mvsep-gui"
  
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/com.mvsep.app.desktop" <<EOF
[Desktop Entry]
Name=MVSEP
Comment=Music separation tool
Exec=mvsep-gui
Terminal=false
Type=Application
Icon=com.mvsep.app
Categories=AudioVideo;Audio;Utility;
Keywords=audio;separation;music;
EOF
  
  install -d "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
  install -Dm644 "src-tauri/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/com.mvsep.app.png"
  
  install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/com.mvsep.app.png"
  
  install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 "src-tauri/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.mvsep.app.png"
  
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}