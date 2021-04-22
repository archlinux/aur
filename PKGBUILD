# Maintainer: Vyacheslav Konovalov <crabvk@protonmail.com>

pkgname=nym
pkgver=0.10.0
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
    'fd8ffc5cda70a0768ff2f73bf4bbc2827282b0d111f5365bf699e5d5e5252adbe76dad6f31d866e6d9b3377d4ab7c1c2bc363671fec693629b56da0c1cdc76b8'
    '8bd62aa0ea25583e7b99ad57e306748772dac9dd04000f049a8471250bbb1f299ce63d6ab2b1dc8627d43d80ae27b4600726779c139c45b89c6364004d0771c5'
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
