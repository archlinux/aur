# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=mozilla-firefox-sync-server
pkgver=1.7.0
pkgrel=1
pkgdesc="Mozilla Sync Server for built-in Firefox Sync"
arch=('any')
url='http://docs.services.mozilla.com/howtos/run-sync-1.5.html'
license=('GPL')
depends=('python2' 'python-virtualenv')
makedepends=('git')
options=(!debug)
conflicts=('mozilla-firefox-sync-server-hg')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mozilla-services/syncserver/archive/v${pkgver}.tar.gz"
        'ffsync.service'
        'ffsync.tmpfiles')
sha512sums=('c66aed1195138f15729ed7ef3fb31837bd74f751c0df4f93d0d6c3a8b34687d7dc02e201cfb6c218aab1d769698950ea316f688b51d90b87e8c495d573b85cc3'
            'ccc56d118dce78aed3595577b489d984d1d697e6aa4cb9e2f30c7f16caaf2d2145d1e6bbabc737a867d5c5257cfa57ef0a031b11bc22c11b25523e7d889492d8'
            'a06ac68b5379de3352369c998ef73d0ff4ef4517243e8f7856435ec21937b86af6f3b5c216cce585ea6b572043b313c70b76bd183e89ed5e48916ff209d2ac30')
backup=('opt/mozilla-firefox-sync-server/syncserver.ini')

prepare() {
  cd "syncserver-${pkgver}"

  # Change default sqlite database location
  sed -i "s|/tmp/syncserver.db|/var/lib/ffsync/sync_storage.db|g" syncserver.ini
}

build() {
  cd "syncserver-${pkgver}"
  make build

  # PostgreSQL support
  # local/bin/pip install psycopg2

  # There is no install target in the Makefile, so let's do some cleaning
  rm -rf .git .gitignore Dockerfile Makefile MANIFEST.in README.rst setup.py \
    local/bin/pep8 local/bin/build* local/bin/easy_install* local/bin/pip* \
    local/COMPLETE

  # Remove compiled python files as they may cause issues
  find . -name '*.pyc' -delete

  # Manually fix install path
  find . -type f -exec sed -i "s|${srcdir}/${pkgname}|/opt/${pkgname/-git}|g" {} \;
}

check() {
  cd "syncserver-${pkgver}"

  #make test
}

package() {
  cd "syncserver-${pkgver}"

  # There is no install target in the Makefile, installing manually
  install -dm 755 "${pkgdir}"/opt/${pkgname/-git} "${pkgdir}"/var/lib/ffsync
  cp -a * "${pkgdir}"/opt/${pkgname/-git}

  # Manually fix permissions
  cd "${pkgdir}"/opt/${pkgname/-git}
  find . -exec chmod go-w {} \;
  find . -type f -exec chmod a+r {} \;

  install -Dm 644 "${srcdir}"/ffsync.service "${pkgdir}"/usr/lib/systemd/system/ffsync.service
  install -Dm 644 "${srcdir}"/ffsync.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/ffsync.conf
}

# vim: ft=sh syn=sh  ts=2 sw=2 et:
