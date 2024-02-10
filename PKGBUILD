# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=acmed
pkgver=0.23.0
pkgrel=1
pkgdesc="An ACME (RFC 8555) client daemon"
arch=('x86_64')
url="https://github.com/breard-r/acmed/"
license=('Apache-2.0' 'MIT')
provides=('acmed')
depends=('gcc-libs' 'openssl')
optdepends=('acmed-polkit-reload: polkit service reload rule')
makedepends=('rust' 'cargo')
backup=('etc/acmed/acmed.toml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/breard-r/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7219149db4bc0710ef8a715c954f100a5e51c8a2e532617cf5a8f593fb08a5fc')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/var"
  install -Dm644 "contrib/systemd/acmed.service" "${pkgdir}/usr/lib/systemd/system/acmed.service"
  install -Dm644 "contrib/systemd/acmed@.service" "${pkgdir}/usr/lib/systemd/system/acmed@.service"
  install -Dm644 "contrib/systemd/acmed.sysusers" "${pkgdir}/usr/lib/sysusers.d/acmed.conf"
  install -Dm644 "contrib/systemd/acmed.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/acmed.conf"
  install -Dm644 "LICENSE-APACHE-2.0.txt" "${pkgdir}/usr/share/licenses/acmed/LICENSE-APACHE-2.0.txt"
  install -Dm644 "LICENSE-MIT.txt" "${pkgdir}/usr/share/licenses/acmed/LICENSE-MIT.txt"
}
