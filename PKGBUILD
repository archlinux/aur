# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flomo-bin
_pkgname=Flomo
_zhsname='浮墨笔记'
pkgver=5.26.103
_electronversion=36
pkgrel=1
pkgdesc="A new generation of cloud knowledge base for personal note-taking and knowledge creation, team collaboration and knowledge accumulation.新一代云端知识库，用于个人笔记与知识创作，团队协同与知识沉淀"
arch=('x86_64')
url="https://flomoapp.com/"
_dlurl="https://github.com/zxp19821005/My_AUR_Files"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
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
    "${pkgname%-bin}-${pkgver}.exe::${_dlurl}/releases/download/${pkgname%-bin}-mirrors/${pkgname%-bin}-${pkgver}-x64.exe"
    "LICENSE.html::https://help.flomoapp.com/legal/"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('6ae4f88b0891bb6e1399be69b3c879903b7c77e1eb8f87f3da4900f87e0ad68f'
            '783e3941e936ce62599ea6f5881e0efe419d90248c22df732e6334d2868db806'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            'ace275e253744ca62d2572776df26b947f3c89616239985003126db635fc300e')
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_check_electron_version() {
    _electronversion="$(strings "$(_get_app_dir)/${pkgname%-bin}.exe" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh" "${srcdir}/${pkgname%-bin}.js"
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
    _check_electron_version
    asar e "${srcdir}/tmp/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked" -type f -name "*.gz" -exec rm -rf {} +
    sed -i "s/icon.ico/icon.png/g" "${srcdir}/app.asar.unpacked/background.js"
    sed -i 's/"icons\/"+e/"icons\/icon.png"/g' "${srcdir}/app.asar.unpacked/background.js"
    cp "${srcdir}/app.asar.unpacked/icons/32x32.png" "${srcdir}/app.asar.unpacked/icons/darkTemplate.png"
    cp "${srcdir}/app.asar.unpacked/icons/32x32.png" "${srcdir}/app.asar.unpacked/icons/icon.png"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/tmp/resources/app.asar"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-bin}/elevate.exe"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${icon_sizes[@]}";do
        install -Dm644 "${srcdir}/app.asar.unpacked/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
