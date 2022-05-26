
pkgname=privaxy
pkgver=0.1.0
pkgrel=1
pkgdesc='Privaxy is the next generation tracker and advertisement blocker. It blocks ads and trackers by MITMing HTTP(s) traffic.'
arch=('x86_64')
url="https://github.com/Barre/privaxy"
license=('AGPL')
makedepends=('trunk' 'nodejs' 'rustup')
source=(
    "https://github.com/Barre/privaxy/archive/v$pkgver.tar.gz"
    "$pkgname.tmpfiles"
    "$pkgname.service"
    "$pkgname.sysusers.conf"
)
sha256sums=(
'b8d10fc88bbd21889015974ff2528ffae4938eee2355180c34edeb2ff0c82379'
            'ba367fc62b311ad4a7022c5452981836672db70d5c3edc0620f842cc8ca80497'
            'acda4febbb8244c9834079ee87016bab723332bc093adbdf192646ee7eb7c002'
            '2a02713029de78f7c23a654a223a0597780e05cdd510a1da7854283b5f678b16'
)
install=$pkgname.install

prepare () {
    rustup default stable 
    rustup target add wasm32-unknown-unknown

    cd $srcdir/privaxy-$pkgver/privaxy
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build () {
    cd $srcdir/privaxy-$pkgver/web_frontend
    npm --cache "${srcdir}/npm-cache" install
    # npx tailwindcss build -i src/tailwind.css -o dist/tailwind.css
    trunk build --release

    cd $srcdir/privaxy-$pkgver/privaxy
    cargo build --release  --frozen --bin privaxy
}


package () {
    cd "$srcdir"
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system $pkgname.service
    install -Dm644 $pkgname.sysusers.conf "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
    install -Dm644 $pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
    
    cd "$srcdir/privaxy-$pkgver"
    install -Dt "$pkgdir"/usr/bin target/release/$pkgname

}
