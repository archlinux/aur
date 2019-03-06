# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=kitematic-git
pkgver=2275.3d40e133
pkgrel=1
pkgdesc='Visual Docker Container Management'
arch=('x86_64')
url='https://github.com/docker/kitematic'
license=('Apache')
depends=('docker' 'nodejs')
makedepends=('git' 'npm' 'nodejs-grunt')
conflicts=('kitematic')
source=("$pkgname::git+https://github.com/docker/kitematic.git" "${pkgname/\-git/}.desktop" "${pkgname/\-git/}.svg")
sha256sums=('SKIP'
            '5b1a905c36a22f454a483563bae8036822c35814e8de0d7816a56f3f6355be58'
            '32aafe8f1235a043094e031e9b1b978e26feeb0ebe8232d6269fcb53f1665706')

pkgver() {
    cd "$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$pkgname"
    npm install
    grunt babel less copy:dev shell:linux_npm electron-packager:build
}

package() {
    install -dm755 "$pkgdir"/{opt,usr/bin}
    install -Dm644 "${pkgname/\-git/}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname/\-git/}.svg"
    install -Dm644 "${pkgname/\-git/}.desktop" "$pkgdir/usr/share/applications/${pkgname/\-git/}.desktop"
    cp -R "$pkgname/dist/Kitematic-linux-x64/" "$pkgdir/opt/$pkgname"
    ln -s "/opt/$pkgname/Kitematic" "$pkgdir/usr/bin/kitematic"
}
