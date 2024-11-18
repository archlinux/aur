# Maintainer: Jake <aur@ja-ke.tech>
pkgname=cncjs
pkgver=1.10.5
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
sha512sums=('6ad4cce761ba27a2bf33600712439264b21177828d9cb97b63cdb96904a757f9d5279bb0a37d32b46417187779c0a72d2dcd9d65d11803a416c05f98e4e7d9f7'
            'be578e3ac698fbd4ad6d786ebea22f330b1e22f1f96e7e22ce561fe3d8cb283db724e0dcc96042f9fe9aeb75e41bcb7a011bc88c3ecbcb765fc07e673ce9231d'
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
