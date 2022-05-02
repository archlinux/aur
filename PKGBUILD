# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

pkgname=inadyn
pkgver=2.9.1
pkgrel=3
pkgdesc='Dynamic DNS client with SSL/TLS support'
arch=('x86_64')
url=https://troglobit.com/projects/inadyn/
license=('GPL')
depends=('ca-certificates' 'confuse' 'openssl')
replaces=("$pkgname-fork")
backup=("etc/$pkgname.conf" "etc/default/$pkgname")
source=("https://github.com/troglobit/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        'override.conf'
        "$pkgname.env"
        "$pkgname.sysusers.conf"
        "$pkgname.tmpfiles")
sha256sums=('0094d20cfcd431674b8d658e93169c7589bf8f2b351b2860818a1ca05f0218c5'
            'a44fa6cc87969de84acb5c7103db8753625a2da60cb78e4b3df887b0f5d8f5a6'
            '4c9420baaaaca6f76339b898b7a875824887127e6a76649f660cb09cfd3febe6'
            'a79bbc550c9b2e11197b9b5ee2e6fbc7ec890ad037b1808c29c48c037c26b4f9'
            'b4be5301b31c99e257c50993ad945c46f74bb347b0d4fee48647bd8e5ed619d3')
b2sums=('23ae5df1ddcb92a995597f1d8deb4ae1896c8ca3e4c84d49964c747f96cd3a4db1f4f71721d25be0a478d1b0f9f82cd4985b3e4c91717015e249c97e1171e8db'
        'b8a100c6a219e0888018fece11f3737137fa6fef54ed5f60d383794aa54b66dc49212573ef9e2231a3fb957c0e9c572b2ad0d7602904eb3e431c06178c5a00c2'
        'fb8c47a7248ce3429443b58a399c6b0a81b454d6f95b81122994fb080edafab835d0c982b5aeeafee2a5a99573206ab04d83576f48295c1446e91411ec424847'
        '2e0cc165f5e6c94ded73cfdf019db735dac227a89033d370c89cdf926a8eb3851c938fd11acc0d7b5ab1bd7122b0c5fb9ca0cc00fe4dce9b915a530e2c0a1a5a'
        '4a29980dbb06363980d37129f5fb003571c058f93763fbc2fec6b55c514c2c0d349bb1ddf72ece837e75cf4d90313ac2ed8fe7c1162c179c00599dfb9e107b14')

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
  install -Dm644 ../$pkgname.env "$pkgdir"/etc/default/$pkgname
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system $pkgname.service
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/$pkgname.service.d \
    ../override.conf
  install -Dm644 ../$pkgname.sysusers.conf \
    "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 ../$pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
  make DESTDIR="$pkgdir" install-strip
}

