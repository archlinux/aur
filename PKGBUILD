# Maintainer: Sandwich <sandwich at archworks dot co>

pkgname=baibot
pkgver=1.4.1
pkgrel=0
pkgdesc="Baibot - Matrix AI Chatbot"
arch=('x86_64')
url="https://github.com/etkecc/baibot"
license=('MIT')
depends=('openssl' 'sqlite')
makedepends=('rust' 'pkgconf')
options=("!lto")
install="$pkgname.install"
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/etkecc/baibot/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.install"
    "$pkgname.tmpfiles"
    "$pkgname.sysusers"
    "$pkgname.service"
)
sha256sums=('a8f556d4c7d5fbceaff3c90204adf1c1221caf1953058c4cc7f2ff55f99dfdeb'
            '40785e3b129ef1ac793c973018cad12bafd212cb5434f60a8ecf80114bfc7a4c'
            '4068016b826f1fa2783a240689a374a889ea477dc9e92fc26298c250e2f1605b'
            'c4d8314216b3430b514f009204e381004a8a7713d0b8b3c559c88c3cc0afe400'
            '21b014f6648c75b40f662657b330c3d6523da94e057b6c51d8106d0c8d4bf2f2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
     
    # Build in release mode
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install the binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install the LICENSE and README
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    

    # Install the configuration file
    install -Dm644 etc/app/config.yml.dist "$pkgdir/etc/$pkgname/config.yml"
 
    # Install User, Service, and tmpfiles
    install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
