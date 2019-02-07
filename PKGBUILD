# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=mozilla-firefox-sync-server-git
pkgver=1.8.0.r32.gbebd2f3
pkgrel=1
pkgdesc="Mozilla Sync Server for built-in Firefox Sync - 1.5+ version for Firefox 29+"
arch=('i686' 'x86_64')
url='http://docs.services.mozilla.com/howtos/run-sync-1.5.html'
license=('GPL')
depends=('python2' 'python2-virtualenv')
makedepends=('git')
options=(!debug)
conflicts=('mozilla-firefox-sync-server-hg')
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/mozilla-services/syncserver"
        'ffsync.service'
        'ffsync.tmpfiles')
sha256sums=('SKIP'
            '8664ad8361d6751aad47e86900270d2efd8b65d520248cd1c164432baba42212'
            '462bfdccc672339a03622dbe0a76a2df1b4293de8b240e82fe127a6befaa1a89')
sha384sums=('SKIP'
            'a7384b5b55b2377ee4445e45bfd0545435c2a6a19730ff4219340e3c6e8a3b51fcb46e4215093df860f9fa99a0b471ab'
            '236b285f7e390d31cd13a0ac78c524acfbc8a7325d7b0b114b39f69a5963535d5f1f73bdef575728b2f6e81860c4ea16')
backup=('opt/mozilla-firefox-sync-server/syncserver.ini')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}

  # Change default sqlite database location
  sed -i "s|/tmp/syncserver.db|/var/lib/ffsync/sync_storage.db|g" syncserver.ini
}

build() {
  cd ${pkgname}
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
  cd ${pkgname}

  #make test
}

package() {
  cd ${pkgname}

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
