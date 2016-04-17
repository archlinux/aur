# Maintainer: Bernd Prünster <aur@berndpruenster.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

# -----------  NOTE TO ALL USERS ------------
# Go read http://www.courier-mta.org/install.html b4 running or building courier

pkgname=courier-mta
pkgver=0.75.0
pkgrel=5
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
depends=('courier-authlib' 'gamin' 'gcc-libs' 'gdbm' 'pcre' 'mime-types' 'ca-certificates' 'gnutls')
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
	    '160f270d8214ac39adc0d1618bc981c59f080adf'
	    '71d07d57d3c211abf267be140ffb074ac2492448'
	    '6b06348e019e8883bcac314169e920f156ed1fa4'
	    '3c6e285fb83aaecab274ea313619cc7a6bf09e05'
	    '74462efddede8262ec047eb21edada596d38732d'
	    'e06cdb4014cb4c953dcedf6319eb31cc72a0c867'
	    '315a26f6c74a9a1bbf9fdc1329095a15db0b5fc6'
	    'd768b9759a2bca407cf225771c49a83428db2a2c'
	    '94703b7bb090754e78710df42f658407a5c0a798'
	    '2c9a51fac9adb1bfb71a9d2b00e417dba4a0c249'
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
    --with-certdb=/etc/ssl/certs/ --with-gnutls
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
   chown  root:root ${pkgdir}/usr/{.,bin,lib,share}

  # Recent fixes concerning imapd-binary, see https://aur.archlinux.org/packages/courier-mta/
  install -m 755 "${srcdir}/courier-${pkgver}/courier/imapd" "${pkgdir}/usr/lib/courier/courierimapd"
  sed -i 's/\/usr\/bin\/imapd/\/usr\/lib\/courier\/courierimapd/' "${pkgdir}/usr/share/imapd" "${pkgdir}/usr/share/imapd-ssl"
}
