# Maintainer: donfabio <fabio at fabioarnold dot de>

# This package is based on the gog-shovel-knight package from Nascher.

pkgname=shovel-knight-hib
pkgver=2.2.1
pkgrel=1
pkgdesc='Shovel Knight is a 2D side-scrolling platform game developed and published by Yacht Club Games (Humble Bundle version)'
arch=("i686" "x86_64")
url='http://yachtclubgames.com/shovel-knight/'
license=('custom:commercial')
depends=('sdl2')
groups=('games')

source=("hib://ShovelKnight_${pkgver}.tar.gz" "${pkgname}.desktop" "icon.png")
sha512sums=('3b0724761c4f27d3b11068298e3c4c2c0e06290934d0c56e6e8d9a54259adb926eeae2eca736816d2da5faa9b9bf07f793df51bbd4f70f7f1961b2d18e71a6db'
            '483b8db99aeb36050131cf3c947737cb1df2ab4d4ee4d89e07650b07782df4c12186dc547af03b03c4f2e1b826564d17d49ae92b7934dccc48a5705aa1ce73bb'
            '43cabb8ce4213e866977b9b292458e3bc031ce134144ca05d9855ffe4d3583e1a36f68ddf4efcc2881af74e569ee8c68ae56d5a83ef5e1fea65ab2bc705af455')

# You need to download the Humble Bundle installer file manually or with hib-dlagent.
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    cd "$srcdir/shovelknight"
    [ $CARCH == "x86" ]    && rm -r "64"
    [ $CARCH == "x86_64" ] && rm -r "32"
    mv "shovelknight" "start.sh"
    mv "softwarelicense.txt" ".."
    # The launcher expects the user to be in the game dir
    echo -e "#!/bin/sh\ncd /opt/${pkgname}\n./shovelknight/start.sh" > "${srcdir}/${pkgname}"
}

package() {
    cd "$srcdir"
    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/usr/bin/"
    cp -r "shovelknight/" "${pkgdir}/opt/${pkgname}/"
    install -Dm755 "shovelknight/start.sh" \
        "${pkgdir}/opt/${pkgname}/shovelknight/"

    # Desktop integration
    install -Dm 644 "${srcdir}/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/softwarelicense.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
