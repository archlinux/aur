# Maintainer: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

pkgname=inadyn-fork
_name=inadyn
pkgver=1.99.14
pkgrel=2
pkgdesc='Simple dynamic DNS client - fork of the original INADYN implementation from Narcis Ilisei'
url='http://troglobit.com/inadyn.html'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('GPL')
depends=('openssl')
backup=('etc/inadyn.conf')
conflicts=('inadyn-opendns' 'inadyn' 'inadyn-mt' 'inadyn-fork-git')
provides=('inadyn')
source=(https://github.com/troglobit/inadyn/releases/download/$pkgver/${_name}-$pkgver.tar.xz
        pidfile.patch
        inadyn.conf
        inadyn.service)
sha256sums=('b2dfed3bb1340843105b6ba73c0bccc558bf7ead53f7f598cb47ec18de46e8d1'
            '71d639c5b31157f53ea7a25374330ae60aa6c59780462c16ec8ce6c87d8c9b2d'
            '919f87ea87b58e4ddfaf3346ffbcf899b8d9dcee5a0e9440e17e5db9552bba53'
            '4587f4ae2a4215f9ba67d5b3b7d0aa120a9ebd31677472fa68d8792f42d7135f')

prepare(){
  cd ${_name}-$pkgver
  patch -Np1 -i ../pidfile.patch
}

build(){
  cd ${_name}-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --enable-openssl
  export prefix=/usr  # libite needs this
  make
}

package(){
  cd ${_name}-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 ../inadyn.service $pkgdir/usr/lib/systemd/system/inadyn.service
  install -Dm600 ../inadyn.conf $pkgdir/etc/inadyn.conf
}
