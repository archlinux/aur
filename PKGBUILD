# Maintainer: msojocs <jiyecafe@gmail.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>

pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.1.2
pkgrel=1
pkgdesc='Bilibili desktop client'
license=('custom')
depends=('ffmpeg' 'electron' 'libappindicator-gtk3')
makedepends=('asar' 'p7zip')
arch=('any')
url='https://app.bilibili.com'
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}.exe::https://dl.hdslb.com/mobile/fixed/bili_win/bili_win-install.exe"
        "${_pkgname}"
        "${_pkgname}.png"
        "${_pkgname}.desktop"
        "extensions-v${pkgver}-${pkgrel}.tar.gz::https://github.com/msojocs/bilibili-linux/releases/download/v${pkgver}-${pkgrel}/extensions-v${pkgver}-${pkgrel}.tar.gz"
        "injectExt.js"
        "area-unlimit.sh"
        "fix-other.sh")
noextract=("${_pkgname}-${pkgver}.exe")
sha256sums=('96718413342daca81b375a80fc996fa1ab19fc199c73bd9002eb32eccdbbb35f'
            '7da797cd35bc5060e3bfa4ba37681cbbd2201a499477772c008f9f1e691b6ea0'
            '33cba5d0271d5783f353e60dacc01d2edc6629ca760d35427189e316a48f911f'
            '76dce057c03c8f75b011c2072d32948a8db3de0961aec3fd445f40bf1fe79418'
            'b5d77954b13969bb0dd7f3226e434f4e04c56e05857ce4be0bbd84e4a07730b3'
            'e5326a2a5b6dd61d3274bcf5977c62ade6a59752d21f9634a2db8e6ad225ffe9'
            '086ee28cffb00ee053c50b92e20087ac14ec5938cd36129eee50c53461e734bc'
            '984999997e376d16036237686f2120e735c0b7e122bc6262e508c5d5c387de22')
prepare(){
    7z x "${_pkgname}-${pkgver}.exe" -o"bili" "\$PLUGINSDIR/app-64.7z"
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
