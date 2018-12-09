# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>
# Contributor: Patryk Kowalczyk <patryk at kowalczyk dot ws>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: VuDu <vudu.curse@gmail.com>

pkgname=opencryptoki
pkgver=3.10.0
pkgrel=1
pkgdesc="PKCS11 implementation for Linux"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/opencryptoki"
license=('CPL' 'GPL')
depends=('openssl' 'trousers')
makedepends=('expect')
source=(https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/3.10/${pkgname}-${pkgver}.tar.gz
        opencryptoki.sysusers.conf
        opencryptoki.tmpfiles.conf)
sha256sums=('f02bfb1051d6f2e629390b0a0bf5245c6b212a886874e19f59cc418315130321'
            '63723f403ac795182cb258d07896e6f3828e8db2fe31597df00a0461783dd16d'
            'e315fc996a1f416efd34f6f3e3149378118cded0da9f8a919e9501ea8db90fac')

build() {
  cd ${pkgname}-${pkgver}
  ./bootstrap.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-systemd=/usr/lib/systemd/system/ \
              --localstatedir=/var \
              --sbindir=/usr/bin \
              --enable-testcases
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install -i
  install -Dm644 "${srcdir}/opencryptoki.sysusers.conf" \
                 "${pkgdir}/usr/lib/sysusers.d/opencryptoki.conf"
  install -Dm644 "${srcdir}/opencryptoki.tmpfiles.conf" \
                 "${pkgdir}/usr/lib/tmpfiles.d/opencryptoki.conf"
  rm -rf ${pkgdir}/var/lock
}

# vim:set ts=2 sw=2 et:
