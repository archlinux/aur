# Maintainer: Foppe Hemminga <foppe@hemminga.net>
# Contributer: ralix <ralix@gmx.de>
# Contributer: GutenYe <ywzhaifei@gmail.com>

pkgname=icinga
pkgver=1.13.2
pkgrel=1
pkgdesc="An open source host, service and network monitoring program."
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.icinga.org"
depends=('gd' 'freetype2' 'libtool' 'libdbi-drivers' 'openssl')
optdepends=('monitoring-plugins: plugins needed for icinga checks')
source=("https://github.com/Icinga/icinga-core/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz" 
        "icinga.install")

md5sums=('2a576e2391ce56426f3924c4053491e2'
         '57e5cdb21a148e55cb5ddb55e6e8812d')

install='icinga.install'

_icinga_user="icinga"
_icinga_group="icinga"

build() {
  if [ -z $(getent group _icinga_group) -a $(getent passwd _icinga_user) ]
    then 
    cat << DOC 
--> This script requires user icinga:icinga to exist
--> You can use the following commands to do create this user:
# groupadd -g 667 icinga
# useradd -u 667 -g icinga -G http -d /dev/null -s /bin/false icinga
DOC
   exit
  fi

  cd "$srcdir/$pkgname-$pkgver"

###
# Note for future packaging
# I want to use
# --with-systemd-unit-dir="/usr/lib/systemd/system" \
# but that doesn't seem to be implemented correctly. 
###

  ./configure \
    --prefix="/usr/share/icinga" \
    --bindir="/usr/bin" \
    --libdir="/usr/lib/icinga" \
    --sysconfdir="/etc/icinga" \
    --localstatedir="/var/spool/icinga" \
    --with-systemd-unit-dir="/usr/lib/systemd/system" \
    --with-systemd-config-dir="/etc/sysconfig/icinga" \
    --with-log-dir="/var/log/icinga" \
    --with-lockfile="/run/icinga.pid" \
    --with-checkresult-dir="/var/spool/icinga/checkresults" \
    \
    --with-icinga-user=${_icinga_user} \
    --with-icinga-group=${_icinga_group} \
    --datarootdir="/usr/share/webapps/icinga" \
    --sbindir="/usr/share/webapps/icinga/cgi-bin" \
    --with-web-user=http \
    --with-web-group=http \
    --with-httpd-conf="/etc/httpd/conf/extra" \
    --with-plugin-dir="/usr/lib/monitoring-plugins" \
    --with-cgi-log-dir="/var/log/icinga" \
    \
    --enable-idoutils \
    --with-ido2db-lockfile="/run/ido2db.pid" \
    --with-ido-sockfile="/var/spool/icinga/ido2db.sock" \
    --with-idomod-tmpfile="/run/idomod.tmp" \
    \
    --enable-embedded-perl \
    --enable-ssl

  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install install-idoutils install-config

  install -Dm644 sample-config/httpd.conf "$pkgdir/etc/icinga/apache.example.conf"
  install -Dm644 icinga-systemd "$pkgdir/usr/lib/systemd/system/icinga.service"
  install -Dm644 ido2db-systemd "$pkgdir/usr/lib/systemd/system/ido2db.service"
  install -Dm644 sysconfig-env "$pkgdir/etc/sysconfig/icinga"

  install -dm755 "$pkgdir/usr/share/icinga/idoutils"
  cp -r module/idoutils/db "$pkgdir/usr/share/icinga/idoutils"

  mkdir -p "$pkgdir/var/spool/icinga/rw"

  find "$pkgdir/etc/icinga" -name '*cfg' -exec mv "{}" "{}.sample" \; > /dev/null

  # Do some perms fixing
  find "$pkgdir/usr/share/icinga" -type f -exec chmod 644 "{}" \; > /dev/null
  find "$pkgdir/usr/share/icinga" -type d -exec chmod 755 "{}" \; > /dev/null
  find "$pkgdir/etc/icinga" -type f -exec chmod 644 "{}" \; > /dev/null
  find "$pkgdir/etc/icinga" -type d -exec chmod 755 "{}" \; > /dev/null
  chmod -R 755 "$pkgdir/usr/bin"
  chmod -R 755 "$pkgdir/usr/share/webapps/icinga/cgi-bin"
  chown ${_icinga_user}:http "$pkgdir/var/log/icinga"
  chmod 775 "$pkgdir/var/log/icinga"
  chmod 755 "$pkgdir/usr/lib/icinga/idomod.so"
  chown -R root:root "$pkgdir/etc"
  chown -R root:root "$pkgdir/usr/bin"
  chown -R root:root "$pkgdir/usr/share/icinga"
  chown -R ${_icinga_user}:${_icinga_group} "$pkgdir/var/spool/icinga"
}

