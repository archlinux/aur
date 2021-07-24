# Maintainer: ssfdust <ssfdust@gmail.com>
# Contributor: sukanka <su975853527@gmail.com>
pkgname=freechat-git
_name=freechat
url="https://github.com/eNkru/freechat"
pkgrel=1
pkgver=1.0.0.r68.3a8304e
pkgdesc="致力于打造macOS和Linux桌面下最好用的微信（wechat）客户端。"
arch=("any")
license=("MIT")
makedepends=("git" "yarn" "gendesk")
depends=('electron')
provides=("freechat")
source=("git+https://github.com/eNkru/freechat.git")
md5sums=("SKIP")
options=(!strip)
 
pkgver() {
    cd "${srcdir}"/freechat/
    printf "%s.r%s.%s" "$(awk 'match($0, /"version": "(.*)"/, a) {print a[1]}' package.json)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
build() {
    cmd="/usr/bin/electron /usr/share/${_name}/${_name}.asar"
    gendesk -f --pkgname "$_name" --pkgdesc "$pkgdesc" -n --icon "${_name}" --categories "Network;" --genericname "微信" --name "微信" --exec "$cmd"
    cd "${srcdir}"/freechat
    yarn install
    yarn run pack
}
 
package(){
    cp $srcdir/${_name}/dist/linux-unpacked/resources/app.asar   $srcdir/${_name}.asar
    for res in {12,16,32,48,64,128,256,512}
    do 
        install -Dm644 "${srcdir}"/freechat/build/icons/${res}x${res}.png \
        "${pkgdir}"/usr/share/icons/hicolor/${res}x${res}/apps/${_name}.png
    done;
    
    install -Dm644 "${srcdir}/${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
    install -Dm644 "${srcdir}"/${_name}.asar "${pkgdir}"/usr/share/${_name}/${_name}.asar
}
