# Maintainer: khvalera <khvalera@ukr.net>
pkgname=gsender
pkgver=1.2.2
pkgrel=1
pkgdesc="Connect to and control Grbl-based CNCs"
arch=("x86_64")
url="https://github.com/Sienci-Labs/${pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'yarn' 'libxcrypt-compat')
source=("https://github.com/Sienci-Labs/${pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('c4e07887825dda4b4d4a289ee6551c1d80026fa0ddc2f45b9312dce241fee0273ee6ac49a31a378e6f29d3189a2f2caad1b30cbcc9ea49e6ff4ddef8a80317e2')

build() {
    cd "$pkgname-$pkgver"
    sed -i 's/"AppImage",//' package.json
    export NODE_OPTIONS=--openssl-legacy-provider
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
    ar -p ./output/gSender_1.2.2_amd64.deb data.tar.xz | tar Jx -C .
    cp -dr --no-preserve=ownership ./usr "${pkgdir}"/
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
