# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=acmed
pkgver=0.22.1
pkgrel=1
pkgdesc="An ACME (RFC 8555) client daemon"
arch=('x86_64')
url="https://github.com/breard-r/acmed/"
license=('Apache' 'MIT')
provides=('acmed')
depends=('gcc-libs' 'openssl')
optdepends=('acmed-polkit-reload: polkit service reload rule')
makedepends=('rust' 'cargo')
backup=('etc/acmed/acmed.toml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/breard-r/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6476dd58acfd3dd01ca2bc04c9e96238000a95016babe241b26e90eedd6176a2')

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
