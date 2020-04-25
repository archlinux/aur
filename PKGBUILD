# Copy and adapted
# from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=beaker-browser-bin 
# and from https://beakerbrowser.com/install/
# and from https://github.com/beakerbrowser/beaker/blob/master/package.json

pkgname=beaker-browser-git
pkgver=0.8.10.r2.g54651db80
pkgrel=1
pkgdesc="Peer-to-peer browser with tools to create and host websites"
arch=('x86_64')
url="https://beakerbrowser.com/"
license=('Modified MIT License (MIT)')
conflicts=('beaker')
provides=('beaker')
depends=('gtk3' 'libsodium' 'libxss' 'nss')
makedepends=('git' 'nodejs' 'jq' 'yarn' 'libtool' 'm4' 'make' 'gcc')
backup=()

options=(!strip)
source=("beaker-browser-git::git://github.com/beakerbrowser/beaker.git"
        "beaker-browser.desktop"
        "beaker-browser")
md5sums=('SKIP'
         '34b48b022c6c71212f0adb3981f2925d'
         '09aa78a4ebb98e0c71aeaaf46fd6b11b')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {    
    cd ${srcdir}/${pkgname}
    npm install
    npm run rebuild #see https://github.com/electron/electron/issues/5851
    npm run release

    for icon in '1024x1024' '16x16' '256x256' '48x48' '64x64' '128x128' '24x24' '32x32' '512x512' '96x96'
    do
        mkdir -p hicolor/${icon}/apps/
        cp build/icons/${icon}.png hicolor/${icon}/apps/beaker-browser.png
    done
    
}

package() {
    ### builded
    install -d          ${pkgdir}/opt/beaker-browser
    cp -r               ${srcdir}/${pkgname}/dist/linux-unpacked/*      ${pkgdir}/opt/beaker-browser/

    ### tools
    install -Dm644      ${srcdir}/beaker-browser.desktop                ${pkgdir}/usr/share/applications/beaker-browser.desktop
    install -Dm755      ${srcdir}/beaker-browser                        ${pkgdir}/usr/bin/beaker-browser

    ### icons
    install -d          ${pkgdir}/usr/share/icons/hicolor    
    cp -r               ${srcdir}/${pkgname}/hicolor                               ${pkgdir}/usr/share/icons/
}
