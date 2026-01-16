# Maintainer: Carlos Galindo <arch -at_ cgj _d0t- es>
# Contributor: Arthur Vuillard @arthru

_pkgname="certbot-plugin-gandi"
pkgname="certbot-dns-gandi"
pkgdesc="gandi DNS authenticator plugin for certbot"
pkgver=1.6.1
pkgrel=1
arch=("any")
url="https://github.com/obynio/${_pkgname}"
license=("MIT")
depends=("certbot" "python-requests")
makedepends=("python-build" "python-installer" "python-wheel" "python-hatchling")
provides=("certbot-dns-gandi")
backup=(
  "etc/letsencrypt/gandi.ini"
)
source=(
  "${url}/archive/refs/tags/${pkgver}.zip"
  "gandi.ini"
)
sha256sums=('f8c0b22ba8149bf48faa289fc5f969061c51b54a8e17d4cd6e9cad6d0e24022c'
            'dff9eaa13a927429a407a7e152690c5c10f51b6fa426f1ea29787728eeab8279')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "${pkgdir}/etc/letsencrypt"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 0600 "../gandi.ini" "${pkgdir}/etc/letsencrypt/gandi.ini"
  install -m 0644 "contrib/certbot-dns-gandi-renew.timer" "${pkgdir}/usr/lib/systemd/system/certbot-dns-gandi-renew.timer"
  install -m 0644 "contrib/certbot-dns-gandi-renew.service" "${pkgdir}/usr/lib/systemd/system/certbot-dns-gandi-renew.service"
  install -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
