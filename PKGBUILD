# Maintainer: busyo <pkgbuilds at qq694253220@gmail.com>

pkgname=mhy-warp-bin
pkgver=2.0.6
pkgrel=1
pkgdesc="米游抽卡记录查询软件"
arch=('x86_64')
url="https://github.com/busyoGG/MHYWarp"
license=('MIT')
provides=('mhy-warp')
conflicts=('mhy-warp')

_appimage="MHYWarp-${pkgver}.AppImage"

depends=('zlib' 'fuse2' 'wl-clipboard')  # AppImage 可能需要 fuse2，不是 fuse3
source=("${_appimage}::${url}/releases/download/${pkgver}/${_appimage}"
        "mhy-warp.desktop"
        "icon.png"
        "LICENSE"
        )

sha256sums=(
  '4466bdadf3ee5925c050950745824064a5f572709d6fce21a8c872ebb1adf7f2'
  '144b04954b03aa475d6f770c05fc0f56ec239e27b10b386765f8a2211c40984c'
  'cc4ed7c1e32113dacafb016d60041359c41b87268d0736312915257a6021e59a'
  '9d23d1b4c7debed98693f4747b64b5cf374b0cba656d0ab831c946e3bd5aee80'
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
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/mhy-warp/mhy-warp.AppImage"

  # icon
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/mhy-warp.png"

  # desktop 文件
  install -Dm644 "${srcdir}/mhy-warp.desktop" "${pkgdir}/usr/share/applications/mhy-warp.desktop"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/mhy-warp/mhy-warp.AppImage" "${pkgdir}/usr/bin/mhy-warp"

  # License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
