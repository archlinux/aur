# Maintainer: S Stewart <tda@null.net>
# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="koalalauncher"
pkgver="1.0.0"
pkgrel=1
commitsha="cf8bb600f5c61e4b9462d22d5cc3b4230bed2bc6"
arch=('x86_64')
pkgdesc="Koala Launcher is simple, yet powerful Minecraft custom launcher with a strong focus on the user experience"
url="https://koalalauncher.netlify.app"
license=('GPL3')
makedepends=('gendesk' 'git' 'yarn' 'nodejs' 'rust' 'unzip')
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3')
conflicts=('koalalauncher-bin')
source=("koalalauncher::git+https://github.com/KoalaDevs/KoalaLauncher.git")
md5sums=('SKIP')

prepare() {
    # clone source
    cd "${srcdir}/${pkgname}"
    git checkout origin/master
    git switch master
    git reset --hard ${commitsha}
    
    # generate .desktop
    gendesk --pkgname "Koala Launcher" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
    mv "Koala Launcher.desktop" "${pkgname}.desktop"

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
    mkdir ${pkgname}/
    unzip "KoalaLauncher-linux-setup.zip" -d koalalauncher
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
