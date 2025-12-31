# Maintainer: Your Name <youremail@example.com>

# ---------------------------------------------------------------------------
# [更新指南]
# 每次发布新版本时，请更新以下变量:
# 1. pkgver: 修改为新版本号
# 2. pkgrel: 如果是新版本，重置为 1；如果是同一版本修复 PKGBUILD，则递增
# 3. sha256sums: 运行 'updpkgsums' 自动更新，或者手动计算填入
# ---------------------------------------------------------------------------

pkgname=antigravity-tools-bin
_pkgname="Antigravity.Tools"
_repouser="lbjlaq"
_reponame="Antigravity-Manager"

pkgver=3.3.7
pkgrel=1

pkgdesc="Professional Antigravity Account Manager & Switcher (Binary from GitHub)"
arch=('x86_64')
url="https://github.com/${_repouser}/${_reponame}"
license=('custom:CC-BY-NC-SA-4.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'openssl')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

# 下载源
source=("${pkgname}-${pkgver}.deb::https://github.com/${_repouser}/${_reponame}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
        "LICENSE")

# [需更新] 校验和
# 运行 'updpkgsums' 命令可以自动更新此处的值，无需手动修改
sha256sums=('4a3cf8469ef21fee588da8bdb64262ca3206a157ab50c04f421911aebde078cf'
            '6f0afc78b16f446941c6201dcc0a53e1d19dcb96b9fc2ccb497b1bf029aa3512')

options=('!strip')

package() {
    # 1. 解压 data.tar.gz (这是 deb 包里的核心文件)
    tar -xf data.tar.gz -C "${pkgdir}"

    # 2. 修正路径: Debian 包通常用 /usr/local，Arch 需要移动到 /usr
    if [ -d "${pkgdir}/usr/local" ]; then
        cp -a "${pkgdir}/usr/local/." "${pkgdir}/usr/"
        rm -rf "${pkgdir}/usr/local"
    fi

    # 3. 安装许可证
    # 将项目根目录下的 LICENSE 文件安装到系统标准位置
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
