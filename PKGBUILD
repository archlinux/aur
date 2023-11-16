_pkgname="certbot-plugin-gandi"
pkgname="certbot-dns-gandi"
pkgdesc="gandi DNS authenticator plugin for certbot"
pkgver=1.5.0
pkgrel=1
arch=("any")
url="https://github.com/obynio/${_pkgname}"
license=("MIT")
depends=("certbot")
makedepends=("git" "python-setuptools")
provides=("certbot-dns-gandi")
backup=(
  "etc/letsencrypt/gandi.ini"
)
source=(
  "${url}/archive/refs/tags/${pkgver}.zip"
  "gandi.ini"
)
sha256sums=('8a11257b9b2687221378faf7267c7350b1475bcdbb54bb4c8f2ec72ed7ff05f0'
            'dff9eaa13a927429a407a7e152690c5c10f51b6fa426f1ea29787728eeab8279')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  mkdir -p "${pkgdir}/etc/letsencrypt"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 0600 "../gandi.ini" "${pkgdir}/etc/letsencrypt/gandi.ini"
  install -m 0644 "contrib/certbot-dns-gandi-renew.timer" "${pkgdir}/usr/lib/systemd/system/certbot-dns-gandi-renew.timer"
  install -m 0644 "contrib/certbot-dns-gandi-renew.service" "${pkgdir}/usr/lib/systemd/system/certbot-dns-gandi-renew.service"
  install -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
