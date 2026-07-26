# Maintainer: jswysnemc <snemc@qq.com>
# Binary package: downloads prebuilt pacman package from GitHub Release.
# Source package mark-shot builds from source; mark-shot-bin installs prebuilt binary.
pkgname=mark-shot-bin
pkgver=0.1.44
pkgrel=1
pkgdesc='Qt 6 Wayland screenshot selection and annotation tool (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/jswysnemc/mark-shot'
license=('MIT')
depends=('qt6-base' 'qt6-wayland' 'pipewire' 'ffmpeg' 'grim' 'wl-clipboard' 'hicolor-icon-theme' 'python')
# x86_64：Arch 容器编译，声明 layer-shell-qt
# aarch64：当前 CI 在 Ubuntu 22.04-arm 预编译，so 代际可能与 Arch aarch64 不一致；
#          aarch64 用户优先安装源码包 mark-shot 在本机构建
# depends_x86_64 在 depends 基础上追加，不是替换
depends_x86_64=('layer-shell-qt')
optdepends=(
    'xdg-desktop-portal: portal-based screenshot and screencast backend'
    'xclip: X11 clipboard backend'
    'python-rapidocr: preferred OCR backend'
    'python-pillow: image processing for code scanning'
    'python-zxing-cpp: preferred QR/barcode scanning backend'
    'tesseract: fallback OCR backend'
)
provides=('mark-shot')
conflicts=('mark-shot')

# Release 资产命名规则: mark-shot-bin-${pkgver}-1-${arch}.pkg.tar.zst
# noextract 阻止 makepkg 自动解压 .pkg.tar.zst，package() 里手动 bsdtar 解压
source_x86_64=("https://github.com/jswysnemc/mark-shot/releases/download/v${pkgver}/mark-shot-bin-${pkgver}-1-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/jswysnemc/mark-shot/releases/download/v${pkgver}/mark-shot-bin-${pkgver}-1-aarch64.pkg.tar.zst")
noextract=("mark-shot-bin-${pkgver}-1-x86_64.pkg.tar.zst" "mark-shot-bin-${pkgver}-1-aarch64.pkg.tar.zst")
sha256sums_x86_64=('1ca1b37b197ae100630e6c828e43cd58dd5a4a410b49cef4f72c9487c4cf4bd5')
sha256sums_aarch64=('ab80f4b04e593e9b767b371b03d6d79eb9532d786f5b1591fe37730c25f0b978')
options=('!strip')

# 解压预编译 pacman 包到 pkgdir，排除包元数据文件
# $CARCH 由 makepkg 设置为当前目标架构（x86_64 或 aarch64）
package() {
    bsdtar -xf "${srcdir}/mark-shot-bin-${pkgver}-1-${CARCH}.pkg.tar.zst" -C "${pkgdir}" \
        --exclude='.PKGINFO' \
        --exclude='.MTREE' \
        --exclude='.BUILDINFO'
}
