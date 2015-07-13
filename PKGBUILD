# Maintainer: Bernd Prünster <aur@berndpruenster.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

# -----------  NOTE TO ALL USERS ------------
# Go read http://www.courier-mta.org/install.html b4 running or building courier

pkgname=courier-mta
pkgver=0.75.0
pkgrel=1
pkgdesc="IMAP(s)/POP3(s) and SMTP Server with ML-manager, webmail and webconfig"
arch=(i686 x86_64)
license=('GPL2')
backup=('etc/courier/imapd.cnf' 'etc/courier/pop3d.cnf' \
        'etc/courier/imapd' 'etc/courier/imapd-ssl' \
        'etc/courier/pop3d' 'etc/courier/pop3d-ssl' \
        'etc/courier/courierd' 'etc/courier/sqwebmaild' \
        'etc/courier/esmtpd' 'etc/courier/esmtpd-ssl' \
        'etc/courier/esmtpd.cnf' 'etc/courier/esmtpd-msa' \
        'etc/courier/webadmin/password' 'etc/courier/esmtpauthclient' \
        'etc/conf.d/courier-mta')
url="http://courier-mta.org"
depends=('courier-authlib' 'gamin' 'gcc-libs' 'gdbm' 'pcre' 'mime-types' 'ca-certificates')
optdepends=('libldap')
makedepends=('pam' 'expect' 'gnupg' 'libldap' 'gamin')
provides=('smtp-server' 'smtp-forwarder' 'imap-server' 'pop3-server' 'courier-imap' 'courier-maildrop')
conflicts=('courier-imap' 'smtp-forwarder' 'smtp-server' 'imap-server' 'courier-maildrop' 'ucspi-tcp')
options=('!libtool')
install=courier-mta.install
source=(http://downloads.sourceforge.net/project/courier/courier/${pkgver}/courier-${pkgver}.tar.bz2
	courier-imapd.service
	courier-imapd-ssl.service
	courier-pop3d.service
	courier-pop3d-ssl.service
	courier-esmtpd.service
	courier-esmtpd-ssl.service
	courier-esmtpd-msa.service
	courier.service
	webmaild.service
	courier-courierfilter.service
	courier-imapd.conf)
sha1sums=('6e6f279530bcca09090cd9f6a47003a7421ba3ef'
	    '5e7f4bc751663069c773ec39bb2761c6bd506a95'
	    'f68f7c96abd83a78405227fa6dee20cefc8f6119'
	    '6a4617b334661ff6e1c83f5d2f83f467d59718d0'
	    'b7e0b0acb7ddb5f2874d33635497d33609eed40a'
	    'b9029eb07cb18768d66d6741d7bdf1a59878ef9c'
	    'af64a07a0ce852277556829129dcc3b3f7a6dfbe'
	    'd5918e95df3009091684597e38fbffd19a5786fe'
	    'd306d91b0e5f85d455683ce073282257fd89542f'
	    '262aea3a0436db6aff6a2b2c89fb7bb6a0b91f4b'
	    '997d34d07af2446f6283b183517cf3e2543c5f4a'
	    '72b81e3d330486e2e53ba11b498332a7bc7ea37e')

build() {
  cd ${srcdir}/courier-${pkgver}

  LDFLAGS+=",-L /usr/lib/courier-authlib -lcourierauth"
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/courier \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --localstatedir=/var/spool/courier \
    --disable-root-check \
    --enable-unicode \
    --enable-workarounds-for-imap-client-bugs \
    --enable-mimetypes=/etc/mime.types \
    --with-piddir=/var/run/courier \
    --with-locking-method=lockf \
    --with-trashquota \
    --with-db=gdbm \
    --with-trashquota \
    --with-random=/dev/urandom --without-ispell \
    --with-mailuser=courier --with-mailgroup=courier \
    --with-certdb=/etc/ssl/certs/
  make
}

