# Maintainer: pika02

pkgname=chayuan-wps-addon-bin
_pkgname=chayuan-wps-addon
pkgver=5.1.4
pkgrel=1
pkgdesc="Chayuan AI WPS Writer JS add-in & MCP sidecar"
arch=('x86_64')
url="https://aidooo.com/products/chayuan"
license=('unknown')
depends=('python' 'bash')
optdepends=('wps-office: WPS 基础依赖'
            'wps-office-cn: WPS 国内版体验更好')
options=('!strip')
source=("https://aidooo.com/downloads/chayuan/addon/linux-amd64/chayuan-${pkgver}-linux-x64.deb"
        "arch-user-init.sh"
        "chayuan-mcp.service")
sha256sums=('c93adddf7331d5baf18acdafc6f486ac996f2242155275c4df7700329597a1f8'
            '601cf125bb287b1417f37d6626b1e71853b307a42474d7c946162a5ec07e6f24'
            '83818411f25f7c0b910897fb7062039946233b3690622f0a2026e38b9b89a720')

install=${pkgname}.install

package() {
    # 解压 deb 数据包到打包目录
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

    # 修复官方包中可能丢失的执行权限
    chmod -R a+rX "${pkgdir}/opt/${_pkgname}"
    chmod +x "${pkgdir}/opt/${_pkgname}/chayuan_${pkgver}/mcp-sidecar/bin/"*
    chmod +x "${pkgdir}/opt/${_pkgname}/chayuan_${pkgver}/mcp-sidecar/"*.sh

    # 安装自定义初始化脚本，并动态注入版本号
    install -d "${pkgdir}/opt/${_pkgname}"
    sed "s/@PKGVER@/${pkgver}/g" "${srcdir}/arch-user-init.sh" > "${pkgdir}/opt/${_pkgname}/arch-user-init.sh"
    chmod 755 "${pkgdir}/opt/${_pkgname}/arch-user-init.sh"

    # 安装 Systemd User Service 模板
    install -Dm644 "${srcdir}/chayuan-mcp.service" \
        "${pkgdir}/usr/lib/systemd/user/chayuan-mcp.service"
}
