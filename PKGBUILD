# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

pkgname=inadyn
pkgver=2.12.0
pkgrel=3
pkgdesc='Dynamic DNS client with SSL/TLS support'
arch=(x86_64)
url=https://troglobit.com/projects/inadyn/
license=(GPL)
depends=(
  ca-certificates
  confuse
  openssl
)
backup=(
  "etc/$pkgname.conf"
  "etc/default/$pkgname"
)
install=$pkgname.install
source=(
  "https://github.com/troglobit/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
  override.conf
  "$pkgname.env"
  "$pkgname.sysusers.conf"
  "$pkgname.tmpfiles"
)
sha256sums=('e64c4386b6f42bbace589b847f22823a755b59f14a277a5f556fef0d99069245'
            'a44fa6cc87969de84acb5c7103db8753625a2da60cb78e4b3df887b0f5d8f5a6'
            '933389938df4fa580b2da26b764f0f3982c611a35a1c8046e21a1e8b235320e0'
            '1fc82042877c745d5ebec8d6e758fef4ded1e85a8677f7b4f5945ff1185641dc'
            'a54d81134d7dda48e55b5ab2b6a5b36a1b8cc14094bac190893e31fe28c02c00')
b2sums=('2bb1e8f16784c41cb2810c3ed2a52ef12823277082b33a9436a330caad4b4f76034ab3e7f9fefb4dffc0fbf5968f4fb60967f784ce3682f165666c8c0744fcc9'
        'b8a100c6a219e0888018fece11f3737137fa6fef54ed5f60d383794aa54b66dc49212573ef9e2231a3fb957c0e9c572b2ad0d7602904eb3e431c06178c5a00c2'
        'c640f9fd8384cdb6dcc9c4ea939f1b617d9154bb08f9f85928bdaebd66d7c5d9450f34f44c428197dfd69e44a185b8ecdcbff34168b29f875f908e3ace1d9aaf'
        '5d9633c7258727bb87662273efe6a0862af3dcbe1142b0127d13fad8c365f2a7666aab8ee27958c2d52c0462989d4fd15fe5dbd609a96b2ebdfb41db47b9267f'
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
