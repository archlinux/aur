# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flomo-bin
_pkgname=Flomo
_zhsname='浮墨笔记'
pkgver=5.26.51
_electronversion=36
pkgrel=1
pkgdesc="A new generation of cloud knowledge base for personal note-taking and knowledge creation, team collaboration and knowledge accumulation.(Prebuilt version.Use system-wide electron)新一代云端知识库，用于个人笔记与知识创作，团队协同与知识沉淀"
arch=('x86_64')
url="https://flomoapp.com/"
_dlurl="https://github.com/zxp19821005/My_AUR_Files"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
prodives=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'asar'
    'icoutils'
    '7zip'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::${_dlurl}/releases/download/${pkgname%-bin}/${pkgname%-bin}-${pkgver}.exe"
    "LICENSE.html::https://help.flomoapp.com/legal/"
    "${pkgname%-bin}.sh"
)
sha256sums=('92f23cde4f0c31e0bea6ba2b7c55e442245b3ba3a782fb72a58551d58f23ae40'
            '262c2023c95bc543072bfc997e80076548e5472ba344052b2fc18a1557de13b6'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/tmp/${pkgname%-bin}.exe" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}卡片笔记/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Office" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} %U" \
        --custom="Name[zh_CN]=${_zhsname}"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.exe"
    install -Dm755 -d "${srcdir}/tmp"
    7z x -aoa "${srcdir}/\$PLUGINSDIR/app-64.7z" -o"${srcdir}/tmp"
    _get_electron_version
    asar e "${srcdir}/tmp/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/tmp/resources/app.asar"
    find "${srcdir}/app.asar.unpacked" -type f -name "*.gz" -exec rm -rf {} +
    sed -i -e "
        s/icon.ico/icon.png/g
        s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g
    " "${srcdir}/app.asar.unpacked/background.js"
    sed -i 's/"icons\/"+e/"icons\/icon.png"/g' "${srcdir}/app.asar.unpacked/background.js"
    cp "${srcdir}/app.asar.unpacked/icons/32x32.png" "${srcdir}/app.asar.unpacked/icons/darkTemplate.png"
    cp "${srcdir}/app.asar.unpacked/icons/32x32.png" "${srcdir}/app.asar.unpacked/icons/icon.png"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/tmp/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${icon_sizes[@]}";do
        install -Dm644 "${srcdir}/app.asar.unpacked/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
