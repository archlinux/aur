# Maintainer: WhriedPlanck

pkgname=electron_lark
pkgver=1.0.3
pkgrel=1
pkgdesc="[CN] 使用 Electron 封装的网页版飞书 Feishu (原 Lark) 客户端, Linux 下可用"
arch=('x86_64')
url="https://github.com/Ericwyn/electron-lark"
#_from="https://feishu.cn"
license=('MIT')
depends=('electron')
provides=('electron-lark' 'lark' 'feishu')
source=("https://github.com/Ericwyn/electron-lark/releases/download/V${pkgver}/${pkgname}_${pkgver}_amd64.deb"
         LICENSE)
sha256sums=('e353faa5e604e81e25f3ffe434da14433387893507fb5a795c5bcea338976f7e'
            '9ff448c71e670bdfd1b55c08cb377d49d3371d6442df5cf2aee30febb38ef292')

prepare() {
    bsdtar -xf data.tar.xz
    # Build .sh
    echo "#!/bin/env sh
exec electron /usr/share/${pkgname}/app.asar \$@
" > "${srcdir}/${pkgname}.sh"
    
    # Fix hardcoded exec path in .desktop file
    sed -i "s/Exec=\/opt\/electron-lark\/electron-lark/Exec=electron-lark/g"  usr/share/applications/electron-lark.desktop
    sed -i "s/Categories=Utility;/Categories=Network;/g"  usr/share/applications/electron-lark.desktop
    sed -i "s/Icon=electron-lark/Icon=\/usr\/share\/icons\/hicolor\/512x512\/apps\/electron-lark/g"  usr/share/applications/electron-lark.desktop
    
    # Permission fix
    find "${srcdir}" -type d -exec chmod 755 {} +
    
    # Remove unnecessary stuff
    rm -rf "${srcdir}"/usr/share/doc
}

package() {
    # Install share
    cd "${srcdir}/usr/share"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/{}" \;

    # Install .sh
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  
    # Install resources
    cd "${srcdir}/opt/${pkgname}/resources"
    install -Dm644 app.asar "${pkgdir}/usr/share/${pkgname}/app.asar"
    
    # Install LICENSE
    cd "${pkgdir}"
    install -Dm644 "${srcdir}"/LICENSE usr/share/licenses/${pkgname}/LICENSE
}
