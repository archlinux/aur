# Maintainer: LeSnake <dev.lesnake@posteo.de>
# Contributor: C0rn3j <spleefer90@gmail.com>
# Contributor: Colin Berry <colinb969@gmail.com>

pkgname=flashpoint-launcher-git
pkgver=10.0.0.e1b46166
pkgrel=2
pkgdesc="Launcher for BlueMaxima's Flashpoint - Does not include data files! - Launcher software only."
arch=('x86_64')
url="https://github.com/FlashpointProject/launcher"
license=('MIT')
depends=('nss>=3.0'
         'php'
         'gtk3'
         'libxss'
         'wine')
optdepends=('flashplayer-standalone: native Flash support')
makedepends=('npm')
conflicts=('flashpoint-bin')
source=("${pkgname}"::"git+https://github.com/FlashpointProject/launcher.git"
            "flashpoint.desktop"::"https://aur.archlinux.org/cgit/aur.git/plain/flashpoint.desktop?h=flashpoint-launcher-git")
sha256sums=('SKIP'
                     '2d9bc6f82f37d32267dbdde2778a626839b9936f75b711cd07bb79c477ceb0b8')
pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "10.0.0.$(git rev-parse --short HEAD)"
}

build(){
    cd "${srcdir}/${pkgname}"
    npm install
    npm run release:linux
    rm ./dist/Flashpoint-*_linux-x64.7z
}

package(){
    # Application
    mkdir -p $pkgdir/opt/flashpoint $pkgdir/usr/share/pixmaps/
    cp -R $srcdir/$pkgname/dist/* "$pkgdir/opt/flashpoint"
    cp $srcdir/$pkgname/icons/icon.png "$pkgdir/usr/share/pixmaps/flashpoint.png"
    
    # Symlink to binary (WIP)
    #ln -sf /opt/flashpoint/linux-unpacked/flashpoint-launcher $pkgdir/usr/bin/flashpoint-launcher

    # Desktop Entry
    install -Dm644 ${srcdir}/flashpoint.desktop "$pkgdir/usr/share/applications/flashpoint.desktop"

    # License
    install -Dm644 $srcdir/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
