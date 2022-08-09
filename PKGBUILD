# Maintainer: Jake <aur@ja-ke.tech>
pkgname=cncjs
pkgver=1.9.26
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
sha512sums=('d356f14cd9a720888685218063a5cd4bb16898ba679abeafb0a4cab591165a83eebad4e66fda12646a66706be0477c4641abbd28447a524fd894704f9e1b0828'
            '59544b292cc43f7d7dd89758c5b2b59dd5bfb4a258e3011ce896429d92e9ee72c498cee6492888653564a64764e346d2e9b6cc4a55de5e2f943ad7272982b2bd'
            'c5407c67d67f6c6e4ba7fc66e610866906745d59b23644951daa886ed0f15f2ed2f2402b72e6c1eaa5685865c3e6c390f6d574a8446bc6c8c705cdafe97e448f'
            '57e51ae453f613b452a8f56ae3a48e1f68e13ef0154f6ce26ffdefed959a20935155472aa417a2ea358068ed5eed922dbb1ecdad2fcee398c0723dc7de19a50d'
            '1eb1c082718cc3b99d37682017f02d57f965a63205c4ea86c204b019002a9e022fab4e7ea259a626d162d8215d76c48bbfaa7f6ad6a8ee8261a88caf4ac4bb09')

build() {
    cd "$pkgname-$pkgver"
    yarn install
    yarn build-prod

    cd dist/cncjs/
    yarn install
}

package() {
    install -Dm 755 "${srcdir}/$pkgname" "${pkgdir}/usr/bin/$pkgname"
    
    install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
    install -Dm644 $pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
    install -Dm644 $pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf
    
    cd "$pkgname-$pkgver"
    install -d "${pkgdir}/usr/lib/$pkgname/"
    cp -r bin dist "${pkgdir}/usr/lib/$pkgname/"
}
