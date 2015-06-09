# Maintainer: Timothée Ravier <tim@siosm.fr>
# Contributors: sergej, waddles, eigengrau, untitaker

pkgname=mozilla-firefox-sync-server-hg
pkgver=549.ba4bf783018f
pkgrel=1
pkgdesc="Mozilla Sync Server for built-in Firefox Sync - 1.1 version for Firefox <29"
arch=('i686' 'x86_64')
url='http://docs.services.mozilla.com/howtos/run-sync.html'
license=('GPL')
depends=('python2-virtualenv')
makedepends=('mercurial')
options=(!debug)
conflicts=('mozilla-firefox-sync-server-git')
install=${pkgname}.install
source=("${pkgname}::hg+https://hg.mozilla.org/services/server-full"
        'ffsync.service')
sha256sums=('SKIP'
            'c460ff42a1beeeef50fdb800dcc83be82fccc776d2e0756f00b45a0db9387cf3')
backup=('opt/mozilla-firefox-sync-server/development.ini'
        'opt/mozilla-firefox-sync-server/etc/sync.conf')

pkgver() {
  cd ${pkgname}
  echo "$(hg identify -n).$(hg identify -i)"
}

prepare() {
  cd ${pkgname}

  # Change default log file location
  sed -i "s|/tmp/sync-error.log|/var/log/ffsync/sync-error.log|g" development.ini

  # Change default sqlite database location
  sed -i "s|/tmp/test.db|/var/lib/ffsync/sync_storage.db|g" etc/sync.conf

  # Use HTTPS for pypi
  sed -i "s|http://pypi.python.org/simple|https://pypi.python.org/simple|g" Makefile
}

build() {
  cd ${pkgname}
  make build VIRTUALENV=virtualenv2

  # Install gunicorn to use with nginx
  bin/easy_install gunicorn

  # There is no install rule in the Makefile, so let's do some cleaning
  rm -rf .hg .hgignore .hgtags \
    _build.py build.py CENTOS.txt dev-reqs.txt Makefile \
    tests tests*.ini tools \
    bin/build* bin/easy_install* bin/pip* bin/pypi2rpm.py

  # Remove all mercurial folders
  rm -rf deps/{server-core,server-reg,server-storage}/.hg

  # Remove compiled python files as they may cause issues
  find . -name '*.pyc' -delete

  # Manually fix install path
  find . -type f -exec sed -i "s|${srcdir}/server-full|/opt/${pkgname/-hg}|g" {} \;
  find . -type f -exec sed -i "s|${srcdir}/${pkgname}|/opt/${pkgname/-hg}|g" {} \;
}

package() {
  install -Dm 644 ffsync.service "${pkgdir}"/usr/lib/systemd/system/ffsync.service

  install -dm 755 "${pkgdir}"/opt/${pkgname/-hg}

  cd ${pkgname}
  cp -a ./* "${pkgdir}"/opt/${pkgname/-hg}

  # Manually fix permissions
  cd "${pkgdir}"/opt/${pkgname/-hg}
  find . -exec chmod go-w {} \;
  find . -type f -exec chmod a+r {} \;

  install -dm 0755 "${pkgdir}"/var/log/ffsync "${pkgdir}"/var/lib/ffsync
}

# vim: ft=sh syn=sh
