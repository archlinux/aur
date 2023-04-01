# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=openethereum
pkgver=3.3.5
_commit=6c2d392d867b058ff867c4373e40850ca3f96969
pkgrel=2
pkgdesc='Fast and feature-rich multi-network Ethereum client'
arch=('x86_64')
url='https://parity.io/ethereum'
license=('GPL3')
depends=('gcc-libs')
makedepends=('clang' 'cmake' 'git' 'rust')
provides=('parity' 'parity-ethereum')
conflicts=('parity' 'parity-ethereum')
replaces=('parity' 'parity-ethereum')
backup=('etc/openethereum/config.toml')
options=('!lto')
source=("git+https://github.com/openethereum/openethereum.git#commit=${_commit}"
        'config.toml'
        'openethereum-system.service'
        'openethereum-user.service')
sha256sums=('SKIP'
            '03f0e3a001927cdd25cf12956e8e3a13bd55bad937a9f2509ccbc1fc58f10899'
            'dca7c5e537d29c27f83ddbe4483cbadaff7835afc14ce0d11872fbfb03f23298'
            '4bbad4dc416759013e91edcb3acdc9a1c656f0b47e2c6c8fa9a0e3a354846a0b')

build() {
    cd ${pkgname}

    cargo build --release --features final
    cargo build --release -p evmbin
    cargo build --release -p ethstore-cli
    cargo build --release -p ethkey-cli
}

package() {
    cd ${pkgname}

    install -Dm755 -t "${pkgdir}"/usr/bin \
        target/release/{ethstore,openethereum,openethereum-evm}
    install -Dm755 target/release/ethkey "${pkgdir}"/usr/bin/openethereum-ethkey
    for type in system user; do
        install -Dm644 ../openethereum-${type}.service \
            "${pkgdir}/usr/lib/systemd/${type}/openethereum.service"
    done
    install -Dm644 -t "${pkgdir}/etc/openethereum" ../config.toml
}
