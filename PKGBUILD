# Maintainer: msojocs <jiyecafe@gmail.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>

pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.1.1
pkgrel=1
pkgdesc='Bilibili desktop client'
license=('custom')
depends=('ffmpeg' 'electron' 'libappindicator-gtk3')
makedepends=('asar' 'p7zip')
arch=('any')
url='https://app.bilibili.com'
install="${pkgname}.install"
source=('bili_win-install.exe::https://dl.hdslb.com/mobile/fixed/bili_win/bili_win-install.exe'
        "${_pkgname}"
        "${_pkgname}.png"
        "${_pkgname}.desktop")
noextract=('bili_win-install.exe')
sha256sums=('5d5d86963f5a922ce5f616159e0d5705602aa39c7520dc8a5f0f020adb74a3da'
            '7da797cd35bc5060e3bfa4ba37681cbbd2201a499477772c008f9f1e691b6ea0'
            '33cba5d0271d5783f353e60dacc01d2edc6629ca760d35427189e316a48f911f'
            '76dce057c03c8f75b011c2072d32948a8db3de0961aec3fd445f40bf1fe79418')
prepare(){
    7z x "bili_win-install.exe" -o"bili" "\$PLUGINSDIR/app-64.7z"
    7z x "bili/\$PLUGINSDIR/app-64.7z" -o"bili" "resources"
    rm -rf "bili/\$PLUGINSDIR/app-64.7z" "bili/resources/elevate.exe"
}
build(){
    cd "bili/resources"
    asar e app.asar app
    # 修复新版不能启动的问题
    sed -i 's#||b4&&dV!==e7(0x8b1)##' app/main/index.js
    # 任务栏菜单
    sed -i 's#\\x77\\x69\\x6e\\x33\\x32#linux#' app/main/index.js
    # 去除标题栏
    # ]}});this[
    sed -i "s#]}});this\\[#]},frame:false});this[#g" app/main/index.js
    sed -i "s#]}}),this\\[#]},frame:false}),this[#g" app/main/index.js
    # 降低窗口大小限制，处理小分辨率屏幕无法全屏的问题
    # resizable
    sed -i "s#\\\x72\\\x65\\\x73\\\x69\\\x7a\\\x61\\\x62\\\x6c\\\x65':!\\[]#\\\x72\\\x65\\\x73\\\x69\\\x7a\\\x61\\\x62\\\x6c\\\x65':true#g" app/main/index.js
    # Width
    sed -i "s#\\\x57\\\x69\\\x64\\\x74\\\x68':0x[0-9a-z]\+#\\\x57\\\x69\\\x64\\\x74\\\x68':800#g" app/main/index.js
    # Height
    sed -i "s#\\\x48\\\x65\\\x69\\\x67\\\x68\\\x74':0x[0-9a-z]\+#\\\x48\\\x65\\\x69\\\x67\\\x68\\\x74':400#g" app/main/index.js
    # 检查更新
    sed -i 's#// noinspection SuspiciousTypeOfGuard#runtimeOptions.platform="win32";// noinspection SuspiciousTypeOfGuard#' app/node_modules/electron-updater/out/providerFactory.js
    sed -i 's#process.resourcesPath#path.dirname(this.app.getAppPath())#' app/node_modules/electron-updater/out/ElectronAppAdapter.js
    asar p app app.asar
    rm -rf app
}
package() {
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/bili/resources/app.asar" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.asar"
    install -Dm644 "${srcdir}/bili/resources/app-update.yml" "${pkgdir}/usr/share/${_pkgname}/app-update.yml"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
