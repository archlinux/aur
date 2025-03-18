# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flomo-bin
_pkgname=Flomo
_zhsname='浮墨笔记'
pkgver=5.25.31
_electronversion=20
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
    "${pkgname%-bin}-${pkgver}.exe::${_dlurl}/releases/download/${pkgname%-bin}${pkgver}/${pkgname%-bin}-${pkgver}-x64.exe"
    "LICENSE.html::https://help.flomoapp.com/legal/"
    "${pkgname%-bin}.sh"
)
sha256sums=('c5bb3554fc63d6b033bed68d264980dc72a60572d8cc9794fb8ad16e05b09a98'
            'acce6ce0e604ac50abcc25e5197a46708bfda9502a6232a34b99c10666e5a6d2'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}卡片笔记/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Office" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
    sed -i "3i\Name[zh_CN]=${_zhsname}" "${srcdir}/${pkgname%-bin}.desktop"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.exe"
    install -Dm755 -d "${srcdir}/tmp"
    7z x -aoa "${srcdir}/\$PLUGINSDIR/app-64.7z" -o"${srcdir}/tmp"
    asar e "${srcdir}/tmp/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i -e "
        s/icon.ico/icon.png/g
        s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g 
    " "${srcdir}/app.asar.unpacked/background.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${icon_sizes[@]}";do
        install -Dm644 "${srcdir}/app.asar.unpacked/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}