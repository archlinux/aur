# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aurélien Wailly <aurelien.wailly@gmail.com>

pkgname=netcf
pkgver=0.2.8
pkgrel=8
pkgdesc="A library for configuring network interfaces"
arch=('x86_64')
license=('LGPL')
url="https://pagure.io/netcf"
depends=('augeas>=0.7.4' 'libxslt' 'libxml2' 'libnl')
makedepends=('gcc')
source=("https://releases.pagure.org/netcf/$pkgname-$pkgver.tar.gz") #{,.sig})
sha256sums=('fd81d607795547807150dfdb82bd164ab2569369ab48a30cb6b0d010d17b127c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  aclocal
  automake --add-missing || true
  autoreconf
  ./configure --prefix=/usr \
	--disable-static \
	--with-init-script=none \
	--with-driver=redhat \
	--libexecdir=/usr/lib/$pkgname
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/etc/rc.d
}
