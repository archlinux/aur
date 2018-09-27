# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Alessio Fachechi <alessio.fachechi@gmail.com>

# fix segmentation fault
_commit='26abc33e61fd1535762c1813d9130e55789dbe85'

pkgname=kitematic
pkgver=0.17.3+10+g26abc33e
pkgrel=1
pkgdesc='Visual Docker Container Management'
arch=('x86_64')
url='https://github.com/docker/kitematic/'
license=('APACHE')
depends=('docker' 'nodejs-lts-carbon' 'glib2' 'hicolor-icon-theme')
makedepends=('git' 'npm' 'grunt-cli') # needed for next version: 'typescript' 'tslint'
source=("$pkgname::git+https://github.com/docker/kitematic.git#commit=${_commit}"
        'kitematic.desktop'
        'kitematic.svg')
sha256sums=('SKIP'
            'acf85b7e6a94be11c482f6119dcea00cf828d9cd25e0bdea22b844fa5d4c01c0'
            '954d9803f49e475bc3242ad8b5dbfe5f3be9b532434ff260e1cf5c929f018617')

pkgver() {
    cd "$pkgname"
    
    git describe --long --tags | sed 's/^v//;s/-/+/g'
}

build() {
    cd "$pkgname"
    
    npm install
    
    grunt babel less copy:dev shell:linux_npm electron-packager:build
}

package() {
    cd "$pkgname"
    
    install -d -m755 "$pkgdir"/{opt,usr/bin}
    
    # install files
    cp -aR dist/Kitematic-linux-x64/ "${pkgdir}/opt/kitematic"
    
    # create symlink for binary
    ln -s ../../opt/kitematic/Kitematic "${pkgdir}/usr/bin/kitematic"
    
    # desktop file and icon
    cd "$srcdir"
    install -D -m644 'kitematic.desktop' -t "${pkgdir}/usr/share/applications"
    install -D -m644 'kitematic.svg'     -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
