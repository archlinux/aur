# Maintainer: ilovemikael <itsmeguys2247@gmail.com>
# Fork of [mutantmonkey](https://aur.archlinux.org/packages/opencryptoki)

pkgname=opencryptoki-git
pkgname_=opencryptoki
pkgver=3.24.0.r102.g213568b4
pkgrel=1
pkgdesc="PKCS11 implementation for Linux"
arch=('i686' 'x86_64')
url="https://github.com/opencryptoki/opencryptoki"
license=('CPL')
depends=('openssl' 'trousers')
makedepends=('expect' 'jq')
conflicts=('opencryptoki')
provides=(opencryptoki)
source=("git+https://github.com/opencryptoki/opencryptoki.git"
        opencryptoki.sysusers.conf
        opencryptoki.tmpfiles.conf)
sha256sums=('SKIP'
            '6c96a96f7df9279fa62c6aab4231116fd0db0fbe0a88b661b5d1a7451b0e9a39'
            'e315fc996a1f416efd34f6f3e3149378118cded0da9f8a919e9501ea8db90fac')

pkgver() {
  cd "$pkgname_"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}            
            
build() {
  cd ${pkgname_}
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
  cd ${pkgname_}
  make DESTDIR="$pkgdir/" install -i
  install -Dm644 "${srcdir}/opencryptoki.sysusers.conf" \
                 "${pkgdir}/usr/lib/sysusers.d/opencryptoki.conf"
  install -Dm644 "${srcdir}/opencryptoki.tmpfiles.conf" \
                 "${pkgdir}/usr/lib/tmpfiles.d/opencryptoki.conf"
  chown -R root:64 ${pkgdir}/var/lib/opencryptoki
  rm -rf ${pkgdir}/var/lock
}

# vim:set ts=2 sw=2 et:
