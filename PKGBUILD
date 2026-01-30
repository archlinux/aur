# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qoder-bin
_pkgname=Qoder
pkgver=0.3.4
_electronversion=37
pkgrel=1
pkgdesc="Agent Programming Platform for Real Software.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://qoder.com/"
_ghurl="https://github.com/QoderAI/changelog-zh_CN"
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
sha256sums=('008f06e7d8a90e3cdd1e5475175cb55284f75a3b44124c860d462102ad59bb0c'
            '56adce8d01e5b2fcabd6f87f8e69acaf847e54f687b6f73f489adaa6525d37df'
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
