# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=nym
pkgver=1.1.4
pkgrel=1
pkgdesc='The next generation of privacy infrastructure (Nym Mixnet)'
arch=('x86_64')
url='https://nymtech.net/'
license=('Apache-2.0' 'MIT' 'CC0')
depends=('openssl')
makedepends=('git' 'cargo')
source=(
    'nym.sysusers'
    'nym.tmpfiles'
    'nym-mixnode@.service'
    'nym-gateway@.service'
)
sha512sums=(
    '3646ee43df7904b959f50fcd191d1dfbdf8ed36f6d2cbe420669f4ffcc2886f0d30d5307a073462271ad40cbbf2b930ddd187852926271731beb57690a0abc81'
    '459e9fa6bc24675e4d7d2df448ea60ecb9ed0170f244a9659fb2811589bb6784b307475a4ee4d92c143ac3163446e603d60157b0f1f060d7aa0de96c51abc5d2'
    '7aec10201cf8d51eaf9078911db44a3ec1206f26d45dd4cfbf6213c890c6be295d03707692c33de21dc5e876bfd6c6c9daf5225c5ed55b017085506e041f1b29'
    '9a1d9939b7fa0e4fb50e24c917565081be017466d65bf008ef8598076f2ec450b08bf25dee1d853187a8d488e6a0fa91769519d740a8e532cdca0692fb2e42c8'
)
install='nym.install'

prepare() {
    # NOTE: Build process requires cloned git repo
    git clone https://github.com/nymtech/nym.git -b nym-binaries-v$pkgver
    cd nym
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd nym

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --package 'nym-*'
}

package() {
    install -Dm644 nym.sysusers "$pkgdir/usr/lib/sysusers.d/nym-mixnode.conf"
    install -Dm644 nym.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/nym-mixnode.conf"
    install -Dm644 nym-{mixnode,gateway}@.service -t "$pkgdir/usr/lib/systemd/system"

    cd nym
    for file in $(find target/release -maxdepth 1 -name 'nym-*' -type f -executable); do
        install -Dm755 $file -t "$pkgdir/usr/bin"
    done
    install -Dm644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/nym"
}
