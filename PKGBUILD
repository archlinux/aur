# Maintainer: busyo <pkgbuilds at qq694253220@gmail.com>

pkgname=mhy-warp-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="米游抽卡记录查询软件"
arch=('x86_64')
url="https://github.com/busyoGG/MHYWarp"
license=('MIT')
provides=('mhy-warp')
conflicts=('mhy-warp')

_appimage="mhy-warp.AppImage"

depends=('zlib' 'fuse2')  # AppImage 可能需要 fuse2，不是 fuse3
source=("${_appimage}::${url}/releases/download/${pkgver}/MHYWarp-${pkgver}.AppImage"
        "mhy-warp.desktop"
        "icon.png")
sha256sums=(
  'c051323b4eb0dd368e05ffaff5b0fb84ed8e87cc1500dc22c53f52bb9a1db3b0'
  '144b04954b03aa475d6f770c05fc0f56ec239e27b10b386765f8a2211c40984c'
  'cc4ed7c1e32113dacafb016d60041359c41b87268d0736312915257a6021e59a'
)

options=(!strip !debug)
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage 安装
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/mhy-warp/${_appimage}"

  # icon
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/mhy-warp.png"

  # desktop 文件
  install -Dm644 "${srcdir}/mhy-warp.desktop" "${pkgdir}/usr/share/applications/mhy-warp.desktop"

  # 启动脚本
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mhy-warp" <<'EOF'
#!/bin/bash
exec /opt/mhy-warp/mhy-warp.AppImage "$@"
EOF

  ls -l ${pkgdir}/opt/mhy-warp/
}
