# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Alessio Fachechi <alessio.fachechi@gmail.com>

pkgname=kitematic
pkgver=0.17.7
pkgrel=1
pkgdesc='Visual Docker Container Management'
arch=('x86_64')
url='https://github.com/docker/kitematic/'
license=('APACHE')
depends=('docker' 'nodejs' 'glib2' 'hicolor-icon-theme'
         'nss' 'libxss' 'libxtst' 'gtk2' 'gconf' 'alsa-lib')
makedepends=('git' 'npm' 'grunt-cli' 'python2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/docker/kitematic/archive/v${pkgver}.tar.gz"
        'kitematic.desktop'
        'kitematic.svg')
sha256sums=('79df036f85d753314a6c89496025b384e8220109aae7831b1797b1d24b342cb9'
            'acf85b7e6a94be11c482f6119dcea00cf828d9cd25e0bdea22b844fa5d4c01c0'
            '954d9803f49e475bc3242ad8b5dbfe5f3be9b532434ff260e1cf5c929f018617')

build() {
    cd "${pkgname}-${pkgver}"
    
    npm install
    
    grunt babel less copy:dev shell:linux_npm electron-packager:build
}

package() {
    cd "${pkgname}-${pkgver}"
    
    install -d -m755 "$pkgdir"/{opt,usr/bin}
    
    # install files
    cp -a dist/Kitematic-linux-x64/ "${pkgdir}/opt/kitematic"
    
    # create symlink for binary
    ln -s ../../opt/kitematic/Kitematic "${pkgdir}/usr/bin/kitematic"
    
    # desktop file and icon
    cd "$srcdir"
    install -D -m644 'kitematic.desktop' -t "${pkgdir}/usr/share/applications"
    install -D -m644 'kitematic.svg'     -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
