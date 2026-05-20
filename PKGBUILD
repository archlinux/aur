# Maintainer: Bowen <bowen@local>

pkgname=floral-notepaper
pkgver=1.0.3
pkgrel=1
pkgdesc='A lightweight cross-platform desktop note app'
arch=('x86_64')
url='https://github.com/Achilng/floral-notepaper'
license=('MIT')
depends=(
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'desktop-file-utils'
  'npm'
  'pkgconf'
  'rust'
)
conflicts=('floral-notepaper-bin')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Achilng/floral-notepaper/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('86a20b48f385dfc2c4517e54ae854f45d10bf3d980e5453002b1519793a86147c46d4954a6dd748653f79e5331980dad6dd1920cbcde5f71d2d6f7db8e8c7902')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i \
    's#"beforeBuildCommand": "[^"]*"#"beforeBuildCommand": "npm run build"#' \
    src-tauri/tauri.conf.json
  sed -i -E \
    "s#\"version\": \"[^\"]+\"#\"version\": \"${pkgver}\"#" \
    package.json \
    src-tauri/tauri.conf.json
  sed -i -E \
    "s#^version = \"[^\"]+\"#version = \"${pkgver}\"#" \
    src-tauri/Cargo.toml
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  npm ci --cache "${srcdir}/npm-cache" --prefer-offline --no-audit --no-fund
  npm run tauri -- build --bundles deb
}

package() {
  local deb_path="${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/花笺_${pkgver}_amd64.deb"

  bsdtar -xf "${deb_path}" -C "${srcdir}" data.tar.gz
  bsdtar --no-same-owner -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  mv "${pkgdir}/usr/share/applications/花笺.desktop" \
    "${pkgdir}/usr/share/applications/floral-notepaper.desktop"
  cat > "${pkgdir}/usr/share/applications/floral-notepaper.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=花笺
Name[en_US]=Floral Notepaper
GenericName=Note App
GenericName[zh_CN]=便签
Comment=A lightweight cross-platform desktop note app
Comment[zh_CN]=轻量级跨平台桌面便签应用
Exec=floral-notepaper
Icon=floral-notepaper
Terminal=false
StartupNotify=true
StartupWMClass=floral-notepaper
Categories=Utility;TextEditor;
Keywords=note;notes;notepad;markdown;text;editor;floral;notepaper;花笺;便签;笔记;
EOF

  desktop-file-validate "${pkgdir}/usr/share/applications/floral-notepaper.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
