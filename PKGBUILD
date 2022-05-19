# Maintainer: msojocs <jiyecafe@gmail.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>

pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.1.1
pkgrel=4
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
            'faf0ac96bc33cbda28105389d4dba19e23bc682cc010611d0b4529933e78a36c'
            '84c2ea643553b81dd8df912c0b79618697b7a2ef2cc1c8199a0f446873b615c6'
            '04d40011c2442f32f851e9ea7be45214c2f3a827a00d6b81c9323a0cf8142a7c'
            '48ef876935fe7798faeafbfcdffbbf29e93677c7c5492c745eaa757f4fecb9cc')
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
