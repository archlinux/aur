# Maintainer: Milan Pässler <me at pbb dot lc>

pkgname=hopglass-server
pkgver=v0.1.3_39_g3d5b233
pkgrel=1
pkgdesc="The HopGlass server collects data from Freifunk networks"
arch=('x86_64')
url="https://github.com/hopglass/hopglass-server"
license=('AGPL-3.0')
depends=('nodejs')
makedepends=('yarn')
source=("git+https://github.com/hopglass/hopglass-server"
	hopglass-server-wrapper
	hopglass-server.service
	hopglass-server.sysusers
	hopglass-server@.service
	hopglass-server.tmpfiles)

sha256sums=('SKIP'
	'6bf23bc9f54004aaaf21a1d8ae2b7db674463e8cc0b0072133e133c2f100611b'
	'fbbe882ea0a2c67b284d537deffc41b986b058ec3ac776509cec20c0f3d79808'
	'ea593147929f11b796c8d10d6aa649e25ac4d2bb692a0416aea884d4b7797565' 
	'273c5455635d08862f2a2059019a457dd59e046b5d6415b1425eac2f605fca0c'
	'12adb52aeece94ae09e99bf14615b605ce92a2ce26eaf20f541bc967b78712db')

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
  cp -r hopglass-server/scripts "${pkgdir}"/usr/share/hopglass-server/
  cp -r hopglass-server/node_modules "${pkgdir}"/usr/share/hopglass-server/

  install -Dm755 hopglass-server-wrapper "${pkgdir}"/usr/bin/hopglass-server
  install -Dm644 hopglass-server/LICENSE -t "${pkgdir}"/usr/share/licenses/hopglass-server/
  install -Dm644 hopglass-server.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 hopglass-server@.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 hopglass-server.sysusers "${pkgdir}"/usr/lib/sysusers.d/hopglass-server.conf
  install -Dm644 hopglass-server/config.json.example "${pkgdir}"/etc/hopglass-server/config.json
  install -Dm644 hopglass-server/aliases.json.example "${pkgdir}"/etc/hopglass-server/aliases.json

  install -d "${pkgdir}"/var/lib/hopglass-server/
}
