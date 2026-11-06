# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mubu-bin
_pkgname=Mubu
_zhsname='幕布'
pkgver=6.1.1
_electronversion=32
pkgrel=1
pkgdesc="A mind management tool that combines outline notes and mind maps.一款结合了大纲笔记和思维导图的头脑管理工具(packed from origin exe)"
arch=('x86_64')
url="https://mubu.com"
license=('LicenseRef-mubu')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    '7zip'
    'gendesk'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::https://assets.mubu.com/client/${pkgver}/win/${_pkgname}-${pkgver}-x64.exe"
    "LICENSE-${pkgver}.html::${url}/agreement"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('05cc37a175b7cf237c5aaaa5242d37abe4f131248d0e84988a538660486a3310'
            'dbc572392757c2abbb6d6d7ca62337561b46b8f3b403963a3624fa5a4884c4ec'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            'ace275e253744ca62d2572776df26b947f3c89616239985003126db635fc300e')
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -printf '%h\n' 2>/dev/null \
		| while read -r d; do [[ -d "${d}/resources" ]] && { echo "$d"; return 0; }; done
}
_check_electron_version() {
    _elec_ver="$(strings "$(_get_app_dir)/${_zhsname}.exe" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    (( _elec_ver == _electronversion )) && c=32 || c=31
	echo -e "Electron version: \033[1;${c}m${_elec_ver}$([[ ${c} -eq 31 ]] && echo " (expected ${_electronversion})")\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh" "${srcdir}/${pkgname%-bin}.js"
    gendesk -f -n -q \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Office" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U" \
        --custom="Name[zh_CN]=${_zhsname}"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.exe"
    _check_electron_version
    local _app_dir=$(_get_app_dir)
    asar e "$(_get_app_dir)/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked" -type f -name "*.js" -exec sed -i "s/shortcut-logo.ico/logo.png/g" {} +
    find "${srcdir}/app.asar.unpacked/node_modules" -type d \( -name "android-arm*" -o -name "darwin-*" -o -name "linux-arm*" -o -name "win32-*" \) \
        -exec rm -rf {} +
    asar p "${srcdir}/app.asar.unpacked" "$(_get_app_dir)/resources/app.asar"
    find "$(_get_app_dir)/resources/app.asar.unpacked/node_modules" \
        -type d \( -name "android-arm*" -o -name "darwin-*" -o -name "linux-arm*" -o -name "win32-*" \) \
        -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "$(_get_app_dir)/resources/app.asar.unpacked/icon/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}