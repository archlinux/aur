# Maintainer: MartiMcFly martimcfly@autorisation.de
# Contributor: C Anthony Risinger

pkgname=('zarafa-server-arm')
pkgver=7.2.0
_pkgmajver=7.2
_pkgrev=${pkgver}-48204
pkgrel=10
pkgdesc="Open Source Groupware Solution"
arch=('arm'
      'armv7h'
      'armv6h'
      'x86_64'
      'i686')
url="http://www.zarafa.com/"
license=('AGPL3')
provides=("zarafa-server=${pkgver}")
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
         'mariadb')
makedepends=('gcc<5.0.0')
optdepends=('zarafa-webaccess'
	    'zarafa-webapp'
	    'sabre-zarafa'
	    'z-push')
install=("install")
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

prepare() {
  cd ${srcdir}/zarafa-${pkgver}

  if [[ $CARCH == arm* ]]
  then
   echo "Patching for ${CARCH}"
   # https://forums.zarafa.com/showthread.php?8651-Raspberry-P
   patch -p1 <${srcdir}/arm.diff
  fi
}

build() {
  cd ${srcdir}/zarafa-${pkgver}

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

  # prepare application
  cd ${srcdir}/zarafa-${pkgver}
  sed -i -e "s/\(install-ajax-webaccess\:\)/void-ajax-webaccess\:/" Makefile
  make DESTDIR=${pkgdir} install || return 1

  # This isn't really a PEAR package... but Arch's default PHP config has open_basedir restrictions
  # and I doubt there will ever be a MAPI PEAR package to conflict, so one less thing user will have to do
  mv ${pkgdir}/usr/share/php ${pkgdir}/usr/share/pear

  # prepare libraries
  cp -R ${pkgdir}/usr/var ${pkgdir}/var
  rm -Rf ${pkgdir}/usr/var
  
  # pepare settings
  cp -R ${pkgdir}/usr/etc/* ${pkgdir}/etc
  rm -Rf ${pkgdir}/usr/etc
  rm ${pkgdir}/etc/zarafa/*.cfg
 
  # => change to socket connections only
  sed -i -e "s/\(server_tcp_enabled\s*=\)\(.*$\)/\1 no/" ${pkgdir}/usr/share/doc/zarafa/example-config/server.cfg
  sed -i -e "s/\(attachment_compression\s*=\)\(.*$\)/\1 0/" ${pkgdir}/usr/share/doc/zarafa/example-config/server.cfg
  sed -i -e "s/\(search_enabled\s*=\)\(.*$\)/\1 no/" ${pkgdir}/usr/share/doc/zarafa/example-config/server.cfg
  sed -i -e "s/\(disabled_features\s*=\)\(.*$\)/\1 pop3/" ${pkgdir}/usr/share/doc/zarafa/example-config/server.cfg
  sed -i -e "s/\(mysql_socket\s*=\)\(.*$\)/\1 \/run\/mysqld\/mysqld.sock/" ${pkgdir}/usr/share/doc/zarafa/example-config/server.cfg
  sed -i -e "s/\(mysql_user\s*=\)\(.*$\)/\1 zarafa/" ${pkgdir}/usr/share/doc/zarafa/example-config/server.cfg
  sed -i -e "s/\(mysql_password\s*=\)\(.*$\)/\1 zarafa/" ${pkgdir}/usr/share/doc/zarafa/example-config/server.cfg

  for cfg in ${pkgdir}/usr/share/doc/zarafa/example-config/*.cfg; do
   sed -i -e "s/\(server_socket\s*=\)\(.*$\)/\1 file:\/\/\/var\/run\/zarafa/" ${cfg}
   sed -i -e "s/\(ssl_protocols\s*=\)\(.*$\)/\1 TLSv1 TLSv1\.1 TLSv1\.2/" ${cfg}
   sed -i -e "s/\(ssl_ciphers\s*=\)\(.*$\)/\1 AES256\+EECDH:AES256\+EDH:\!aNULL/" ${cfg}
   sed -i -e "s/\(ssl_prefer_server_ciphers\s*=\)\(.*$\)/\1 yes/" ${cfg}
   sed -i -e "s/\(ssl_certificate_file\s*=\)\(.*$\)/\1 \/etc\/ssl\/private\/zarafa.crt/" ${cfg}
   sed -i -e "s/\(ssl_private_key_file\s*=\)\(.*$\)/\1 \/etc\/ssl\/private\/zarafa.key/" ${cfg}
  done
 
  # => change running user for services
  for cfg in ${pkgdir}/usr/share/doc/zarafa/example-config/{server.cfg,spooler.cfg}; do
   sed -i -e "s/\(run_as_user\s*=\)\(.*$\)/\1 zarafa/" ${cfg}
   sed -i -e "s/\(run_as_group\s*=\)\(.*$\)/\1 zarafa/" ${cfg}
  done
  
  for cfg in ${pkgdir}/usr/share/doc/zarafa/example-config/{dagent.cfg,gateway.cfg,ical.cfg}; do
   sed -i -e "s/\(run_as_user\s*=\)\(.*$\)/\1 http/" ${cfg}
   sed -i -e "s/\(run_as_group\s*=\)\(.*$\)/\1 http/" ${cfg}
  done


  # prepare logging
  mkdir -p ${pkgdir}/var/log/zarafa
  
  # prepare systemd services
  mkdir -p  ${pkgdir}/usr/lib/systemd/system
  cp ${srcdir}/zarafa-server.service ${pkgdir}/usr/lib/systemd/system
  cp ${srcdir}/zarafa-ical.service ${pkgdir}/usr/lib/systemd/system
  cp ${srcdir}/zarafa-dagent.service ${pkgdir}/usr/lib/systemd/system
  cp ${srcdir}/zarafa-gateway.service ${pkgdir}/usr/lib/systemd/system
  cp ${srcdir}/zarafa-spooler.service ${pkgdir}/usr/lib/systemd/system
  
}
