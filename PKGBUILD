# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=0.5.1
pkgrel=3
pkgdesc='Stratis is a new tool that meets the needs of Red Hat Enterprise Linux (RHEL) users calling for an easily configured, tightly integrated solution for storage that works within the existing Red Hat storage management stack.'
arch=('x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'git' 'mpfr' 'rust')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz")
sha256sums=('668792b4fde50fcca6410ff689eda1bd62f5c23f185f652b7a08fe7e9e458808')

build() {
  cd "${pkgname}-${pkgver}"

  # Append '--release' to `cargo build` (line 24):
  sed -i '24s/cargo build/cargo build --release/' Makefile
  # Release
  make build
  make docs

  # patch systemd config
  sed -i 's,/usr/libexec,/usr/bin,g' stratisd.service
}

check() {
  cd "${pkgname}-${pkgver}"

  make test
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}/etc/dbus-1/system.d"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/lib/systemd/system"
  install -d -m 755 "${pkgdir}/usr/share/doc/"
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d -m 755 "${pkgdir}/usr/share/man/man8"

  install -m 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -m 644 stratisd.service "${pkgdir}/usr/lib/systemd/system"
  install -m 644 stratisd.conf "${pkgdir}/etc/dbus-1/system.d"
  install -m 644 docs/stratisd.8 "${pkgdir}/usr/share/man/man8"
  cp -r target/doc/* "${pkgdir}/usr/share/doc/"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
