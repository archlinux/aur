# Maintainer: NotARoomba <kg5inb1@hotmail.com>
pkgname=wellness-wizard-git
pkgver=1.0.1
pkgrel=1
pkgdesc='An AI powered posture checker'
arch=('x86_64')
url='https://github.com/halftonenano/Hackathon_gitinit'
license=('MIT')
depends=('electron' 'nodejs' 'imagemagick')
makedepends=('electron' 'nodejs' 'asar' 'imagemagick')
prepare() {
    rm -rf "${srcdir}"
    mkdir "${srcdir}"
    cd "${srcdir}"
    git clone https://github.com/halftonenano/Hackathon_gitinit "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    ls
    patch -p1 -i "${srcdir}/../client.patch"
    patch -p1 -i "${srcdir}/../index.patch"
    patch -p1 -i "${srcdir}/../package.patch"
}
build() {
    cd "${pkgname}-${pkgver}/client"
    convert "./src/routes/wellnessWizardLogo.svg" -background none -flatten "../icon.png"
    npm i
    npm run build
    cd ..
    npm i
    electron-builder --linux dir
    cp "./icon.png" ./dist/linux-unpacked
}

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share"
    install -dm755 "${pkgdir}/usr/share/applications"
    cp -fr "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked" "${pkgdir}/usr/share/${pkgname}/"
    ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    echo -e "[Desktop Entry]\nName=${pkgname}\nExec=/usr/bin/${pkgname}\nIcon=/usr/share/${pkgname}/icon.png\nType=Application\nCategories=Utilities" > ${pkgdir}/usr/share/${pkgname}/${pkgname}.desktop
    ln -s "/usr/share/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
