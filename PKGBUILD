# Maintainer: msojocs <jiyecafe@gmail.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>

pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.1.3
pkgrel=2
pkgdesc='Bilibili desktop client'
license=('custom')
depends=('ffmpeg' 'electron' 'libappindicator-gtk3')
makedepends=('asar' 'p7zip' 'nodejs')
arch=('any')
url='https://app.bilibili.com'
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}.exe::https://dl.hdslb.com/mobile/fixed/bili_win/bili_win-install.exe"
        "${_pkgname}"
        "${_pkgname}.png"
        "${_pkgname}.desktop"
        "extensions-v${pkgver}-${pkgrel}.tar.gz::https://mirror.ghproxy.com/https://github.com/msojocs/bilibili-linux/releases/download/v${pkgver}-${pkgrel}/extensions-v${pkgver}-${pkgrel}.tar.gz"
        "injectExt.js"
        "area-unlimit.sh"
        "fix-other.sh"
        "app-decrypt.js"
        "bridge-decode.js"
        "js-decode.js")
noextract=("${_pkgname}-${pkgver}.exe")
sha256sums=('60f8546dafa3506cbfa39c38c3a0cb16278823d655dfd9b6a70fa72ca28c9e2e'
            '7da797cd35bc5060e3bfa4ba37681cbbd2201a499477772c008f9f1e691b6ea0'
            '33cba5d0271d5783f353e60dacc01d2edc6629ca760d35427189e316a48f911f'
            'ce35cd6352cdeb248407093eec542dffe4a9a8bb9cab658cee9620752bb34895'
            '0fc1a8185ecf942d358fc4866f9145c0278dab76f0d3e23cc068cd1110ad4c09'
            '76fd49617a113799140f1d386f692e6632d84cb7729bf0a482c2ba6b0a379460'
            '2c75e45ff90b8e0554315837f8f0b792351d5f2b7ef8362d63997a8e84177424'
            '0fe91717217ac581a890d7696438a2b96949e3407f339539591f9d98b4d7ff72'
            '4bf4426791850ac9ec430880cf66b8744c7e89480aeee9d1e5db1a5311cdf209'
            '9399099c831d97d1f0f85e90adf78eab85b2a00d532b1d428392bb7f77f3b56c'
            '04283a0427fe556ce6045d233328c5f864f7a72c42ba0c64adc71abd99b407ee')
prepare(){
    7z x "${_pkgname}-${pkgver}.exe" -o"tmp/bili" "\$PLUGINSDIR/app-64.7z"
    7z x "tmp/bili/\$PLUGINSDIR/app-64.7z" -o"tmp/bili" "resources"
    rm -rf "tmp/bili/\$PLUGINSDIR/app-64.7z" "tmp/bili/resources/elevate.exe"
    mkdir -p tools
    for file in *.sh app-decrypt.js bridge-decode.js js-decode.js; do
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
    mv tmp/bili/resources/* app
}
package() {
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/app/app.asar" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.asar"
    install -Dm644 "${srcdir}/app/app-update.yml" "${pkgdir}/usr/share/${_pkgname}/app-update.yml"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    cp -r "${srcdir}/app/extensions" "${pkgdir}/usr/share/${_pkgname}/extensions"
}
