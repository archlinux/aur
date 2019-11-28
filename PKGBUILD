# Maintainer: TC <crt@archlinux.email>
pkgname=ossec-hids
pkgver=3.5.0
pkgrel=1
pkgdesc="Open Source Host-based Intrusion Detection System"
arch=('any')
url="https://ossec.github.io/"
license=('GPL2')
depends=('openssl')
optdepends=('geoip-database-extra')
backup=('var/ossec/etc/ossec.conf'
        'var/ossec/etc/client.keys'
        'var/ossec/rules/local_rules.xml')
install=ossec.install
options=('emptydirs')
source=(https://github.com/ossec/$pkgname/archive/$pkgver.tar.gz \
        ossec.service
        config)
sha256sums=('720458e7da9fb1437efab3030a3bd42ca84dc652dd1931dedce745456d40e1ad'
            'be5f6fe7e10603a0897c2502e0e6913fbb544a66f59674aaaef87d0f31d09eb9'
            'c919180fd99a7918aa9877802acf6dc4e7769a1b7b156630329f01ff57e87240')

_instdir=/var/ossec

_preparevars() {
  export USER_INSTALL_TYPE=server # (server, agent, local, hybrid?)
  export USER_NO_STOP=yes
  export USER_DIR=$_instdir
  export USER_BINARYINSTALL=x
  export USE_GEOIP=1
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  _preparevars
  . "$srcdir/config" # load configuration

  # fix placement of ossec-init.conf
  sed -i "s|^OSSEC_INIT.*|OSSEC_INIT=\"$pkgdir/etc/ossec-init.conf\"|" src/init/shared.sh

  cd src
  make TARGET=$USER_INSTALL_TYPE USE_GEOIP=$USE_GEOIP
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  _preparevars
  . "$srcdir/config" # load configuration

  # install -dm755 "$pkgdir/etc"
  mkdir -p $pkgdir/etc
  USER_DIR="$pkgdir/$_instdir" ./install.sh

  # fix DIRECTORY path in ossec-init.conf
  sed -i '/DIRECTORY=/c\DIRECTORY="/var/ossec"' "$pkgdir/etc/ossec-init.conf"

  # install systemd service unit
  install -Dm0644 "$srcdir/ossec.service" "$pkgdir/usr/lib/systemd/system/ossec.service"
  # install license
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/ossec-hids/LICENSE

  # change user permissions
  find "$pkgdir" -user nobody -exec chown 524 '{}' ';'
  find "$pkgdir" -user mail -exec chown 525 '{}' ';'
  find "$pkgdir" -user daemon -exec chown 526 '{}' ';'
  # change group permissions
  find "$pkgdir" -group nobody -exec chgrp 525 '{}' ';'

  grep -FRlZ "$startdir" "$pkgdir" | \
    xargs -0 -- sed -i "s|$startdir|/tmp/build|g"
}
