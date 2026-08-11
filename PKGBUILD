# Maintainer: jswysnemc <snemc@qq.com>
# Binary package: downloads prebuilt pacman package from GitHub Release.
# Source package mark-shot builds from source; mark-shot-bin installs prebuilt binary.
pkgname=mark-shot-bin
pkgver=0.1.47
pkgrel=1
pkgdesc='Qt 6 Wayland screenshot selection and annotation tool (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/jswysnemc/mark-shot'
license=('MIT')
# FFmpeg 大版本升级时 soname 整体 +1（libavformat.so.62 -> .so.63），
# 只写 'ffmpeg' 会让针对旧 FFmpeg 编译的预编译包通过依赖检查却无法加载库。
# 这里列出 .so 名，makepkg 会扫描 package() 解压出的二进制并展开为
# libavformat.so=62-64 形式，库代际不匹配时 pacman 直接拒绝安装。
depends=('qt6-base' 'qt6-svg' 'qt6-wayland' 'pipewire' 'grim' 'wl-clipboard' 'hicolor-icon-theme' 'python'
         'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libavfilter.so' 'libswresample.so' 'libswscale.so')
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
sha256sums_x86_64=('782ed2d712eb6ff8ef58562d94b358be9010ae788d12325cbd0b87bd2649aed7')
sha256sums_aarch64=('3f99b5f1e258182fa6719e21a876178f0b17a4a65bcf104124552424615deb30')
options=('!strip')

# 解压预编译 pacman 包到 pkgdir，排除包元数据文件
# $CARCH 由 makepkg 设置为当前目标架构（x86_64 或 aarch64）
package() {
    bsdtar -xf "${srcdir}/mark-shot-bin-${pkgver}-1-${CARCH}.pkg.tar.zst" -C "${pkgdir}" \
        --exclude='.PKGINFO' \
        --exclude='.MTREE' \
        --exclude='.BUILDINFO'
}
