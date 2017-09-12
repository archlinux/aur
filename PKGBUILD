# Maintainer: Tony C <crt@archlinux.email>
# Former Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ossec-hids
pkgver=2.9.1
pkgrel=1
pkgdesc="Open Source Host-based Intrusion Detection System"
arch=('i686' 'x86_64')
url="https://ossec.github.io/"
license=('GPL2')
depends=('openssl')
backup=('var/ossec/etc/ossec.conf')
install=ossec.install
options=('emptydirs')
source=(https://github.com/ossec/$pkgname/archive/$pkgver.tar.gz \
        ossec.service 
        config)
sha256sums=('ed5bc3483d5e864a8f8283f57127d1251b458c184e5b263be8be4c89f4cf85c3'
            'be5f6fe7e10603a0897c2502e0e6913fbb544a66f59674aaaef87d0f31d09eb9'
            'bf47f0919a2470f199cf731e68063939a59a31541c0ae3ebe87a561760f5f3f2')

_instdir=/var/ossec

_preparevars() {
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
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  _preparevars
  . "$srcdir/config" # load configuration

  mkdir -p $pkgdir/etc

  ./install.sh

  # install systemd service
  install -Dm0644 "$srcdir"/ossec.service "$pkgdir"/usr/lib/systemd/system/ossec.service

  # change the users
  find "$pkgdir" -user nobody -exec chown 524 '{}' ';'
  find "$pkgdir" -user mail -exec chown 525 '{}' ';'
  find "$pkgdir" -user daemon -exec chown 526 '{}' ';'
  # change the groups
  find "$pkgdir" -group nobody -exec chgrp 525 '{}' ';'
}
