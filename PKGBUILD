# $Id$
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: xav <xav at ethertricks dot net>

_pkgname=umurmur
pkgname=umurmur-openssl
pkgver=0.2.17
pkgrel=1
pkgdesc='Minimalistic Mumble server - built with openssl'
arch=('i686' 'x86_64')
url='https://github.com/umurmur/umurmur'
license=('custom')
depends=('openssl' 'libconfig' 'protobuf-c')
makedepends=('cmake')
install=$_pkgname.install
backup=('etc/umurmur/umurmur.conf')
source=($_pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz
        umurmur.service)
md5sums=('b06566c896a8b4ac32ca00920c8dd093'
         'd9d556e4ffa77e193fb40ce508804720')

prepare() {
  cd $_pkgname-${pkgver}
}

build() {
  cd $_pkgname-${pkgver}
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DSSL=openssl
  make
}

package() {
  cd $_pkgname-${pkgver}
  make DESTDIR="$pkgdir" install
  install -dm0755 $pkgdir/etc/umurmur/
  mv $pkgdir/usr/etc/umurmur.conf $pkgdir/etc/umurmur/
  rmdir $pkgdir/usr/etc
  install -Dm644 ../umurmur.service "$pkgdir"/usr/lib/systemd/system/umurmur.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
