# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=2.4.0
pkgrel=1
pkgdesc='Easy to use local storage management for Linux.'
arch=('x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'rust' 'clang')
depends=('dbus' 'cryptsetup' 'util-linux-libs' 'clevis' 'systemd')
optdepends=('stratis-cli: command line interface'
            'dracut: stratis as root filesystem support')
checkdepends=('python-pyudev')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz")
b2sums=('f6e0cf98b5c320d4766e157f2fab158167b8ebd8ac24a0ecd99f13154697693d0f54a2eacac1138a977a448b203e19c32d3bf4b696cc93515e7b9038559f713a')

prepare() {
  cd "${pkgname}-${pkgver}"

  # patch libexec path in configs
  configs=(systemd/stratisd.service
           dracut/90stratis/module-setup.sh
           org.storage.stratis2.service
           dracut/90stratis/stratisd-min.service
           systemd/stratisd-min-postinitrd.service)
  for file in ${configs[@]}; do
      echo "Patching libexec in $file"
      sed -i 's,/usr/libexec,/usr/lib,g' $file 
  done
}

build() {
  cd "${pkgname}-${pkgver}"

  # Release
  make release
  make release-min
  make docs/stratisd.8
}

check() {
  cd "${pkgname}-${pkgver}"

  make test
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/systemd/system-generators"
  install -dm755 "${pkgdir}/usr/bin"
  make install DESTDIR="${pkgdir}" PREFIX="/usr" LIBEXECDIR="/usr/lib"
  #install -D -m755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  #install -D -m755 "target/release/stratis_dbusquery_version" "${pkgdir}/usr/bin/stratis_dbusquery_version"
  #install -D -m755 "target/release/stratis_uuids_to_names" "${pkgdir}/usr/lib/udev/stratis_uuids_to_names"
  #install -D -m755 "developer_tools/stratis_migrate_symlinks.sh" "${pkgdir}/usr/bin/stratis_migrate_symlinks.sh"
  #install -D -m644 udev/11-stratisd.rules "${pkgdir}/usr/lib/udev/rules.d/11-stratisd.rules"
  #install -D -m644 stratisd.service "${pkgdir}/usr/lib/systemd/system/stratisd.service"
  #install -D -m644 org.storage.stratis2.service "${pkgdir}/usr/share/dbus-1/system-services/org.storage.stratis2.service"
  #install -D -m644 stratisd.conf "${pkgdir}/usr/share/dbus-1/system.d/stratisd.conf"
  #install -D -m644 docs/stratisd.8 "${pkgdir}/usr/share/man/man8/stratisd.8"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
