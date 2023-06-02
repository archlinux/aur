# Maintainer: Jake <aur@ja-ke.tech>
pkgname=cncjs
pkgver=1.10.2
pkgrel=1
pkgdesc="Web-based interface for CNC controllers running Grbl, Marlin, Smoothieware, or TinyG."
arch=("x86_64")
url="https://github.com/cncjs/cncjs"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'yarn')
source=("https://github.com/cncjs/cncjs/archive/v$pkgver.tar.gz"
        "$pkgname"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha512sums=('16cbb2f5015f8b0177dec3024d8d408a8950c63b96b0ed21ef4962d2aac893ff820282423544f3d983dc59030c2a8a095a4e5d34caccf14a232b7bf50bc2e098'
            '78acdda201754de9965671f0c48989521e0bf626c9eb9c4c99b88a446385797e74c6996499ccc5a2a6c40579cad191ffbab557eb114b51449bb2b9a644f05d07'
            'c5407c67d67f6c6e4ba7fc66e610866906745d59b23644951daa886ed0f15f2ed2f2402b72e6c1eaa5685865c3e6c390f6d574a8446bc6c8c705cdafe97e448f'
            '57e51ae453f613b452a8f56ae3a48e1f68e13ef0154f6ce26ffdefed959a20935155472aa417a2ea358068ed5eed922dbb1ecdad2fcee398c0723dc7de19a50d'
            '1eb1c082718cc3b99d37682017f02d57f965a63205c4ea86c204b019002a9e022fab4e7ea259a626d162d8215d76c48bbfaa7f6ad6a8ee8261a88caf4ac4bb09')

build() {
    cd "$pkgname-$pkgver"
    export NODE_OPTIONS=--openssl-legacy-provider
    yarn install
    yarn build-prod

    cd dist/cncjs/
    touch yarn.lock
    yarn install
}

package() {
    install -Dm 755 "${srcdir}/$pkgname" "${pkgdir}/usr/bin/$pkgname"
    
    install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
    install -Dm644 $pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
    install -Dm644 $pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf
    
    cd "$pkgname-$pkgver"
    cp -r dist/cncjs/ "${pkgdir}/usr/lib/"
}
