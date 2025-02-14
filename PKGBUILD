# Maintainer: khvalera <khvalera@ukr.net>
pkgname=gsender
pkgver=1.4.11
pkgrel=1
pkgdesc="Connect to and control Grbl-based CNCs"
arch=("x86_64")
url="https://github.com/Sienci-Labs/${pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'yarn' 'libxcrypt-compat' 'debugedit' 'node-gyp')
source=("https://github.com/Sienci-Labs/${pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('c6216fb068b1ebd344688718cae228ffb6eb9e62d319ece464e0850d3877e0b6a696a82bb84be06428d0889ad1249f462e66904d55d93c07b1b638ca32f05065')

build() {
    cd "$pkgname-$pkgver"
    #sed -i 's/"AppImage",//' package.json
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
