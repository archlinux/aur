# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=ki-desktop-wallet
pkgver=0.3.1
pkgrel=1
pkgdesc='Desktop wallet for the KiChain'
arch=('x86_64')
url='https://github.com/KiFoundation/ki-desktop-wallet'
license=('unknown')
depends=('electron')
makedepends=('npm')
source=(
    "https://github.com/KiFoundation/ki-desktop-wallet/archive/refs/tags/v$pkgver.tar.gz"
    'ki-desktop-wallet.desktop'
)
sha512sums=(
    '45b5ad18b39eb1c9714355d2bb8f675be4a0028eccd2838dc2660de05d5d942b3b27a14fccb6169ae190c52929eb802c5ebe38c8050680769ad348587bec6871'
    '8b541e90e6afb7e323c8a7aeb3b6289461a29c77d826cd15c2ff4e4987a50f007d65458f36f9d1d4e88c7f8401ad2704aa3d0df47223588aff26704e5a3b4462'
)

build() {
    cd $pkgname-$pkgver/app
    npm install --cache "${srcdir}/npm-cache"
    npm run build && cp -r dist/* ../

    cd ../
    npm install
    npm run package-linux
}

package() {
    install -Dm 644 $pkgname.desktop -t "$pkgdir/usr/share/applications"

    cd $pkgname-$pkgver
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/lib"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm 644 assets/icons/linux/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    mv release-builds/$pkgname-linux-x64/LICENSE "$pkgdir/usr/share/licenses/$pkgname"
    mv release-builds/$pkgname-linux-x64 "$pkgdir/usr/lib/$pkgname"
    ln -s "/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/bin/"
}
