# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=nym
pkgver=0.12.0
pkgrel=1
pkgdesc='The next generation of privacy infrastructure (Nym mixnet)'
arch=('x86_64')
url='https://nymtech.net/'
license=('Apache' 'MIT' 'CC0')
depends=(openssl)
makedepends=(git cargo)
source=(
    # Build process requires git repo
    "git+https://github.com/nymtech/nym#tag=v$pkgver"
    'nym.sysusers'
    'nym.tmpfiles'
    'nym-mixnode@.service'
    'nym-gateway@.service'
)
sha512sums=(
    'SKIP'
    '3646ee43df7904b959f50fcd191d1dfbdf8ed36f6d2cbe420669f4ffcc2886f0d30d5307a073462271ad40cbbf2b930ddd187852926271731beb57690a0abc81'
    '459e9fa6bc24675e4d7d2df448ea60ecb9ed0170f244a9659fb2811589bb6784b307475a4ee4d92c143ac3163446e603d60157b0f1f060d7aa0de96c51abc5d2'
    '0b7848cf0f769f2bae114999785d9f9618dffb69ae615cb19167475eaddc5bf936f28e78eb0c8d2a67fcaf3d2664de864d35ffd0a317d943dbfa086c8bfa35aa'
    '5e493343bbbb7728913a60b4bf6a6e3d45392ce027035d9e2e2fba6dc2c9d79cb640409bd11828b0261bda80cc51700b0d968cd8323c53b66fc3e1c9cc919b2f'
)
install='nym.install'

build() {
    cd nym
    # Temporary remove --all-features flag because of error
    # https://t.me/nymchan_help_chat/42601
    cargo build --release --locked --target-dir=target
}

package() {
    install -Dm644 nym.sysusers "$pkgdir/usr/lib/sysusers.d/nym-mixnode.conf"
    install -Dm644 nym.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/nym-mixnode.conf"
    install -Dm644 nym-{mixnode,gateway}@.service -t "$pkgdir/usr/lib/systemd/system"

    cd nym
    install -Dm755 \
        target/release/nym-{client,gateway,mixnode,network-requester,socks5-client} \
        -t "$pkgdir/usr/bin"
    install -Dm644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/nym"
}
