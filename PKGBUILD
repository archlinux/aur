# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=1.0.3
pkgrel=1
pkgdesc='Easy to use local storage management for Linux.'
arch=('x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'rust')
depends=('dbus')
optdepends=('stratis-cli: command line interface')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz")
sha256sums=('27e8dcae06b5bbb89ed4e798435f004fd86964400da7162fa2a56742cb4e9bc3')

build() {
  cd "${pkgname}-${pkgver}"

  # Append '--release' to `cargo build` (line 24):
  sed -i 's/cargo build --target/cargo build --release --target/' Makefile

  # Release
  make build
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

  install -D -m755 "target/${CARCH}-unknown-linux-gnu/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 stratisd.service "${pkgdir}/usr/lib/systemd/system/stratisd.service"
  install -D -m644 org.storage.stratis1.service "${pkgdir}/usr/share/dbus-1/system-services/org.storage.stratis1.service"
  install -D -m644 stratisd.conf "${pkgdir}/usr/share/dbus-1/system.d/stratisd.conf"
  install -D -m644 docs/stratisd.8 "${pkgdir}/usr/share/man/man8/stratisd.8"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
