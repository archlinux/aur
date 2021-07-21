# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=nym
pkgver=0.11.0
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
    'b7024b3205498e07efa845edca23e0b0c7b48d660481a92dee56feb079a6cd293594ce73663a7ebbab69bc2986c7411e7f22112dd2157fafebdf5e7276a27b68'
    'c94db5a3cd24a16ace6112c80970bb74dfaf1a3ab64c545e2497c561dc823024b85c9fc9261fc85bdcb55deb712968afeef029fb40d30c01e414540ca280d074'
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
        target/release/nym-{client,gateway,mixnode,network-requester,socks5-client} -t "$pkgdir/usr/bin"
    install -Dm644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/nym"
}
