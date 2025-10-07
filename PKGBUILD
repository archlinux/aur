# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=kometa
pkgver=2.2.2
pkgrel=1
pkgdesc='A powerful tool designed to give you complete control over your Plex media libraries.'
url='https://kometa.wiki'
arch=('any')
license=('MIT')
replaces=('plex-meta-manager')
depends=(
  'python-arrapi'
  'python-dateutil'
  'python-cloudscraper'
  'python-gitpython'
  'python-lxml'
  'python-num2words'
  'python-pathvalidate'
  'python-pillow'
  'python-plexapi'
  'python-psutil'
  'python-dotenv'
  'python-requests'
  'python-ruamel-yaml'
  'python-schedule'
  'python-tmdbapis'
  'python-tenacity'
)

makedepends=('python-setuptools')
optdepends=('plex-media-server')
options=('!emptydirs'  '!strip' 'staticlibs')
backup=('var/lib/kometa/config.yml')
source=(
  "kometa-${pkgver}.tar.gz::https://github.com/Kometa-Team/Kometa/archive/refs/tags/v${pkgver}.tar.gz"
  'kometa.service'
  'kometa.sysusers'
  'kometa.tmpfiles'
)
        
sha256sums=('d8bbf0f8654f58a7b291e53610a582cff68f8f48fff499f87e018bb566e17e07'
            '5cc9f70c2a594e27f23eca4af7d23eedfa58cc44a9849d0cee91fe887aafb24e'
            'aff68f18a53e34c9778da238a2143e30dacb72d9009a219f3e5eb45cf1735e20'
            '1d81571ea9be45f2d53aa21c920b93b6fdb1c9b17c6f9490ca94b1676ae27e13')

package() {
  mkdir -p "${pkgdir}/var/lib/kometa/assets"
  install -D -m 644 "${srcdir}/Kometa-${pkgver}/config/config.yml.template" "${pkgdir}/var/lib/kometa/config.yml"

  mkdir -p "${pkgdir}/usr/lib/kometa"
  cp -r "${srcdir}/Kometa-${pkgver}/"* "${pkgdir}/usr/lib/kometa"

  #find "${pkgdir}/usr/lib/kometa" -type d -exec chmod 755 {} \;
  #find "${pkgdir}/usr/lib/kometa" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/usr/lib/kometa/kometa.py"

  install -D -m 644 "${srcdir}/kometa.service" "${pkgdir}/usr/lib/systemd/system/kometa.service"
  install -D -m 644 "${srcdir}/kometa.sysusers" "${pkgdir}/usr/lib/sysusers.d/kometa.conf"
  install -D -m 644 "${srcdir}/kometa.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/kometa.conf"
}
