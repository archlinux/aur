# Maintainer: Milan Pässler <me at pbb dot lc>

pkgname=hopglass-server
pkgver=v0.1.3_43_g8bfd039
pkgrel=3
pkgdesc="The HopGlass server collects data from Freifunk networks"
arch=('any')
url="https://github.com/hopglass/hopglass-server"
license=('AGPL-3.0')
depends=('nodejs')
makedepends=('yarn')
source=("git+https://github.com/hopglass/hopglass-server"
	hopglass-server-wrapper
	hopglass-server.service
	hopglass-server.sysusers
	hopglass-server.tmpfiles
	hopglass-server@.service)

sha256sums=('SKIP'
	'9fa94399ba955eb035f31adaafe43865e135c5f6327b5250a37ab3f4f7727cd4'
	'b066078e4ad28b29c14ec704087bae6b9e01e029a80b38d07124ec4204cb85f1'
	'ea593147929f11b796c8d10d6aa649e25ac4d2bb692a0416aea884d4b7797565'
	'12adb52aeece94ae09e99bf14615b605ce92a2ce26eaf20f541bc967b78712db'
	'6e377bf71689fa04a82f51940115a1c856951c4e3007b3ec11e8a0674b7a2fcd')

pkgver() {
  cd "${srcdir}/hopglass-server"
  git describe --tags --long | sed s/-/_/g
}

backup=('etc/hopglass-server/aliases.json' 'etc/hopglass-server/config.json')

build() {
   cd "${srcdir}/hopglass-server"
   yarn --production
}

package() {
  install -Dm644 hopglass-server/hopglass-server.js -t "${pkgdir}"/usr/share/hopglass-server/
  install -Dm644 hopglass-server/config.json.example -t "${pkgdir}"/usr/share/hopglass-server/
  install -Dm644 hopglass-server/aliases.json.example -t "${pkgdir}"/usr/share/hopglass-server/
  install -Dm644 hopglass-server/config.json.defaults -t "${pkgdir}"/usr/share/hopglass-server/
  install -Dm644 hopglass-server/README.md -t "${pkgdir}"/usr/share/hopglass-server/

  cp -r hopglass-server/modules "${pkgdir}"/usr/share/hopglass-server/
  cp -r hopglass-server/node_modules "${pkgdir}"/usr/share/hopglass-server/

  install -Dm755 hopglass-server-wrapper "${pkgdir}"/usr/bin/hopglass-server
  install -Dm644 hopglass-server/LICENSE -t "${pkgdir}"/usr/share/licenses/hopglass-server/
  install -Dm644 hopglass-server.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 hopglass-server@.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 hopglass-server.sysusers "${pkgdir}"/usr/lib/sysusers.d/hopglass-server.conf
  install -Dm644 hopglass-server.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/hopglass-server.conf
  install -Dm644 hopglass-server/config.json.example "${pkgdir}"/etc/hopglass-server/config.json
  install -Dm644 hopglass-server/aliases.json.example "${pkgdir}"/etc/hopglass-server/aliases.json

  install -d "${pkgdir}"/var/lib/hopglass-server/
}
