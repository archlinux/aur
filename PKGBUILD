# Maintainer: leaty <dev@leaty.net>
_pkgname=tuxtrain
pkgname=$_pkgname-git
pkgver=0.0.4.r19.ga9207bb
pkgrel=1
pkgdesc='An easy-to-use generic trainer for Linux'
url='https://github.com/leaty/tuxtrain'
arch=(x86_64)
license=(MIT)
install=.INSTALL
provides=(tuxtrain=${pkgver%%.r*})
conflicts=(tuxtrain)
makedepends=(git rust cargo)
source=($_pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
    cd $_pkgname

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd $_pkgname

    install -Dm755 target/release/tuxtrain "$pkgdir/usr/bin/tuxtrain"
    install -Dm755 target/release/tuxtraind "$pkgdir/usr/bin/tuxtraind"
    install -Dm644 tuxtraind.service "$pkgdir/usr/lib/systemd/system/tuxtraind.service"
    install -dm755 "$pkgdir/usr/share/$_pkgname"
    install -m644 trainers/* "$pkgdir/usr/share/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 example.png "$pkgdir/usr/share/doc/$_pkgname/example.png"
}
