# Maintainer: TC <crt@archlinux.email>
# Former Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ossec-hids
pkgver=2.9.3
pkgrel=1
pkgdesc="Open Source Host-based Intrusion Detection System"
arch=('any')
url="https://ossec.github.io/"
license=('GPL2')
depends=('openssl')
backup=('var/ossec/etc/ossec.conf')
install=ossec.install
options=('emptydirs')
source=(https://github.com/ossec/$pkgname/archive/$pkgver.tar.gz \
        ossec.service
        config)
sha256sums=('6b70a8f93fc2412bfc34a793a53b4d22323568866c09fde87c7d3a9d04e3b313'
            'be5f6fe7e10603a0897c2502e0e6913fbb544a66f59674aaaef87d0f31d09eb9'
            '2700c08962a64009ab65b72282141244cdfd7d327c8e8bdde6f5fcc623fdf1b4')
_instdir=/var/ossec

_preparevars() {
  export USER_INSTALL_TYPE=server # (server, agent, local, hybrid?)
  export USER_NO_STOP=yes
  export USER_DIR=$_instdir
  export USER_BINARYINSTALL=x
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  _preparevars
  . "$srcdir/config" # load configuration

# fix placement of ossec-init.conf
sed -i "s|^OSSEC_INIT.*|OSSEC_INIT=\"$pkgdir/etc/ossec-init.conf\"|" src/init/shared.sh

cd src
make TARGET=$USER_INSTALL_TYPE
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  _preparevars
  . "$srcdir/config" # load configuration

#  install -dm755 "$pkgdir/etc"
  mkdir -p $pkgdir/etc
 USER_DIR="$pkgdir/$_instdir" ./install.sh

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
