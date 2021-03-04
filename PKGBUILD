# Maintainer: svalo <code@valo.space>
pkgname="certbot-dns-gandi-git"
pkgdesc="gandi DNS authenticator plugin for certbot - GIT version"
pkgver=1.3.2.r1.g93989aa
pkgrel=1
arch=("any")
url="https://github.com/obynio/certbot-plugin-gandi.git"
license=("MIT")
depends=("certbot")
makedepends=("git" "python-setuptools")
provides=("certbot-dns-gandi")
backup=(
  "etc/letsencrypt/gandi.ini"
)
source=(
  "certbot-dns-gandi::git://github.com/obynio/certbot-plugin-gandi.git"
  "gandi.ini"
)
sha256sums=('SKIP'
            'dff9eaa13a927429a407a7e152690c5c10f51b6fa426f1ea29787728eeab8279')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  python setup.py install --root="${pkgdir}"
  mkdir -p "${pkgdir}/etc/letsencrypt"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname%-git}"
  install -m 0600 "../gandi.ini" "${pkgdir}/etc/letsencrypt/gandi.ini"
  install -m 0644 "contrib/certbot-dns-gandi-renew.timer" "${pkgdir}/usr/lib/systemd/system/certbot-dns-gandi-renew.timer"
  install -m 0644 "contrib/certbot-dns-gandi-renew.service" "${pkgdir}/usr/lib/systemd/system/certbot-dns-gandi-renew.service"
  install -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
