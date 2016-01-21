# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ossec-server
pkgver=2.8.3
pkgrel=1
pkgdesc="Open Source Host-based Intrusion Detection System"
arch=('i686' 'x86_64')
url="http://www.ossec.net/"
license=('GPL3')
depends=('openssl')
backup=('var/ossec/etc/ossec.conf')
install=ossec.install
options=('emptydirs')
source=(https://bintray.com/artifact/download/ossec/ossec-hids/ossec-hids-$pkgver.tar.gz \
        ossec.service config)
sha256sums=('917989e23330d18b0d900e8722392cdbe4f17364a547508742c0fd005a1df7dd'
            'be5f6fe7e10603a0897c2502e0e6913fbb544a66f59674aaaef87d0f31d09eb9'
            'daa6447e8bff3ec1b700d25dd085696e3b5d8a2eec4bf56be9f1e8ca85b1c40c')

_instdir=/var/ossec

_preparevars() {
  export USER_NO_STOP=yes
  export USER_LANGUAGE=en
  export USER_INSTALL_TYPE=server
  export USER_DIR=$_instdir
  export USER_BINARYINSTALL=x
}

build() {
  cd "$srcdir/ossec-hids-$pkgver"

  _preparevars
  . "$srcdir/config" # load configuration

  # fix placement of ossec-init.conf
  sed -i "s|^OSSEC_INIT.*|OSSEC_INIT=\"$pkgdir/etc/ossec-init.conf\"|" src/init/shared.sh
  # change the install location
  sed -i "s|^DIR=.*|DIR=$pkgdir/$_instdir|" src/InstallServer.sh

  # change user names to existing users to make sure the installation works
  # the users are later changed to id's for which appropriate users are created by the ossec.install
  sed -i -e 's|^USER=.*|USER=nobody|' -e 's|^USER_MAIL=.*|USER_MAIL=mail|' \
    -e 's|^USER_REM=.*|USER_REM=daemon|' src/InstallServer.sh
  # change group name to nobody, group is created by ossec.install
  # this ensures install will work perfectly, the we will change the group later
  sed -i 's|^GROUP=.*|GROUP=nobody|' src/InstallServer.sh

  cd src
  make all
  make build
}

package() {
  cd "$srcdir/ossec-hids-$pkgver"

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
