# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=booth
pkgver=1.0
pkgrel=1
pkgdesc="RAFT cluster ticket manager for pacemaker"
arch=('i686' 'x86_64')
url="https://github.com/ClusterLabs/${pkgname}/"
license=('GPL2')
depends=('pacemaker')
optdepends=('pcs: for cluster shell support'
	    'crmsh: for cluster shell support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/v$pkgver.tar.gz"
	"pcs.patch::https://patch-diff.githubusercontent.com/raw/ClusterLabs/$pkgname/pull/41.patch"
	"bufoverflow.patch")
sha512sums=('0024f3dc0d15830a5835d5366b01d8700a391005c9ae1ee1ae8d970383d6d5d78e78bcac86610f65301c9441b452dce16d8c736d2363e6577c38dac928b576a8'
            '5b6297c444ef326c59705170717865572812639f8a9c6e23a02b73234ae6edd23b9337b9284fa12ae489f3a599fe538dd92c26db12a011ca0eac09c2b15289cb'
            'b8bb3c1ac4b7778ff019855b342a76847a909485b9f5b723f37298e1b049dc5ef0351f649f378926f8a62c5a0db50508e6b25c74f7add8bd4244a11976d1f962')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -b -z .orig <../pcs.patch
  patch -Np2 -b -z .orig <../bufoverflow.patch
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --localstatedir=/var
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