package() {
  cd ${srcdir}/courier-${pkgver}

  #chown mail.mail ${pkgdir}/var/spool/courier
  make DESTDIR=${pkgdir} install
  # docs say we can get rid of those after make
  find ${pkgdir} -name '*\.a' -exec -rm -f {} \;
  # install the perftest-script for testings
  install -Dm755 courier/perftest1 ${pkgdir}/usr/lib/courier/perftest1
  ###############################################################################
  # this is what usually "make install-configure" does
  # *.dist files get rid of "dist"
  for distfile in ${pkgdir}/etc/courier/*.dist; do
    mv ${distfile} ${pkgdir}/etc/courier/$(basename ${distfile} .dist)
  done
  # install pam files according to the layout used in Archlinux
  for pamfile in ${pkgdir}/etc/courier/*.authpam; do
    sed -i 's|/lib/security/pam_pwdb\.so|pam_unix.so|' ${pamfile}
    #echo "password  required  pam_unix.so" >> $pamfile
    install -Dm 644 ${pamfile} \
      ${pkgdir}/etc/pam.d/$(basename ${pamfile} .authpam | sed "s/d$//")
    rm -f ${pamfile}
  done

  ###############################################################################
  # Arch Linux specific tweaks to make things easier for the user
  # create passwordfile for webadmin -> standard archwebadmin
  sed -i 's|/etc/courier/webadmin/password|$(DESTDIR)/etc/courier/webadmin/password|g' Makefile
  yes "archwebadmin" | make DESTDIR=${pkgdir} install-webadmin-password

  # Install systemd service files
  install -Dm 644 "${srcdir}/courier-imapd.service" 	"${pkgdir}/usr/lib/systemd/system/courier-imapd.service"
  install -Dm 644 "${srcdir}/courier-imapd-ssl.service" "${pkgdir}/usr/lib/systemd/system/courier-imapd-ssl.service"
  install -Dm 644 "${srcdir}/courier-pop3d.service" 	"${pkgdir}/usr/lib/systemd/system/courier-pop3d.service"
  install -Dm 644 "${srcdir}/courier-pop3d-ssl.service" "${pkgdir}/usr/lib/systemd/system/courier-pop3d-ssl.service"
  install -Dm 644 "${srcdir}/courier-esmtpd.service"	"${pkgdir}/usr/lib/systemd/system/courier-esmtpd.service"
  install -Dm 644 "${srcdir}/courier-esmtpd-ssl.service" "${pkgdir}/usr/lib/systemd/system/courier-esmtpd-ssl.service"
  install -Dm 644 "${srcdir}/courier-esmtpd-msa.service" "${pkgdir}/usr/lib/systemd/system/courier-esmtpd-msa.service"
  install -Dm 644 "${srcdir}/courier.service" 		"${pkgdir}/usr/lib/systemd/system/courier.service"
  install -Dm 644 "${srcdir}/courier.service" 		"${pkgdir}/usr/lib/systemd/system/courier.service"
  install -Dm 644 "${srcdir}/courier-courierfilter.service" "${pkgdir}/usr/lib/systemd/system/courier-courierfilter.service"
  install -Dm 644 "${srcdir}/webmaild.service" 		"${pkgdir}/usr/lib/systemd/system/webmaild.service"

  # Install systemd configuration files
  install -Dm 644 "$srcdir/courier-imapd.conf" "$pkgdir/usr/lib/tmpfiles.d/courier-imapd.conf"

   #install -Dm 655 ${srcdir}/courier-webmail-cleancache.cron.hourly \
   # ${pkgdir}/etc/cron.hourly/courier-webmail-cleancache
  # bug http://bugs.archlinux.org/task/5154
   find ${pkgdir}/usr/lib -name '*\.a' -exec rm -f {} \;
  # fixing some permissions
   chown -R courier:courier ${pkgdir}/usr/lib/courier/modules
   rm -r ${pkgdir}/var/run
   #chown -R courier:courier ${pkgdir}/var/run/courier
   chown root:root ${pkgdir}/usr/{.,bin,lib,share}

  # Recent fixes concerning imapd-binary, see https://aur.archlinux.org/packages/courier-mta/
  install -m 755 "${srcdir}/courier-${pkgver}/courier/imapd" "${pkgdir}/usr/lib/courier/courierimapd"
  sed -i 's/\/usr\/bin\/imapd/\/usr\/lib\/courier\/courierimapd/' "${pkgdir}/usr/share/imapd" "${pkgdir}/usr/share/imapd-ssl"
}
