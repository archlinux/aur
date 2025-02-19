# Maintainer: Neboer <rubinposter@gmail.com>
pkgname=baibot-git
pkgver=1.4.1+6+g45a2d96
pkgrel=1
pkgdesc="Baibot - Matrix AI Chatbot"
arch=('x86_64')
url="https://github.com/etkecc/baibot"
license=('MIT')
depends=('openssl' 'sqlite')
makedepends=('rust' 'pkgconf')
options=("!lto")
install="baibot.install"
source=("git+https://github.com/etkecc/baibot.git"
        "baibot.install"
        "baibot.tmpfiles"
        "baibot.sysusers"
        "baibot.service")
sha256sums=('SKIP'
            '40785e3b129ef1ac793c973018cad12bafd212cb5434f60a8ecf80114bfc7a4c'
            '4068016b826f1fa2783a240689a374a889ea477dc9e92fc26298c250e2f1605b'
            'c4d8314216b3430b514f009204e381004a8a7713d0b8b3c559c88c3cc0afe400'
            '21b014f6648c75b40f662657b330c3d6523da94e057b6c51d8106d0c8d4bf2f2')

pkgver() {
    cd "$srcdir/baibot"
    local v
    v="$(git describe --tags)"
    v="${v#v}"
    printf %s "${v//-/+}"
}

build() {
    cd "$srcdir/baibot"
    
    # Build in release mode
    cargo build --release
}

package() {
    cd "$srcdir/baibot"
    
    # Install the binary
    install -Dm755 "target/release/baibot" "$pkgdir/usr/bin/baibot"

    # Install the LICENSE and README
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/baibot/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/baibot/README.md"
    
    # Install the configuration file
    install -Dm644 etc/app/config.yml.dist "$pkgdir/etc/baibot/config.yml"
 
    # Install User, Service, and tmpfiles
    install -Dm644 "$srcdir/baibot.sysusers" "$pkgdir/usr/lib/sysusers.d/baibot.conf"
    install -Dm644 "$srcdir/baibot.service" "$pkgdir/usr/lib/systemd/system/baibot.service"
    install -Dm644 "$srcdir/baibot.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/baibot.conf"
}

