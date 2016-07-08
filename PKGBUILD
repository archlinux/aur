# Maintainer: Kalentia <kalentia.git@gmail.com>
_pkgname=astrosound-redux
pkgname=astrosound-redux-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A modern music player made with Electron"
arch=('i686' 'x86_64')
url='https://github.com/XNBlank/astrosound-redux'
license=('GPL')
makedepends=('git' 'npm' 'gendesk')
source=('git+https://github.com/XNBlank/astrosound-redux')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    gendesk -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}"
}

package() {
    case $CARCH in
      'i686') _arch='ia32';;
      'x86_64') _arch='x64';;
    esac

    # Build package with electron
    cd "${_pkgname}"
    npm install
    npm install electron-packager --save-dev
    ./node_modules/.bin/electron-packager . astrosound-redux --appname=astrosound-redux \
    --version=1.2.6 --platform=linux --arch="${_arch}"

    # Install files
    install -d "${pkgdir}/opt/astrosound-redux"
    cp -a "${srcdir}/${_pkgname}/${_pkgname}-linux-${_arch}/." "${pkgdir}/opt/${_pkgname}/"

    # Install desktop entry
    install -d "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"

    # Symlink main binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink icon
    install -d "${pkgdir}/usr/share/pixmaps"
    ln -s "/opt/${_pkgname}/resources/app/app.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    # Install license file
    install -Dm644 "${pkgdir}/opt/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"
    rm "${pkgdir}/opt/${_pkgname}/LICENSE"
    rm "${pkgdir}/opt/${_pkgname}/LICENSES.chromium.html"
}
