# Contributor: Brad Pitcher <bradpitcher@gmail.com>
# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=networkmanager-l2tp
_pkgname=network-manager-l2tp
pkgver=1.2.8
pkgrel=1
pkgdesc='L2TP support for NetworkManager'
arch=('i686' 'x86_64')
url="https://github.com/nm-l2tp/NetworkManager-l2tp"
license=('GPL2')
depends=('libnm' 'ppp' 'xl2tpd' 'libsecret')
makedepends=('libnm-gtk' 'intltool')
optdepends=(
  'libreswan: IPSec support (recommended)'
  'strongswan: IPSec support'
)
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/nm-l2tp/${_pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/nm-l2tp/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz.asc")
validpgpkeys=('E48BD89A1C51BFA28413D18349A7787EF8D3C039') # Douglas Kosovic
md5sums=('fc0dd71c27c7dc4143448029a02e5dca'
         'SKIP')

build() {
  cd $_pkgname-$pkgver

  ./autogen.sh
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
