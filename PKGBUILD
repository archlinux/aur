# Maintainer: pika02

pkgname=chayuan-wps-addon-bin
_pkgname=chayuan-wps-addon
pkgver=6.1.0
pkgrel=2
pkgdesc="Chayuan AI WPS Writer JS add-in & MCP sidecar"
arch=('x86_64')
url="https://aidooo.com/products/chayuan"
license=('unknown')
depends=('python' 'bash')
optdepends=('wps-office: WPS 基础依赖'
            'wps-office-cn: WPS 国内版体验更好'
            'xclip: 允许 MCP 后台读取系统剪贴板')
options=('!strip')
source=("https://aidooo.com/downloads/chayuan/addon/linux-amd64/chayuan-${pkgver}-linux-x64.deb"
        "arch-user-init.sh"
        "chayuan-mcp.service")
sha256sums=('878d3ff844b596e355f7c5f306daa2236b396ebfa7f592eacc59e21dcade2759'
            'c12f0d995db23e8a0c8671a93ac4dd1ef82f5f4c6ba9ce69cb742badc589859a'
            '513e0763021d301f6cf618705c554cf280c7432988924df6238bf98acda29738')

install=${pkgname}.install

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

    chmod -R a+rX "${pkgdir}/opt/${_pkgname}"
    chmod +x "${pkgdir}/opt/${_pkgname}/chayuan_${pkgver}/mcp-sidecar/bin/"*
    chmod +x "${pkgdir}/opt/${_pkgname}/chayuan_${pkgver}/mcp-sidecar/"*.sh

    install -d "${pkgdir}/opt/${_pkgname}"
    sed "s/@PKGVER@/${pkgver}/g" "${srcdir}/arch-user-init.sh" > "${pkgdir}/opt/${_pkgname}/arch-user-init.sh"
    chmod 755 "${pkgdir}/opt/${_pkgname}/arch-user-init.sh"

    install -Dm644 "${srcdir}/chayuan-mcp.service" \
        "${pkgdir}/usr/lib/systemd/user/chayuan-mcp.service"
}
