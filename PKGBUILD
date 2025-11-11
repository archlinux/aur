# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>
# Contributor: Patryk Kowalczyk <patryk at kowalczyk dot ws>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: VuDu <vudu.curse@gmail.com>

pkgname=opencryptoki
pkgver=3.26.0
pkgrel=1
pkgdesc="PKCS11 implementation for Linux"
arch=('i686' 'x86_64')
url="https://github.com/opencryptoki/opencryptoki"
license=('CPL')
depends=('openssl' 'trousers')
makedepends=('expect' 'jq')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/opencryptoki/opencryptoki/archive/v${pkgver}.tar.gz"
        opencryptoki.sysusers.conf
        opencryptoki.tmpfiles.conf)
sha256sums=('b84707edf20c3c0641661ca87f4a606cebb623ce5f2d70581142c9a6d2467c2c'
            '6c96a96f7df9279fa62c6aab4231116fd0db0fbe0a88b661b5d1a7451b0e9a39'
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
  chown -R root:64 ${pkgdir}/var/lib/opencryptoki
  rm -rf ${pkgdir}/var/lock
}

# vim:set ts=2 sw=2 et:
