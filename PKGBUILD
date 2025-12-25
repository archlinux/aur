# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qoder-bin
_pkgname=Qoder
pkgver=0.2.24
_electronversion=37
pkgrel=1
pkgdesc="Agent Programming Platform for Real Software.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://qoder.com/"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python'
    'python-websockets'
    'gtk4'
    'python-importlib-metadata'
    'python-tomlkit'
    'python-colorama'
    'python-pyqt6'
    'python-orjson'
    'python-opengl'
    'pyside6'
    'python-packaging'
    'python-yaml'
    'python-attrs'
    'python-wxpython'
    'python-zipp'
    'python-pyqt5'
    'python-msgpack'
    'python-requests'
    'python-typing_extensions'
    'python-greenlet'
    'python-setuptools'
    'python-pip'
    'python-gobject'
    'gtk2'
    'libxkbfile'
)
optdepends=(
    'bash'
    'zsh'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::https://download.qoder.com/release/latest/${pkgname%-bin}_${CARCH}.rpm"
    "LICENSE-${pkgver}::https://qoder.com/product-service"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('975a80270c03fca0059cdbfa54bf97f708e015b52f783c19e9688941c2d2e5df'
            '9edfef3485b3d2b33d583116a8caf75b69ee6c8501dd7d281b66ee2007aa8784'
            '51c4f53005bf6cbfb3740a04f9ede901e7bb84cc60ad6a2bbae77e8355b34ebc'
            'e0ab2fe87491fabd9c7886f22c6929169edb508be832036a02698760b721f207')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/@ELECTRON@/electron${_electronversion}/g" "${srcdir}/${pkgname%-bin}.js"
    sed -i -e "
        s/\/usr\/share\/${pkgname%-bin}\///g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}"*.desktop
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}/resources/app/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}"* -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}-workspace.xml" -t "${pkgdir}/usr/share/mime/packages"
    if [ -x "/usr/bin/zsh" ];then
        install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    fi
    if [ -x "/usr/bin/zsh" ];then
        install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/site-functions"
    fi
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
