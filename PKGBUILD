pkgname=aionui-bin
_pkgname=aionui
pkgver=1.1.5
pkgrel=1
pkgdesc="Transform your command-line experience into a modern, efficient AI Chat interface."
arch=('x86_64')
url="https://github.com/iOfficeAI/AionUi" # <-- 示例网址，请替换为官方项目地址
license=('unknown')

depends=(
    'gtk3'
    'nss'
    'libcups'
    'mesa'
    'alsa-lib'
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}_${pkgver}_linux_amd64.deb::${url}/releases/download/v${pkgver}/aionui_${pkgver}_linux_amd64.deb")

sha256sums_x86_64=('f208a52b78fb83973740c915834fe30eda97b5233b718a6f70e1b3760391e10e')

package() {
    # .deb 包本质是一个 ar 归档文件，先用 ar 命令解开
    ar x "${srcdir}/${_pkgname}_${pkgver}_linux_amd64.deb"

    # 将核心文件 data.tar.xz 解压到打包目录中
    # bsdtar 会自动保留正确的文件权限
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    # (可选但推荐) 移除 Debian 特有的 lintian 目录，它在 Arch Linux 中没有用处
    rm -rf "${pkgdir}/usr/share/lintian"

    # 确保所有文件的所有者是 root，这是标准做法
    chown -R root:root "${pkgdir}"
}
