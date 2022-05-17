# Maintainer: msojocs <jiyecafe@gmail.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>

pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.1.1
pkgrel=3
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
        "${_pkgname}.desktop"
        "extensions-v${pkgver}-${pkgrel}.tar.gz::https://github.com/msojocs/bilibili-linux/releases/download/v${pkgver}-${pkgrel}/extensions-v${pkgver}-${pkgrel}.tar.gz"
        "injectExt.js"
        "area-unlimit.sh"
        "fix-other.sh")
noextract=('bili_win-install.exe')
sha256sums=('5d5d86963f5a922ce5f616159e0d5705602aa39c7520dc8a5f0f020adb74a3da'
            '7da797cd35bc5060e3bfa4ba37681cbbd2201a499477772c008f9f1e691b6ea0'
            '33cba5d0271d5783f353e60dacc01d2edc6629ca760d35427189e316a48f911f'
            '76dce057c03c8f75b011c2072d32948a8db3de0961aec3fd445f40bf1fe79418'
            '122b89f5fff5d46a52eb3c21ac105b22b6cab6258a5c001af0f86ae88f403b75'
            'a26c6ae257441a51240e597b40aea163e3d1de97fbff8d720d419b96713aab6e'
            '559d9cfd957a0d2a9559a8e0dd6ade78da51912abeae05b216e67fae9a119cda'
            'a83ab767620aaf9ea9f15190cc22f7279d8465be5435998ca4a5efbfc0bf57b1')
prepare(){
    7z x "bili_win-install.exe" -o"bili" "\$PLUGINSDIR/app-64.7z"
    7z x "bili/\$PLUGINSDIR/app-64.7z" -o"bili" "resources"
    rm -rf "bili/\$PLUGINSDIR/app-64.7z" "bili/resources/elevate.exe"
    mkdir -p app
    mv "bili/resources/"* app
    mkdir -p tools
    for file in *.sh; do
        mv $file tools;
    done
    mkdir -p res/scripts
    mv injectExt.js res/scripts
}
_log() {
    echo -e "\e[1;34m$@\e[0m"
}
build(){
    for script in fix-other.sh area-unlimit.sh; do
        _log "run ${script}"
        "${srcdir}/tools/${script}"
    done
}
package() {
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/app/app.asar" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.asar"
    install -Dm644 "${srcdir}/app/app-update.yml" "${pkgdir}/usr/share/${_pkgname}/app-update.yml"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    cp -r "${srcdir}/app/extensions" "${pkgdir}/usr/share/${_pkgname}/extensions"
}
