# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=nym
pkgver=0.10.1
pkgrel=1
pkgdesc='The next generation of privacy infrastructure (Nym mixnet)'
arch=('x86_64')
url='https://nymtech.net/'
license=('Apache' 'MIT' 'CC0')
depends=(openssl)
makedepends=(cargo)
source=(
    "https://github.com/nymtech/nym/archive/refs/tags/v$pkgver.tar.gz"
    'nym-mixnode@.service'
    'nym-mixnode.sysusers'
    'nym-mixnode.tmpfiles'
)
sha512sums=(
    '093e735309f9b4060a107e5c7af9320fd96fc0b962d48a98fc2f1397e7f56e59604dbdd6b7a666ce50ff086e26852bb410ddaa7d983714500feaedffc4947f63'
    'fddf30d28d01663f21f02df5f24e8679d2ed97e8862cab71d4f75b3d5ecb432f04f51d90c1bf433aabe725c158b46eb10eec6793c039160e5b8d1006e6cbe22d'
    '2887eeec8b805585822aa61a12f4995d3569a82a0c198409350c3b0f15abef522e48dde66b00233119d957b18e7ae95d7c9207a49eda1c763e497f2183e4ad02'
    '459e9fa6bc24675e4d7d2df448ea60ecb9ed0170f244a9659fb2811589bb6784b307475a4ee4d92c143ac3163446e603d60157b0f1f060d7aa0de96c51abc5d2'
)
install='nym.install'

build() {
    cd nym-$pkgver
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    install -Dm644 nym-mixnode@.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 nym-mixnode.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/nym-mixnode.conf"
    install -Dm644 nym-mixnode.sysusers "$pkgdir/usr/lib/sysusers.d/nym-mixnode.conf"

    cd nym-$pkgver
    install -Dm755 \
        target/release/nym-{client,gateway,mixnode,network-monitor,network-requester,socks5-client} -t "$pkgdir/usr/bin"
    install -Dm644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/nym"
}
