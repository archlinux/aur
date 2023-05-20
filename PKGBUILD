# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

pkgname=inadyn
pkgver=2.11.0
pkgrel=1
pkgdesc='Dynamic DNS client with SSL/TLS support'
arch=('x86_64')
url=https://troglobit.com/projects/inadyn/
license=('GPL')
depends=('ca-certificates' 'confuse' 'openssl')
replaces=("$pkgname-fork")
backup=("etc/$pkgname.conf" "etc/default/$pkgname")
install=$pkgname.install
source=(
  "https://github.com/troglobit/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
  override.conf
  "$pkgname.env"
  "$pkgname.sysusers.conf"
  "$pkgname.tmpfiles"
)
sha256sums=('9c8b2a425acb9681564e9fc25a319f2109c7d2ebe1ffe99b06d4a722efb6ecba'
            'a44fa6cc87969de84acb5c7103db8753625a2da60cb78e4b3df887b0f5d8f5a6'
            '933389938df4fa580b2da26b764f0f3982c611a35a1c8046e21a1e8b235320e0'
            'a79bbc550c9b2e11197b9b5ee2e6fbc7ec890ad037b1808c29c48c037c26b4f9'
            'a54d81134d7dda48e55b5ab2b6a5b36a1b8cc14094bac190893e31fe28c02c00')
b2sums=('4f96d53834f42d1234f48df3d9e6973c0dc15688d59931029d4c5f7c13f9548fe9be7c8f0a2f0a20f16761ee5b59a1d88b90d0b6e9123e114d3fd37889ee203d'
        'b8a100c6a219e0888018fece11f3737137fa6fef54ed5f60d383794aa54b66dc49212573ef9e2231a3fb957c0e9c572b2ad0d7602904eb3e431c06178c5a00c2'
        'c640f9fd8384cdb6dcc9c4ea939f1b617d9154bb08f9f85928bdaebd66d7c5d9450f34f44c428197dfd69e44a185b8ecdcbff34168b29f875f908e3ace1d9aaf'
        '2e0cc165f5e6c94ded73cfdf019db735dac227a89033d370c89cdf926a8eb3851c938fd11acc0d7b5ab1bd7122b0c5fb9ca0cc00fe4dce9b915a530e2c0a1a5a'
        'b49ad171415fb5e75217dda567b74e9c77c276c49fd816b607a3f4991e2fc95205a8b511d2950ffc650dad90768d3559dc555289acb81eaf16b469b648609b90')

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
