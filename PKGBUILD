# Original Author: Nicola Squartini <tensor5@gmail.com>
# Maintainer: Eric Toombs <ee double you toombs at you waterloo dot see eh?>

pkgname='parity-stable'
_upstreamname='parity'
pkgver=1.7.11
pkgrel=1
pkgdesc='Fast, light, robust Ethereum implementation—stable version.'
arch=('x86_64')
url='https://parity.io/'
license=('GPL3')
depends=('libsystemd' 'openssl')
makedepends=('git' 'rust' 'systemd')
source=("git+https://github.com/paritytech/parity.git#tag=v$pkgver"
        'parity.service')
sha256sums=('SKIP'
        '2b3714df9417fa11b7636114b8a5f126c2f6fd3934e74d81bdc85061e8d6e737')

build() {
    cd "$_upstreamname"

    cargo build --release --features final
    cargo build --release -p evmbin
    cargo build --release -p ethstore-cli
    cargo build --release -p ethkey-cli
}

package() {
    cd "$_upstreamname"

    install -Dm755 -t "$pkgdir"/usr/bin \
        target/release/{ethkey,ethstore,parity,parity-evm}
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/user ../parity.service
}
