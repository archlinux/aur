# Maintainer: khvalera <khvalera@ukr.net>
pkgname=gsender
pkgver=1.4.7
pkgrel=1
pkgdesc="Connect to and control Grbl-based CNCs"
arch=("x86_64")
url="https://github.com/Sienci-Labs/${pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'yarn' 'libxcrypt-compat' 'debugedit')
source=("https://github.com/Sienci-Labs/${pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('a0124403d2ca23430e144a85ffb98fc9564f3ef8602e27b17213a5ef38360a2fb011db13623633197562145f95db5ffa139f20d04430fb03f94e9faae73ae654')

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
