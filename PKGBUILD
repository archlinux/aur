# Maintainer: Miles McLean <mills00013@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Brad Pitcher <bradpitcher@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=networkmanager-l2tp
_pkgname=NetworkManager-l2tp
pkgver=1.2.14
pkgrel=1
pkgdesc='L2TP support for NetworkManager'
arch=('i686' 'x86_64')
url="https://github.com/nm-l2tp/NetworkManager-l2tp"
license=('GPL2')
depends=('libnm>=1.2' 'ppp' 'xl2tpd' 'libsecret')
makedepends=('intltool' 'python' 'libnma')
optdepends=(
  'libreswan: IPSec support (recommended)'
  'strongswan: IPSec support'
)
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/nm-l2tp/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('831020791e0f02c29aa734eafb41d302')

prepare() {
  cd $_pkgname-$pkgver

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var --libexecdir=/usr/lib/NetworkManager \
    --with-pppd-plugin-dir=/usr/lib/pppd/2.4.7
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
