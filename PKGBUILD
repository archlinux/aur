# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ossec-local
pkgver=2.9.0
pkgrel=1
pkgdesc="Open Source Host-based Intrusion Detection System"
arch=('i686' 'x86_64')
url="http://www.ossec.net/"
license=('GPL3')
depends=('openssl')
backup=('var/ossec/etc/ossec.conf')
install=ossec.install
options=('emptydirs')
source=(ossec-hids-$pkgver.tar.gz::https://github.com/ossec/ossec-hids/archive/$pkgver.tar.gz
        config)
sha256sums=('626d9b8d6dbddee8d99f4622d54a28849ef2014aa96e14c9d183a7a8dde1d9f2'
            '10d1cd8589d7aca030ea391b6cca312b91d5aa31f56e60a20b6a56652906db5c')

_instdir="/var/ossec"

_preparevars() {
  export USER_NO_STOP=yes
  export USER_LANGUAGE=en
  export USER_INSTALL_TYPE=local
  export USER_DIR=$_instdir
  export USER_BINARYINSTALL=x

  # Makefile variables
  # change user names and groups to the existing ones to make sure the installation works
  # the ownership is later changed id's for which appropriate users are created by the ossec.install
  export OSSEC_GROUP=nobody
  export OSSEC_USER=nobody
  export OSSEC_USER_MAIL=mail
  export OSSEC_USER_REM=daemon
}

prepare() {
  cd "$srcdir/ossec-hids-$pkgver"

  _preparevars

  # fix placement of ossec-init.conf for building
#  sed -i "s|^OSSEC_INIT.*|OSSEC_INIT=\"$srcdir/ossec-init.conf\"|" "src/init/shared.sh"

  # generate ossec-init.conf
  OSSEC_INIT="$srcdir/ossec-init.conf"
  INSTALLDIR=$_instdir
  INSTYPE=$USER_INSTALL_TYPE
  VERSION_FILE="./src/VERSION"
  VERSION=`cat ${VERSION_FILE}`
  echo "DIRECTORY=\"${INSTALLDIR}\"" > ${OSSEC_INIT}
  echo "VERSION=\"${VERSION}\"" >> ${OSSEC_INIT}
  echo "DATE=\"`date`\"" >> ${OSSEC_INIT}
  echo "TYPE=\"${INSTYPE}\"" >> ${OSSEC_INIT}
}

build() {
  cd "$srcdir/ossec-hids-$pkgver"

  # prepare build and load configuration
  _preparevars
  . "$srcdir/config"

  cd src
  make TARGET=$USER_INSTALL_TYPE
}

package() {
  cd "$srcdir/ossec-hids-$pkgver"

  # prepare build and load configuration
  _preparevars
  . "$srcdir/config"

  # install
  cd src
  make TARGET=$USER_INSTALL_TYPE PREFIX="$pkgdir/$_instdir" install
  install -D -m640 "$srcdir/ossec-init.conf" "$pkgdir/etc/ossec-init.conf"

  # install systemd stuff
  cd systemd/server/
  for service in * ; do
    install -D -m644 "$service" "$pkgdir/usr/lib/systemd/system/$service"
  done
}
