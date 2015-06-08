# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Archist archist@die-optimisten.net
# Contributor: C Anthony Risinger
pkgname=('zarafa-server' 'zarafa-webaccess')
pkgver=7.1.12
_pkgrel=48726
pkgrel=1
pkgdesc="Open Source Groupware Solution"
arch=('x86_64' 'i686')
url="http://www.zarafa.com/"
license=('AGPL3')
makedepends=('libical' 'php' 'e2fsprogs' 'openldap' 'automake' 'swig' 'zarafa-libvmime' 'mysql' 'python2' 'kyotocabinet' 'clucene' 'boost')
optdepends=('php: for webaccess')
install=${pkgname}.install
source=("zarafa-${pkgver}.tar.gz::http://download.zarafa.com/community/final/7.1/${pkgver}-${_pkgrel}/sourcecode/zcp-${pkgver}.tar.gz"
	"zarafa-server.service"
	"zarafa-ical.service"
        "zarafa-gateway.service"
        "zarafa-spooler.service"
        "zarafa-dagent.service"
        "zarafa-7.1.12-licensed-archiver.patch")

md5sums=('98ceed8b35a68bba669aecccbc7b1f43'
         '0e2728f1e35b25ca679427fcb57315d8'
         'c25f3982217fe390d68ed9003a5988ed'
         '705ada3a8c4b904696e0c461c131b4f7'
         '846b76e5cb0239a488c81e11d74ad08b'
         '9666bf713645af11dd65b3ac5cbb42d9'
         '36b88a6b61b3e40eb9e133fd0e59d80e')

prepare() {
  cd ${srcdir}/zarafa-${pkgver}

  sed -i 's/python setup.py/python2 setup.py/' swig/python/Makefile.in
  sed -i 's/python setup.py/python2 setup.py/' swig/python/Makefile.am

  patch -Np1 -i $srcdir/zarafa-7.1.12-licensed-archiver.patch

  # Disable search, doesn't compile due to a boost error
  cd ${srcdir}/zarafa-${pkgver}/ECtools/
  sed -i 's/zarafa-search//g' Makefile.in
  sed -i 's/zarafa-search//g' Makefile.am
}

build() {
  cd ${srcdir}/zarafa-${pkgver}

  msg "Starting build..."
  CPPFLAGS=-I/usr/include/python2.7 ./configure --prefix=/usr \
    --enable-python \
    --enable-swig \
    --with-python=/usr/bin/python2 \
    --disable-debug \
    --enable-unicode \
    --disable-static \
    --with-userscript-prefix=/etc/zarafa/userscripts \
    --with-quotatemplate-prefix=/etc/zarafa/quotamails \
    --with-searchscripts-prefix=/etc/zarafa/searchscripts

  make
}


package_zarafa-server() {
  pkgdesc="Open Source Groupware Solution"
  depends=('libical>=0.44' 'mysql' 'curl' 'libxml2' 'openssl' 'openldap' 'krb5' 'libical'
	 'boost-libs' 'python2' 'kyotocabinet' 'zarafa-libvmime' 'libmariadbclient')
  optdepends=('openldap: ldap backend')
  backup=('etc/zarafa/server.cfg'
	'etc/zarafa/dagent.cfg'
	'etc/zarafa/gateway.cfg'
	'etc/zarafa/monitor.cfg'
	'etc/zarafa/spooler.cfg'
	'etc/zarafa/ical.cfg')

  cd ${srcdir}/zarafa-${pkgver}

  make DESTDIR=${pkgdir} install
  # Finalize
  install -m 755 -o root -g root -d ${pkgdir}/var/log/zarafa
  install -m 755 -o root -g root -d ${pkgdir}/var/lib/zarafa

  # move /var/lib to the right place related to https://jira.zarafa.com/browse/ZCP-12249
  #mv  $pkgdir/usr/var/lib/zarafa/* $pkgdir/var/lib/zarafa/
  #rm -rf $pkgdir/usr/var

  # Systemd files
  install -d  ${pkgdir}/usr/lib/systemd/system
  install -m 755 $srcdir/zarafa-server.service ${pkgdir}/usr/lib/systemd/system
  install -m 755 $srcdir/zarafa-ical.service ${pkgdir}/usr/lib/systemd/system
  install -m 755 $srcdir/zarafa-spooler.service ${pkgdir}/usr/lib/systemd/system
  install -m 755 $srcdir/zarafa-dagent.service ${pkgdir}/usr/lib/systemd/system
  install -m 755 $srcdir/zarafa-gateway.service ${pkgdir}/usr/lib/systemd/system

  # Remove unused /usr/etc related to https://jira.zarafa.com/browse/ZCP-12249
  #rm -rf $pkgdir/usr/etc

  # copy example configs to their active locations
  for cfg in ${pkgdir}/usr/share/doc/zarafa/example-config/*.cfg; do
    install -m 755 -o root -g root -D ${cfg} ${pkgdir}/etc/zarafa
  done
}

package_zarafa-webaccess() {
  pkgdesc="Webaccess client for the Zarafa Open Source Groupware Solution"
  depends=('zarafa-server')

  # Webaccess
  install -d ${pkgdir}/etc/httpd/conf/extra/
  install -m 755 ${srcdir}/zarafa-${pkgver}/php-webclient-ajax/zarafa-webaccess.conf ${pkgdir}/etc/httpd/conf/extra/zarafa-webaccess.conf
  install -m 755 -d ${pkgdir}/usr/share/zarafa-webaccess/

  cp -r ${srcdir}/zarafa-${pkgver}/php-webclient-ajax/* ${pkgdir}/usr/share/zarafa-webaccess/
  mv ${pkgdir}/usr/share/zarafa-webaccess/config.php.dist ${pkgdir}/usr/share/zarafa-webaccess/config.php
}
