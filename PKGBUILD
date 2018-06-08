# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=mozilla-firefox-sync-server
pkgver=1.8.0
pkgrel=1
pkgdesc="Mozilla Sync Server for built-in Firefox Sync"
arch=('any')
url='http://docs.services.mozilla.com/howtos/run-sync-1.5.html'
license=('GPL')
depends=('python2' 'python2-pyramid' 'python2-mozsvc' 'python2-konfig' 'python2-configparser' 'python2-tokenserver'
         'python2-simplejson' 'python2-paste-deploy' 'python2-syncstorage' 'python2-pyramid-hawkauth' 'python2-tokenlib' 'python2-sqlalchemy')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mozilla-services/syncserver/archive/${pkgver}.tar.gz")
sha512sums=('73f7e32e900fac5e8385b2b7b521aed964ec85879283733daf84a8afe194e1775b654074ae19e7bf574a2e41a01a821104a10f4c4794eecacffb7a903814e093')
backup=('etc/webapps/mozilla-firefox-sync-server/syncserver.ini')
install='mozilla-firefox-sync-server.install'
optdepends=('uwsgi-plugin-python2: Serve the webapp using uwsgi'
            'mozilla-firefox-account-server: Run your own firefox account server')

prepare() {
  cd "syncserver-${pkgver}"
  sed -i 's/tmp\/syncserver.db/var\/lib\/mozilla-firefox-sync-server\/syncserver.db/' syncserver.ini
  sed -i 's/^\#sqluri/sqluri/' syncserver.ini
}

package() {
  cd "syncserver-${pkgver}"
  python2 setup.py install --root "${pkgdir}"
  install -dm 755 "${pkgdir}/usr/share/webapps/mozilla-firefox-sync-server" "${pkgdir}/etc/webapps/mozilla-firefox-sync-server" \
    "${pkgdir}/var/lib/mozilla-firefox-sync-server"
  cp syncserver.wsgi "${pkgdir}/usr/share/webapps/mozilla-firefox-sync-server/"
  cp syncserver.ini "${pkgdir}/etc/webapps/mozilla-firefox-sync-server/"
  ln -s /etc/webapps/mozilla-firefox-sync-server/syncserver.ini "${pkgdir}/usr/share/webapps/mozilla-firefox-sync-server/"
}

# vim: ft=sh syn=sh  ts=2 sw=2 et:
