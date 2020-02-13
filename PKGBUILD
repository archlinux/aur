# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=2.0.1
pkgrel=1
pkgdesc='Easy to use local storage management for Linux.'
arch=('x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'rust')
depends=('dbus')
optdepends=('stratis-cli: command line interface')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz")
b2sums=('86a2b2e58aed08ea34e1ddbc064ec4e4bfd3f4f4544d60ba580941b71e56b80b65c99852934b2c4826ed2cac073bb66dcd4dcf1d4ff243f38f026582eb7257b1')

prepare() {
  cd "${pkgname}-${pkgver}"

  # patch systemd config
  sed -i 's,/usr/libexec,/usr/bin,g' stratisd.service
  # patch dbus config
  sed -i 's, --debug,,g' org.storage.stratis2.service
}

build() {
  cd "${pkgname}-${pkgver}"

  # Release
  make release
  make stratisd.8
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
