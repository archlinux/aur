# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Patryk Kowalczyk <patryk at kowalczyk dot ws>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: VuDu <vudu.curse@gmail.com>

pkgname=opencryptoki
pkgver=3.3
pkgrel=2
pkgdesc="PKCS11 implementation for Linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opencryptoki"
license=('CPL' 'GPL')
depends=('openssl' 'trousers' 'expect')
makedepends=('libtool')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-v${pkgver}.tgz
        'opencryptoki.tmpfiles.conf')
sha256sums=('9e056f520147f1e55fa9ab9661b4a7b8589d9b13fa3bb1f122c6a0a79d416bb5'
            'e315fc996a1f416efd34f6f3e3149378118cded0da9f8a919e9501ea8db90fac')

build() {
  cd ${srcdir}/${pkgname}
  ./bootstrap.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
	--with-systemd=/usr/lib/systemd/system/ \
	--localstatedir=/var \
	--sbindir=/usr/bin \
	--enable-testcases
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR="$pkgdir/" install -i
  install -Dm644 "${srcdir}/opencryptoki.tmpfiles.conf" \
      "${pkgdir}/usr/lib/tmpfiles.d/opencryptoki.conf"
  rm -rf ${pkgdir}/var/lock
}

# vim:set ts=2 sw=2 et:
