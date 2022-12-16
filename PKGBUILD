# Maintainer: Ryan Hedgecock <rhedgeco@gmail.com>
pkgname='tksync'
pkgver='0.1.1'
pkgrel='1'
pkgdesc='Unofficial tool for downloading fonts from Adobe Typekit.'
url='https://github.com/rhedgeco/tksync'
source=("$pkgname-$pkgver.tar.gz::https://github.com/rhedgeco/tksync/archive/refs/tags/$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
depends=('rust')
sha256sums=('bc2c99c03cede2e9b0577d75bfe8ecb94d68fc4b4a018b1dc986697319366536')

build () {
    cd "$srcdir/$pkgname-$pkgver"

    if pacman -T pacman-git > /dev/null; then
        _features+="git,"
    fi

    if [[ $CARCH != x86_64 ]]; then
        export CARGO_PROFILE_RELEASE_LTO=off
    fi

    cargo build --locked --release --target-dir target
}

package () {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 target/release/tksync "${pkgdir}/usr/bin/tksync"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" README*
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
