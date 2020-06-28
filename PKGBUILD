# Maintainer: S Stewart <tda@null.net>
# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="gdlauncher"
pkgver="1.0.8"
pkgrel=1
commitsha="735449de98c198e128409c6481979dc0e06adecc"
arch=('x86_64')
pkgdesc="GDLauncher is simple, yet powerful Minecraft custom launcher with a strong focus on the user experience"
url="https://gdevs.io"
license=('GPL3')
makedepends=('gendesk' 'git' 'yarn' 'nodejs' 'rust' 'unzip')
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3')
conflicts=('gdlauncher-appimage' 'gdlauncher-git' 'gdlauncher-bin')
source=("gdlauncher::git+https://github.com/gorilla-devs/GDLauncher.git")
md5sums=('SKIP')

prepare() {
    # clone source
    cd "${srcdir}/${pkgname}"
    git checkout origin/master
    git switch master
    git reset --hard ${commitsha}
    
    # generate .desktop
    gendesk -f --pkgname "GDLauncher" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n
    mv "GDLauncher.desktop" "${pkgname}.desktop"

    # put yarn in testing mode
    cd "${srcdir}/${pkgname}"
    echo "RELEASE_TESTING=true" > .env    
}

build() {
    cd "${srcdir}/${pkgname}"
    yarn
    yarn release
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/${pkgname}/deploy"
    mkdir gdlauncher/
    unzip "GDLauncher-linux-setup.zip" -d gdlauncher
    cp -Rr "${srcdir}/${pkgname}/deploy/${pkgname}"* "${pkgdir}/opt/"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor"
    cp -Rr "${srcdir}/${pkgname}/public/icon.png" "${pkgdir}/usr/share/icons/"
    
    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
