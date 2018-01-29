# Submitter: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Maintainer: Sujeet Akula <sujeet@freeboson.org>
pkgname=ossec-local
pkgver=2.9.3
pkgrel=1
pkgdesc="Open Source Host-based Intrusion Detection System"
arch=('i686' 'x86_64')
url="http://www.ossec.net/"
license=('GPL3')
depends=('openssl')
backup=('var/ossec/etc/ossec.conf')
install=ossec.install
options=('emptydirs')
source=(
    "ossec-hids-$pkgver.tar.gz"::"https://github.com/ossec/ossec-hids/archive/$pkgver.tar.gz"
    "https://github.com/ossec/ossec-hids/releases/download/$pkgver/ossec-hids-$pkgver.tar.gz.asc"
    config
)
md5sums=(
    '5ea64f58d1a6c5c20cadc449d0616f56'  # ossec-hids-2.9.3.tar.gz
    'SKIP'                              # ossec-hids-2.9.3.tar.gz.asc
    '510463fc82537b59a45fe55993e6d712'  # config
)
sha256sums=(
    '6b70a8f93fc2412bfc34a793a53b4d22323568866c09fde87c7d3a9d04e3b313'  # ossec-hids-2.9.3.tar.gz
    'SKIP'                                                              # ossec-hids-2.9.3.tar.gz.asc
    '10d1cd8589d7aca030ea391b6cca312b91d5aa31f56e60a20b6a56652906db5c'  #  config
)
sha512sums=(
    '4c98d9f7c94e4a25966b73d9c7348039dd4da5e22d3361abc7811f648986383c262fffe72339db8af2a57fdf3debd4285afccbdef5befad3bde9f0e7acf8b6d7'	# ossec-hids-2.9.3.tar.gz
    'SKIP'                                                              																# ossec-hids-2.9.3.tar.gz.asc
	'8947b8407e6d7545c18b7d7390e7ea2f170743c1beffc7a7ed575c9ffbc24ec8f9c6ab21765eae39a56304afeb8733e88bea2abf7bb788142872abdb877d34bc'  # config
)
validpgpkeys=(
    'B50FB1947A0AE31145D05FADEE1B0E6B2D8387B7'  # Scott R. Shinn <scott@atomicorp.com>
)
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
