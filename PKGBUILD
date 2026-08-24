# Maintainer: vectorfruit <vectorfruit@outlook.com>

pkgname=photomark
pkgver=1.4.2
pkgrel=1
pkgdesc="Photo EXIF watermark and frame studio"
arch=('x86_64')
url="https://github.com/vectorfruit/photomark"
license=('GPL-3.0-or-later')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vectorfruit/photomark/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7b0b2e158a3dae8882527fee4f32fdeaf705ad2d0b308a0ff0fdd340014d426d')
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
)
makedepends=(
  'nodejs>=18'
  'rust'
  'yarn'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export YARN_CACHE_FOLDER="${srcdir}/yarn-cache"
  yarn install --frozen-lockfile --registry "${YARN_REGISTRY:-https://registry.npmmirror.com}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export NODE_ENV=production
  # 编译前端并将静态资源完整嵌入 Rust 原生二进制中
  yarn tauri build --no-bundle
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # 1. 安装原生二进制文件至 /usr/bin/photomark
  install -Dm755 src-tauri/target/release/photomark "${pkgdir}/usr/bin/${pkgname}"

  # 2. 安装 Desktop 入口
  install -d "${pkgdir}/usr/share/applications"
  cat << 'EOF' > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Name=PhotoMark
Name[zh_CN]=照片水印相框
GenericName=Photo EXIF Watermark & Frame Studio
GenericName[zh_CN]=照片 EXIF 参数相框与水印工坊
Comment=Photo EXIF watermark and frame studio
Comment[zh_CN]=照片 EXIF 水印与相框工具
Exec=/usr/bin/photomark %U
Icon=photomark
Terminal=false
Type=Application
StartupNotify=true
StartupWMClass=photomark
Categories=Graphics;Photography;Utility;
MimeType=image/jpeg;image/png;image/tiff;image/webp;
EOF
  chmod 644 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # 3. 安装图标至 hicolor 主题目录
  install -Dm644 src-tauri/icons/32x32.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 src-tauri/icons/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
  install -Dm644 src-tauri/icons/icon.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
