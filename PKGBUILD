# Maintainer: pika02

pkgname=chayuan-wps-addon-bin
_pkgname=chayuan-wps-addon
pkgver=6.1.2
pkgrel=1
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
sha256sums=('c9fe5264a4f37016c1d71b114a8bf48c364779b95591012b50aaab7a51789d2d'
            'a35f9609f2b14fe8670fc05d59890aab98ea7c95ef0dbc4e31b2f9905078d7f5'
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
