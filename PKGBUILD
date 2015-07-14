# Maintainer: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

pkgname=inadyn-fork
_name=inadyn
pkgver=1.99.13
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
        inadyn.conf
        inadyn.service
        missing_changelog.patch)
sha256sums=('9e003790a0c3b4fbe10e5744adacc839ceca1a469e3bf461b464097b30a67c34'
            '919f87ea87b58e4ddfaf3346ffbcf899b8d9dcee5a0e9440e17e5db9552bba53'
            '4587f4ae2a4215f9ba67d5b3b7d0aa120a9ebd31677472fa68d8792f42d7135f'
            '8925258f5ce0307c4e6a3280f9ce29d4df93775dbc91515b6ad1ae8448b803f4')

prepare(){
  cd ${_name}-$pkgver
  patch -Np1 -i ../missing_changelog.patch
}

build(){
  cd ${_name}-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --enable-openssl
  make
}

package(){
  cd ${_name}-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 ../inadyn.service $pkgdir/usr/lib/systemd/system/inadyn.service
  install -Dm600 ../inadyn.conf $pkgdir/etc/inadyn.conf
}
