# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Alessio Fachechi <alessio.fachechi@gmail.com>

pkgname=kitematic
pkgver=0.17.13
pkgrel=2
pkgdesc='Visual Docker Container Management'
arch=('x86_64')
url='https://github.com/docker/kitematic/'
license=('Apache')
depends=('docker' 'gtk3' 'nodejs' 'nss' 'libxss' 'hicolor-icon-theme')
makedepends=('git' 'npm' 'grunt-cli')
source=("https://github.com/docker/kitematic/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'kitematic.desktop'
        'kitematic.svg')
sha256sums=('fb22f98bb775ccb42ba29b3432b14cb5bae9cc1f1fb816990d73cf6d609f05da'
            'acf85b7e6a94be11c482f6119dcea00cf828d9cd25e0bdea22b844fa5d4c01c0'
            '954d9803f49e475bc3242ad8b5dbfe5f3be9b532434ff260e1cf5c929f018617')

build() {
    cd "${pkgname}-${pkgver}"
    npm install
    grunt babel less copy:dev shell:linux_npm electron-packager:build
}

package() {
    install -d -m755 "$pkgdir"/{opt,usr/bin}
    
    # install files
    cp -a "${pkgname}-${pkgver}/dist/Kitematic-linux-x64/" "${pkgdir}/opt/kitematic"
    
    # create symlink for binary
    ln -s ../../opt/kitematic/Kitematic "${pkgdir}/usr/bin/kitematic"
    
    # desktop file and icons
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -D -m644 kitematic.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 kitematic.svg     -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    ln -s ../../../../../../opt/kitematic/resources/app/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kitematic.png"
}
