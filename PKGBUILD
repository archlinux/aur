# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=2.2.1
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
b2sums=('e7c41ed6f8c358b9659142d7512975baa2d3fbfc79a2e6da59c5a79dde8ddbd65b00fcbce903d861178eac9cdccf98ca44b9ba3a4008ba3485fa4e70c4e09b7f')

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
  install -D -m755 "target/release/stratis_dbusquery_version" "${pkgdir}/usr/bin/stratis_dbusquery_version"
  install -D -m755 "target/release/stratis_uuids_to_names" "${pkgdir}/usr/lib/udev/stratis_uuids_to_names"
  install -D -m755 "developer_tools/stratis_migrate_symlinks.sh" "${pkgdir}/usr/bin/stratis_migrate_symlinks.sh"
  install -D -m644 udev/11-stratisd.rules "${pkgdir}/usr/lib/udev/rules.d/11-stratisd.rules"
  install -D -m644 stratisd.service "${pkgdir}/usr/lib/systemd/system/stratisd.service"
  install -D -m644 org.storage.stratis2.service "${pkgdir}/usr/share/dbus-1/system-services/org.storage.stratis2.service"
  install -D -m644 stratisd.conf "${pkgdir}/usr/share/dbus-1/system.d/stratisd.conf"
  install -D -m644 docs/stratisd.8 "${pkgdir}/usr/share/man/man8/stratisd.8"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
