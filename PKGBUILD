# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=2.2.0
pkgrel=1
pkgdesc='Easy to use local storage management for Linux.'
arch=('x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'rust' 'clang')
depends=('dbus' 'cryptsetup' 'util-linux-libs')
optdepends=('stratis-cli: command line interface')
checkdepends=('python-pyudev')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz")
b2sums=('99708f4d0a44a4c1ec9487bb938fd4136dc30c34ff2d93186e662ee0586cd5e860ef85315c7bcc46799e398aaa580da5e4188b00b2306278370d9c094828b003')

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
