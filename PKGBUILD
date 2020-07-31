# Maintainer: Prem <prmsrswt at gmail dot com>
# Contributor: LLL2yu <lll2yu@protonmail.com>

pkgname="auryo"
_desktopname="auryo"
_fullpkgname="Auryo"
pkgver=2.5.4
pkgrel=1
pkgdesc="A SoundCloud client for your desktop."
arch=("x86_64")
url="https://auryo.com"
license=("GPL3")
makedepends=('npm' 'yarn')
conflicts=('auryo-bin' 'auryo-git')
source=("https://github.com/Superjo149/auryo/archive/v${pkgver}.tar.gz")
md5sums=('57b79057961f5accdad5e529fa0dc8d2')
_replace_str="\/opt\/${_fullpkgname}\/${_fullpkgname}"

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's/"deb",//' package.json
    sed -i 's/"rpm",//' package.json
    sed -i 's/"AppImage",//' package.json
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install
    yarn build
    yarn electron-builder --linux pacman
}

package() {
    mkdir -p "${srcdir}/${pkgver}"
    tar -xvf ${srcdir}/${pkgname}-${pkgver}/build/release/${pkgname}-${pkgver}.pacman -C ${srcdir}/${pkgver}
    cd "${srcdir}/${pkgver}"
    install -dm755 "${pkgdir}/opt/"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/${pkgver}/opt/${_fullpkgname}" "${pkgdir}/opt/"
    cp -r "${srcdir}/${pkgver}/usr/share/applications/${_desktopname}.desktop" "${pkgdir}/usr/share/applications/"
    cp -r "${srcdir}/${pkgver}/usr/share/icons" "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${_fullpkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    sed -i "s/${_replace_str}/${pkgname}/g" "${pkgdir}/usr/share/applications/${_desktopname}.desktop"
}
