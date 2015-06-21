# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ossec-agent
pkgver=2.8.2
pkgrel=1
pkgdesc="Open Source Host-based Intrusion Detection System"
arch=('i686' 'x86_64')
url="http://www.ossec.net/"
license=('GPL3')
depends=('openssl')
backup=('var/ossec/etc/ossec.conf')
install=ossec.install
options=('emptydirs')
source=(http://www.ossec.net/files/ossec-hids-$pkgver.tar.gz \
        ossec.service config)
md5sums=('3036d5babc96216135759338466e1f79'
         '4a197f7f05b2a1d0da54e4fdef1718a5'
         'ff3c9d0cec6fbd907e4c301625cb4112')

_instdir=/var/ossec

_preparevars() {
  export USER_NO_STOP=yes
  export USER_LANGUAGE=en
  export USER_INSTALL_TYPE=agent
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
  sed -i "s|^DIR=.*|DIR=$pkgdir/$_instdir|" src/InstallAgent.sh

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
