# Maintainer: khvalera <khvalera@ukr.net>
pkgname=gsender
pkgver=1.5.6
pkgrel=1
pkgdesc="Connect to and control Grbl-based CNCs"
arch=("x86_64")
url="https://github.com/Sienci-Labs/${pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'yarn' 'libxcrypt-compat' 'debugedit' 'node-gyp')
source=("https://github.com/Sienci-Labs/${pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('820e429877c91ee8a013278997d962ee7d838509649e667ee9ec9fe79bf8037df31167af8d35bc25e4a45c2d0ebc21dc9ceecb7a38693c3ed5db6d5b9245accf')

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
