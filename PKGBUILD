# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

pkgname=inadyn
pkgver=2.9.1
pkgrel=2
pkgdesc='Dynamic DNS client with SSL/TLS support'
arch=('x86_64')
url=https://troglobit.com/projects/inadyn/
license=('GPL')
depends=('ca-certificates' 'confuse' 'openssl')
replaces=("$pkgname-fork")
backup=("etc/$pkgname.conf")
source=("https://github.com/troglobit/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        'override.conf'
        "$pkgname.sysusers.conf"
        "$pkgname.tmpfiles")
sha256sums=('0094d20cfcd431674b8d658e93169c7589bf8f2b351b2860818a1ca05f0218c5'
            'a44fa6cc87969de84acb5c7103db8753625a2da60cb78e4b3df887b0f5d8f5a6'
            'a79bbc550c9b2e11197b9b5ee2e6fbc7ec890ad037b1808c29c48c037c26b4f9'
            'bab6aa57251771ca6cc3d4efc02f7c3f0e3cf949ea6cf2066345d3ca8772c0fc')
b2sums=('23ae5df1ddcb92a995597f1d8deb4ae1896c8ca3e4c84d49964c747f96cd3a4db1f4f71721d25be0a478d1b0f9f82cd4985b3e4c91717015e249c97e1171e8db'
        'b8a100c6a219e0888018fece11f3737137fa6fef54ed5f60d383794aa54b66dc49212573ef9e2231a3fb957c0e9c572b2ad0d7602904eb3e431c06178c5a00c2'
        '2e0cc165f5e6c94ded73cfdf019db735dac227a89033d370c89cdf926a8eb3851c938fd11acc0d7b5ab1bd7122b0c5fb9ca0cc00fe4dce9b915a530e2c0a1a5a'
        'cfc346bb059be3ed8e8b50161a66b4d2ade3e1431d89f00498d60608768399d8121f2e00fa3269b6b45995bd41c728ff5af85dba020421ab3b65cd9060c38f77')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --enable-openssl
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm600 -t "$pkgdir"/etc examples/$pkgname.conf
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system $pkgname.service
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/$pkgname.service.d \
    ../override.conf
  install -Dm644 ../$pkgname.sysusers.conf \
    "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 ../$pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  make DESTDIR="$pkgdir" install-strip
}

