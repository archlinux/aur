# Maintainer: MartiMcFly martimcfly@autorisation.de
# Contributor: C Anthony Risinger

pkgname=zarafa-server-arm
pkgver=7.2.0
_pkgmajver=7.2
_pkgrev=${pkgver}-48204
pkgrel=2
pkgdesc="Open Source Groupware Solution"
arch=('any')
url="http://www.zarafa.com/"
license=('AGPL3')
depends=("zarafa-libical>=${pkgver}"
         "zarafa-libvmime>=${pkgver}"
	 'bison'
	 'flex'
	 'gettext'
	 'gsoap'
	 'boost'
         'curl'
         'icu'
         'ncurses'
         'openldap'
	 'openssl'
	 'libtool'
         'libxml2'
	 'php'
	 'libidn'
         'python'
	 'python2'
	 'swig'
	 'libutil-linux'
	 'xmlto'
	 'zlib'
	 'clucene'
	 'gperftools'
	 'perl'
	 'kyotocabinet'
         'krb5'
         'mysql')
optdepends=('zarafa-webapp'
	    'sabre-zarafa'
	    'z-push')
install=('install')
source=("zarafa-${pkgver}.tar.gz::http://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/zarafa-${pkgver}.tar.gz"
	"arm.diff"
	"zarafa-server.service"
	"zarafa-ical.service"
	"zarafa-dagent.service"
	"zarafa-spooler.service"
	"zarafa-gateway.service")

md5sums=('7dc8a526b3eb83e6eb5bbc9d2215b501'
         '5de9759477995d9940c056e56ed9d3f1'
         '0e2728f1e35b25ca679427fcb57315d8'
         'c25f3982217fe390d68ed9003a5988ed'
         '9666bf713645af11dd65b3ac5cbb42d9'
         '846b76e5cb0239a488c81e11d74ad08b'
         '705ada3a8c4b904696e0c461c131b4f7')

build() {
  cd ${srcdir}/zarafa-${pkgver}
  
  # https://forums.zarafa.com/showthread.php?8651-Raspberry-P
  patch -p1 <${srcdir}/arm.diff

  msg "Starting build..."
  CPPFLAGS=-I/usr/include/python2.7 ./configure --prefix=/usr \
    --enable-oss \
    --enable-release \
    --enable-python \
    --enable-unicode \
    --with-python=/usr/bin/python2 \
    --disable-debug \
    --disable-testtools \
    --disable-static \
    --disable-perl \
    --with-userscript-prefix=/etc/zarafa/userscripts \
    --with-quotatemplate-prefix=/etc/zarafa/quotamails \
    --with-sysconfdir=/etc

  # make/g++ doesnt pick up -luuid properly without this... even though configure
  # finds it, and -luuid is present in the actual command that fails...
  make LDFLAGS="-luuid" || return 1
}


package() {
  cd ${srcdir}/zarafa-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
  # This isn't really a PEAR package... but Arch's default PHP config has open_basedir restrictions
  # and I doubt there will ever be a MAPI PEAR package to conflict, so one less thing user will have to do
  mv ${pkgdir}/usr/share/php ${pkgdir}/usr/share/pear

  # Finalize
  install -m 755 -o root -g root -d ${pkgdir}/var/log/zarafa
  install -m 755 -o root -g root -d ${pkgdir}/var/lib/zarafa
  install -m 755 -o root -g root -d ${pkgdir}/var/lib/zarafa-webaccess

  mkdir -p  ${pkgdir}/usr/lib/systemd/system
  install -m 755 $startdir/zarafa-server.service ${pkgdir}/usr/lib/systemd/system
  install -m 755 $startdir/zarafa-ical.service ${pkgdir}/usr/lib/systemd/system
  install -m 755 $startdir/zarafa-dagent.service ${pkgdir}/usr/lib/systemd/system
  install -m 755 $startdir/zarafa-gateway.service ${pkgdir}/usr/lib/systemd/system
  install -m 755 $startdir/zarafa-spooler.service ${pkgdir}/usr/lib/systemd/system

  # copy example configs to their active locations
  for cfg in ${pkgdir}/usr/share/doc/zarafa/example-config/*.cfg; do
    install -m 755 -o root -g root -D ${cfg} ${pkgdir}/etc/zarafa
  done

  mkdir -p ${pkgdir}/etc/httpd/conf/extra/
  install -m 755 ${srcdir}/zarafa-${pkgver}/php-webclient-ajax/zarafa-webaccess.conf ${pkgdir}/etc/httpd/conf/extra/zarafa-webaccess.conf

  mkdir -p ${pkgdir}/usr/share/zarafa-webaccess/
  install -m 755 -d ${pkgdir}/usr/share/zarafa-webaccess/
  cp -r ${srcdir}/zarafa-${pkgver}/php-webclient-ajax/* ${pkgdir}/usr/share/zarafa-webaccess/
  mv ${pkgdir}/usr/share/zarafa-webaccess/config.php.dist ${pkgdir}/usr/share/zarafa-webaccess/config.php
  sed -i 's$/usr/share/php/$/usr/share/pear/$' ${pkgdir}/usr/share/zarafa-webaccess/config.php
}
