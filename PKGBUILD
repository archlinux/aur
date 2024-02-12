# Maintainer: khvalera <khvalera@ukr.net>
pkgname=gsender
pkgver=1.4.1
pkgrel=1
pkgdesc="Connect to and control Grbl-based CNCs"
arch=("x86_64")
url="https://github.com/Sienci-Labs/${pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'yarn' 'libxcrypt-compat' 'debugedit')
source=("https://github.com/Sienci-Labs/${pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('277de6392bcad87968dd8b28b7812f001a2423f630becda8fcc70d070d7d980fd0f43fa308bae754d1af585af4181e868d0e92a141aea688a72ac4b6c8a4bd3c')

build() {
    cd "$pkgname-$pkgver"
    sed -i 's/"AppImage",//' package.json
    export NODE_OPTIONS="--openssl-legacy-provider --max-old-space-size=4096"
    yarn install
    yarn build-prod
    yarn build:linux-x64
}

package() {
    cd "$pkgname-$pkgver"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/gSender"
    cp -dr --no-preserve=ownership ./output/linux-unpacked/* "${pkgdir}"/opt/gSender/
    ln -sf '/opt/gSender/gsender' "${pkgdir}/usr/bin/gsender"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
