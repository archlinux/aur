# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=2.0.0
pkgrel=1
pkgdesc='Easy to use local storage management for Linux.'
arch=('x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'rust')
depends=('dbus')
optdepends=('stratis-cli: command line interface')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz")
sha256sums=('d67d8bea566262cfc60a1596af98b3b7da5324b822a6c4d2f934794223766bf7')

build() {
  cd "${pkgname}-${pkgver}"

  # Release
  make release
  make stratisd.8

  # patch systemd config
  sed -i 's,/usr/libexec,/usr/bin,g' stratisd.service
}

check() {
  cd "${pkgname}-${pkgver}"

  make test
}

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 stratisd.service "${pkgdir}/usr/lib/systemd/system/stratisd.service"
  install -D -m644 org.storage.stratis2.service "${pkgdir}/usr/share/dbus-1/system-services/org.storage.stratis2.service"
  install -D -m644 stratisd.conf "${pkgdir}/usr/share/dbus-1/system.d/stratisd.conf"
  install -D -m644 docs/stratisd.8 "${pkgdir}/usr/share/man/man8/stratisd.8"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
