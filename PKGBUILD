# Maintainer: HLFH <gaspard@dhautefeuille.eu>
pkgname="certbot-dns-gandi-modern-git"
pkgdesc="Certbot plugin for authentication using Gandi LiveDNS - modern"
pkgver=r83.d77259d
pkgrel=1
arch=("any")
url="https://github.com/Kriechi/certbot-dns-gandi-modern"
license=("MIT")
depends=("certbot" "python-requests")
makedepends=("git" "python-build" "python-installer" "python-wheel" "python-hatchling")
provides=("certbot-dns-gandi")
conflicts=("certbot-dns-gandi" "certbot-dns-gandi-git")
backup=(
  "etc/letsencrypt/gandi.ini"
)
source=(
  "certbot-dns-gandi::git+https://github.com/Kriechi/certbot-dns-gandi-modern.git#branch=modernize-certbot-v5"
  "gandi.ini"
)
sha256sums=('SKIP'
            '8e4094209694b586975e083f0e9863bc047faef3d9dfad262ad23c0db6444b69')

pkgver() {
  cd "${srcdir}/${pkgname%-modern-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-modern-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname%-modern-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "${pkgdir}/etc/letsencrypt"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname%-modern-git}"
  install -m 0600 "../gandi.ini" "${pkgdir}/etc/letsencrypt/gandi.ini"
  install -m 0644 "contrib/certbot-dns-gandi-renew.timer" "${pkgdir}/usr/lib/systemd/system/certbot-dns-gandi-renew.timer"
  install -m 0644 "contrib/certbot-dns-gandi-renew.service" "${pkgdir}/usr/lib/systemd/system/certbot-dns-gandi-renew.service"
  install -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-modern-git}/LICENSE"
}
