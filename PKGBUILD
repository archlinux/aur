# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd-git'
pkgver=0.5.1.r21.gc118733
pkgrel=1
pkgdesc='Stratis is a new tool that meets the needs of Red Hat Enterprise Linux (RHEL) users calling for an easily configured, tightly integrated solution for storage that works within the existing Red Hat storage management stack.'
arch=('i686' 'x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'git' 'rust')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
source=('git+https://github.com/stratis-storage/stratisd.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-git}"

  git describe --long --tags \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname/-git}"

  # Append '--release' to `cargo build` (line 31):
  sed -i '31s/cargo build/cargo build --release/' Makefile
  # Release
  make build
  make docs
}

check() {
  cd "${pkgname/-git}"

  make test
}

package() {
  cd "${pkgname/-git}"

  install -d -m 755 "${pkgdir}/etc/dbus-1/system.d"
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/lib/systemd/system"
  install -d -m 755 "${pkgdir}/usr/share/doc/"
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d -m 755 "${pkgdir}/usr/share/man/man8"

  install -m 755 "target/x86_64-unknown-linux-gnu/release/${pkgname/-git}" \
    "${pkgdir}/usr/bin/${pkgname/-git}"
  install -m 644 stratisd.service "${pkgdir}/usr/lib/systemd/system"
  install -m 644 stratisd.conf "${pkgdir}/etc/dbus-1/system.d"
  install -m 644 docs/stratisd.8 "${pkgdir}/usr/share/man/man8"
  cp -r target/doc/* "${pkgdir}/usr/share/doc/"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
