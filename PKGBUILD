# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=acmed
pkgver=0.17.0
pkgrel=2
pkgdesc="An ACME (RFC 8555) client daemon"
arch=('x86_64')
url="https://github.com/breard-r/acmed/"
license=('Apache' 'MIT')
provides=('acmed')
depends=('gcc-libs' 'openssl')
optdepends=('acmed-polkit-reload: polkit service reload rule')
makedepends=('rust' 'cargo')
backup=('etc/acmed/acmed.toml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/breard-r/${pkgname}/archive/v${pkgver}.tar.gz"
        "acmed.sysusers"
        "acmed.tmpfiles")
sha256sums=('3c6d43afe2dd62b1d5505b5aa002a0a0317646505e3bd677ca2e3b3772a1dbeb'
            'dcc0cc36c3fafcd4bb940fdd2f6bf90a9b1ba95858d908fcaed23851361a3a90'
            'f43f62263a210a60bea2a6fe684881711fae9107702288c575521ff2246b46d6')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/var"
  install -Dm644 "contrib/acmed.service" "${pkgdir}/usr/lib/systemd/system/acmed.service"
  install -Dm644 "${srcdir}/acmed.sysusers" "${pkgdir}/usr/lib/sysusers.d/acmed.conf"
  install -Dm644 "${srcdir}/acmed.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/acmed.conf"
  install -Dm644 "LICENSE-APACHE-2.0.txt" "${pkgdir}/usr/share/licenses/acmed/LICENSE-APACHE-2.0.txt"
  install -Dm644 "LICENSE-MIT.txt" "${pkgdir}/usr/share/licenses/acmed/LICENSE-MIT.txt"
}
