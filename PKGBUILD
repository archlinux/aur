# Maintainer: Jake <aur@ja-ke.tech>
pkgname=cncjs
pkgver=1.9.15
pkgrel=3
pkgdesc="Web-based interface for CNC controllers running Grbl, Marlin, Smoothieware, or TinyG."
arch=("x86_64")
url="https://github.com/cncjs/cncjs"
license=('MIT')
depends=('nodejs')
makedepends=('yarn')
install="$pkgname.install"
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname"
        "$pkgname.service"
        "$pkgname.sysusers")
sha512sums=('03dba4ea59e518d051878afae8695e694d6dc8ce628484d401a479cf9a2ee7af1e501e0d202004258183626b9b1ddadc0b5b1f2fb9bc4466b2331b85176c40ff'
            'cf883eda1afc89fb4d994da8a3ac7b1fdcf7bfbaded163d87b68ccca141c6077b4b8bb107f0379f3ed16ea840a94d5666bc04f163ee2cc3ad5bc457228d0b9a5'
            'c5407c67d67f6c6e4ba7fc66e610866906745d59b23644951daa886ed0f15f2ed2f2402b72e6c1eaa5685865c3e6c390f6d574a8446bc6c8c705cdafe97e448f'
            'c9fa18908782b5e973e832f86cf00839389521ad695af35caed7446b9606600f72d05017a8db608d1b9140b6e6f7fd54944c4fe6476e4856b3d7b41d4423e904')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i "s#./sessions#/tmp/sessions#" src/app/app.js # Fix issues/319
}

build() {
	cd "$pkgname-$pkgver"
	yarn install
	cd dist/cnc/
	yarn install
}

package() {
        install -Dm 755 "${srcdir}/$pkgname" "${pkgdir}/usr/bin/$pkgname"
        
        install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
        install -Dm644 $pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
        
        install -d -m755 "${pkgdir}/etc/$pkgname/"
        
        cd "$pkgname-$pkgver"
        install -d "${pkgdir}/usr/lib/"
        cp -r dist/cnc/ "${pkgdir}/usr/lib/$pkgname/"
}
