# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

pkgname=inadyn
pkgver=2.13.0
pkgrel=1
pkgdesc='Dynamic DNS client with SSL/TLS support'
arch=(x86_64)
url=https://troglobit.com/projects/inadyn/
license=(GPL)
depends=(
  ca-certificates
  confuse
  openssl
)
makedepends=(git)
backup=(
  "etc/$pkgname.conf"
  "etc/default/$pkgname"
)
install=$pkgname.install
source=(
  "git+https://github.com/troglobit/$pkgname.git#tag=v$pkgver"
  10-user-override.conf
  config.env
  sysusers.conf
  tmpfiles.conf
)
b2sums=('0ed81ff150b7fd56a8cdeafc8765129b3c66a1bb166ea87e9c6f60330071e4a58e0d3d8de5c73bb625db3194925de5c4010f72b2a77a79462b27d1ee4cc9f45c'
        'b8a100c6a219e0888018fece11f3737137fa6fef54ed5f60d383794aa54b66dc49212573ef9e2231a3fb957c0e9c572b2ad0d7602904eb3e431c06178c5a00c2'
        'c640f9fd8384cdb6dcc9c4ea939f1b617d9154bb08f9f85928bdaebd66d7c5d9450f34f44c428197dfd69e44a185b8ecdcbff34168b29f875f908e3ace1d9aaf'
        '5d9633c7258727bb87662273efe6a0862af3dcbe1142b0127d13fad8c365f2a7666aab8ee27958c2d52c0462989d4fd15fe5dbd609a96b2ebdfb41db47b9267f'
        'b49ad171415fb5e75217dda567b74e9c77c276c49fd816b607a3f4991e2fc95205a8b511d2950ffc650dad90768d3559dc555289acb81eaf16b469b648609b90')

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --enable-openssl
  make
}

package() {
  install -Dm644 config.env "$pkgdir"/etc/default/$pkgname
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/$pkgname.service.d \
    10-user-override.conf
  install -Dm644 sysusers.conf "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf

  cd $pkgname
  install -Dm600 -t "$pkgdir"/etc examples/$pkgname.conf
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system $pkgname.service
  make DESTDIR="$pkgdir" install-strip
}
