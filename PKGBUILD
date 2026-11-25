# Maintainer: YoungCrescent <jy792505@mail.ustc.edu.cn>
#
# AppImage 变体：与 AUR 的 dsh-tauri-desktop-bin（上游 .deb 重打包）同源同一个应用，
# 但改为解包官方 AppImage 并安装到 /opt/dsh-tauri。AppImage 自带的 GTK/GDK-PixBuf
# 等库保留在 /opt 内，不混入 /usr/lib，避免与系统库互相覆盖。
# 注意：sharp/图片粘贴的崩溃与打包格式无关，取决于随包 dsh 内核是否带 sharp 的
# wasm 回退（见上游 issue #1490 / #1504）。本包只改变分发形态。

pkgname=dsh-tauri-desktop-appimage
pkgver=0.34.0
pkgrel=1
pkgdesc='Native desktop application for DeepSeek Harness (official AppImage repack)'
arch=('x86_64')
url='https://github.com/dsh-tauri/deepseek-harness-desktop'
# 上游的附加条款限制商业二次开发，不能仅标注为 MIT。
license=('LicenseRef-MIT-with-additional-terms')
depends=(
  # 与官方 deb 的依赖保持一致：AppImage 虽自带 GTK 等库，Electron 仍会链接
  # 系统的 GLib、WebKitGTK、NSS、GStreamer 等。
  'alsa-lib'
  'at-spi2-core'
  'expat'
  'libcups'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'ca-certificates'
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  # 上游视频桌宠播放需要与官方 deb 一致的 GStreamer 插件。
  'gst-plugins-bad'
  'gst-plugins-good'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'libx11'
  'libxtst'
  'openssl'
  'wayland'
  'webkit2gtk-4.1'
  'xdg-utils'
)
optdepends=(
  'git: Git integration and workspace operations'
  'xdg-desktop-portal: Native directory selection (requires a desktop-specific backend)'
)
provides=("dsh-tauri-desktop=${pkgver}")
# 与官方 deb 包、AUR 的 -bin 包互斥，避免同一份命令/桌面入口被装两次。
conflicts=('dsh-tauri-desktop' 'dsh-tauri-desktop-bin' 'deepseek-harness-desktop')
# 保留上游二进制，避免剥离 Electron/内核符号，也不生成调试包。
options=('!strip' '!debug')

_license_url="https://raw.githubusercontent.com/dsh-tauri/deepseek-harness-desktop/v${pkgver}"
source=(
  "${pkgname}-${pkgver}-LICENSE::${_license_url}/LICENSE"
  "${pkgname}-${pkgver}-LICENSE.details::${_license_url}/LICENSE.details"
)
sha256sums=(
  'a9a6b4fb724c6a42f68cc377969ee2816035367ab127aceba7f6af9da3656e5d'
  '3d1e8bb97f9047b71888b14c063b12ed1ee3d5980f122f02c1f150dab6e5f8d0'
)
# 使用上游 GitHub 发布资产公布的 SHA-256 校验 AppImage。
source_x86_64=("${url}/releases/download/v${pkgver}/Deepseek.Harness.Desktop_${pkgver}_amd64.AppImage")
sha256sums_x86_64=('fe46473b27c64c6cae5c0b2499dbf1412848cf99fa9a0ece658cbf06ae648e4e')

prepare() {
  chmod +x "${srcdir}/Deepseek.Harness.Desktop_${pkgver}_amd64.AppImage"
  ( cd "${srcdir}" && ./"Deepseek.Harness.Desktop_${pkgver}_amd64.AppImage" --appimage-extract >/dev/null )
  # AppImage 里目录权限是 700，不改的话装完普通用户读不到 /opt 下的文件。
  chmod -R a+rX "${srcdir}/squashfs-root"
}

package() {
  # 整个 AppDir 装到 /opt，保留 AppRun 及其 apprun-hooks 所需的相对布局。
  install -dm755 "${pkgdir}/opt/${pkgname}"
  # 只在打包目录内复制，保留权限/时间戳；所有权交给 fakeroot（构建环境里
  # 无法对 AppDir 里的属主执行 chown，且包内本来就应记为 root:root）。
  cp -a --no-preserve=ownership "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname}/"

  # 不经过 AppDir 自带的 AppRun.wrapped：那个 trampoline 会注入 PYTHONHOME、
  # PYTHONPATH（指向 AppDir 里并不存在的 Python，等于让所有 python3 失效）、
  # 以及 QT_PERL 等变量，污染 Harness 及其派生的终端/工具进程。
  # 这里只取 GTK 运行钩子和库路径，再直接 exec 真正的程序。
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/deepseek-harness-desktop" <<'EOF'
#!/bin/bash
APPDIR=/opt/dsh-tauri-desktop-appimage
export APPDIR
. "$APPDIR/apprun-hooks/linuxdeploy-plugin-gtk.sh"
export LD_LIBRARY_PATH="$APPDIR/usr/lib/:$APPDIR/usr/lib/x86_64-linux-gnu/:${LD_LIBRARY_PATH}"
exec "$APPDIR/usr/bin/deepseek-harness-desktop" "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/deepseek-harness-desktop"

  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/DSH Tauri.desktop" \
    "${pkgdir}/usr/share/applications/DSH Tauri.desktop"
  # 上游入口仍需 URL 占位符，dsh:// 链接才能传进来。
  sed -i \
    -e 's/^Exec=deepseek-harness-desktop$/Exec=deepseek-harness-desktop %u/' \
    -e 's|^MimeType=x-scheme-handler/dsh$|MimeType=x-scheme-handler/dsh;|' \
    "${pkgdir}/usr/share/applications/DSH Tauri.desktop"

  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/deepseek-harness-desktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/deepseek-harness-desktop.png"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE.details" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.details"
}
