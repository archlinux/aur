# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd-git'
pkgver=2.0.1.r334.g35374c4d
pkgrel=1
pkgdesc='Easy to use local storage management for Linux.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'git' 'rust')
depends=('dbus')
optdepends=('stratis-cli: command line interface')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
source=('git+https://github.com/stratis-storage/stratisd.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname/-git}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname/-git}"

  sed -i 's,/usr/libexec,/usr/bin,g' stratisd.service

  # Release
  make release
  make stratisd.8
}

check() {
  cd "${srcdir}/${pkgname/-git}"

  make test
}

package() {
  cd "${srcdir}/${pkgname/-git}"

  install -D -m755 "target/release/${pkgname/-git}" "${pkgdir}/usr/bin/${pkgname/-git}"
  install -D -m644 stratisd.service "${pkgdir}/usr/lib/systemd/system/stratisd.service"
  install -D -m644 org.storage.stratis2.service "${pkgdir}/usr/share/dbus-1/system-services/org.storage.stratis2.service"
  install -D -m644 stratisd.conf "${pkgdir}/usr/share/dbus-1/system.d/stratisd.conf"
  install -D -m644 docs/stratisd.8 "${pkgdir}/usr/share/man/man8/stratisd.8"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname/-git}/LICENSE"
}

# vim: ts=2 sw=2 et:
