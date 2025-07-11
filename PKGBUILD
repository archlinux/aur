# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_tag=nym-binaries-v2025.12-dolcelatte
pkgname=nym
pkgver=2025.12
pkgrel=1
pkgdesc='The next generation of privacy infrastructure (Nym Mixnet)'
arch=('x86_64')
url='https://nym.com/'
license=('Apache-2.0' 'MIT' 'CC0')
depends=('openssl')
makedepends=('git' 'cargo' 'libgit2')
source=(
    'nym.sysusers'
    'nym.tmpfiles'
    'nym-mixnode@.service'
)
sha512sums=(
    '3646ee43df7904b959f50fcd191d1dfbdf8ed36f6d2cbe420669f4ffcc2886f0d30d5307a073462271ad40cbbf2b930ddd187852926271731beb57690a0abc81'
    '459e9fa6bc24675e4d7d2df448ea60ecb9ed0170f244a9659fb2811589bb6784b307475a4ee4d92c143ac3163446e603d60157b0f1f060d7aa0de96c51abc5d2'
    'c66f8c2c3de2b9c3e4b25500cec721a1879fd49ed3c3cd36f617d177ba927ab76ab0734bbb5e210a33d60b887b8a1eb7d675b899524188c7e336714369764003'
)
install='nym.install'

prepare() {
    # NOTE: Build process requires cloned git repo
    git clone https://github.com/nymtech/nym.git -b $_tag
    cd nym
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd nym

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --package 'nym-*'
}

package() {
    install -Dm644 nym.sysusers "$pkgdir/usr/lib/sysusers.d/nym-mixnode.conf"
    install -Dm644 nym.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/nym-mixnode.conf"
    install -Dm644 nym-mixnode@.service -t "$pkgdir/usr/lib/systemd/system"

    cd nym
    for file in $(find target/release -maxdepth 1 -name 'nym-*' -type f -executable); do
        install -Dm755 $file -t "$pkgdir/usr/bin"
    done
    install -Dm644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/nym"
}
