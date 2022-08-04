# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=chatty-git
_pkgname=${pkgname%-git}
pkgver=0.20.b1.r0.ge1b4616b
pkgrel=1
pkgdesc='Twitch Chat Client for Desktop'
arch=('any')
url='https://chatty.github.io/'
license=('GPL3')
depends=('java-environment' 'sh')
optdepends=('streamlink: for watching streams in a custom video player.'
            'livestreamer: for watching streams in a custom video player.')
makedepends=('gradle')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+https://github.com/chatty/chatty"
        "${_pkgname}.desktop"
        "${_pkgname}_script"
        "disable_version_check.patch")
sha256sums=('SKIP'
            '336ec8a45dee69253a636f5f6f1159ab5fb2677e5c1927cc9272d43f7cb6488c'
            '848069a724fcb691a0cd231dbb53e5900088fd5ed6eb6eac0ea0963eb8e689fb'
            'bcee0f6aae04498dcd26a68fe6ae09e924152f4fd3746b082adb1a0d241958df')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    patch -p1 -i '../disable_version_check.patch'
}

build() {
    cd "${srcdir}/${pkgname}"

    gradle --quiet build
    gradle --quiet release
}

package(){
    cd "${srcdir}/${pkgname}"

    mkdir -p "${srcdir}/Chatty_${pkgver}"
    pushd "${srcdir}/Chatty_${pkgver}"
    _zipfile="$(ls -t ${srcdir}/${pkgname}/build/releases/Chatty_*.zip | head -1)"
    bsdcpio -i -m --make-directories < "${_zipfile}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "readme.txt" "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
    install -Dm644 "Chatty.jar" "${pkgdir}/usr/share/${pkgname}/Chatty.jar"
    cp -a "img" "sounds" "${pkgdir}/usr/share/${pkgname}/"
    popd

    install -Dm755 "${srcdir}/${_pkgname}_script" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "src/chatty/gui/app_main_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png"
    install -Dm644 "src/chatty/gui/app_main_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png"
    install -Dm644 "src/chatty/gui/app_main_128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
