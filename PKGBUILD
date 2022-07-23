# Maintainer: msojocs <jiyecafe@gmail.com>
# Contributor: YidaozhanYa <yidaozhan_ya@outlook.com>

pkgname=bilibili-bin
_pkgname=bilibili
pkgver=1.3.1
pkgrel=1
pkgdesc='Bilibili desktop client'
license=('custom')
depends=('ffmpeg' 'electron17' 'libappindicator-gtk3')
makedepends=('asar' 'p7zip' 'nodejs')
arch=('any')
url='https://app.bilibili.com'
install="${pkgname}.install"
source=("${_pkgname}-${pkgver}.exe::https://dl.hdslb.com/mobile/fixed/bili_win/bili_win-install.exe"
        "${_pkgname}"
        "${_pkgname}.png"
        "${_pkgname}.desktop"
        "extensions-v${pkgver}-${pkgrel}.tar.gz::https://github.com/msojocs/bilibili-linux/releases/download/v${pkgver}-${pkgrel}/extensions-v${pkgver}-${pkgrel}.tar.gz"
        "injectExt.js"
        "injectBridge.js"
        "injectIndex.js"
        "area-unlimit.sh"
        "fix-other.sh"
        "app-decrypt.js"
        "bridge-decode.js"
        "js-decode.js")
noextract=("${_pkgname}-${pkgver}.exe")
sha256sums=('1e5e10650d72af03fa646c6e52dcc05f9f733e7b47b965caea741bc44442b67c'
            'cd7961420bae8fb54b8523bb8b3190ce1cfb584b73f391bad52ca7a354b1b76f'
            '33cba5d0271d5783f353e60dacc01d2edc6629ca760d35427189e316a48f911f'
            'ce35cd6352cdeb248407093eec542dffe4a9a8bb9cab658cee9620752bb34895'
            '620bcfbfe4922b7836c94e4496b4b818abf2ce0a17b2bc5c07770dac1f53e32b'
            '76fd49617a113799140f1d386f692e6632d84cb7729bf0a482c2ba6b0a379460'
            '7f80ebcb11d2e82db19cfaa88e4f4649cfa520c191248bbc60d6465e94ecce5b'
            '8a1db419e35988b46e76adda6a69d609b1a88bb302202cf8e5f02a2afe2bf189'
            '51ef08b39e0232376aa59ef47e5d29b0e59de15520170c7a4d3853491b2b38c0'
            'd598bc92405505ee29eece1499a29c45498f3ed9736dbdfb6b7e1ef625823700'
            'c19228dd508df03a25752b588604e0ae70049cb60c7726709d3abcadfb9fb1a4'
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
    mv inject*.js res/scripts
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
