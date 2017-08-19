# Maintainer: Neil Romig <neilromig@gmail.com>
# Contributor: Bernd Prünster <aur@berndpruenster.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

# -----------  NOTE TO ALL USERS ------------
# Go read http://www.courier-mta.org/install.html b4 running or building courier

pkgname=courier-mta
pkgver=0.78.0
pkgrel=1
pkgdesc="IMAP(s)/POP3(s) and SMTP Server with ML-manager, webmail and webconfig"
arch=(i686 x86_64)
license=('GPL2')
url="http://courier-mta.org"
depends=('courier-authlib>=0.68' 'gamin' 'gcc-libs' 'gdbm' 'pcre' 'mime-types' 'ca-certificates')
optdepends=('libldap')
makedepends=('pam' 'expect' 'gnupg' 'libldap' 'gamin')
provides=('smtp-server' 'smtp-forwarder' 'imap-server' 'pop3-server' 'courier-imap' 'courier-maildrop')
conflicts=('courier-imap' 'smtp-forwarder' 'smtp-server' 'imap-server' 'courier-maildrop' 'ucspi-tcp')
options=(!libtool !staticlibs)
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
	courier-mkdhparams.service
	courier-mkdhparams.timer
	webmaild.service
	courier-courierfilter.service
	courier-mta.conf)
sha1sums=('f45eac5679e977591101f9f0fc7417e8ccf513e0'
          '160f270d8214ac39adc0d1618bc981c59f080adf'
          '71d07d57d3c211abf267be140ffb074ac2492448'
          '6b06348e019e8883bcac314169e920f156ed1fa4'
          '3c6e285fb83aaecab274ea313619cc7a6bf09e05'
          '74462efddede8262ec047eb21edada596d38732d'
          'e06cdb4014cb4c953dcedf6319eb31cc72a0c867'
          '315a26f6c74a9a1bbf9fdc1329095a15db0b5fc6'
          'd768b9759a2bca407cf225771c49a83428db2a2c'
          'feb094c689a0c37c68f3b0c7e2b88eb5d572209f'
          '7c6e687d1cefe3139274b39c659351a503a3adb3'
          '94703b7bb090754e78710df42f658407a5c0a798'
          '2c9a51fac9adb1bfb71a9d2b00e417dba4a0c249'
          'ba376789c8c5db6a709d2c4657b5bcf090417221')

build() {
  cd "${srcdir}/courier-${pkgver}"

  LDFLAGS+=",-L /usr/lib/courier-authlib -lcourierauth"

  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/courier \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --localstatedir=/var/spool/courier \
    --enable-unicode \
    --enable-workarounds-for-imap-client-bugs \
    --enable-mimetypes=/etc/mime.types \
    --with-piddir=/var/run/courier \
    --with-trashquota \
    --with-db=gdbm \
    --with-random=/dev/urandom \
    --without-ispell \
    --with-mailuser=courier \
    --with-mailgroup=courier \
    --with-certdb=/etc/ssl/certs/
  make
}

package() {
  cd "${srcdir}/courier-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # install the perftest-script for testings
  install -Dm 755 courier/perftest1 "${pkgdir}/usr/lib/courier/perftest1"

  # install sysconftool to perform the install-configure step after installation
  install -Dm 755 sysconftool "${pkgdir}/usr/lib/courier/sysconftool"

  # install pam files according to the layout used in Arch linux
  for _pamfile in "${pkgdir}"/etc/courier/*.authpam; do
    sed -i 's|/lib/security/pam_pwdb\.so|pam_unix.so|' "${_pamfile}"
    install -Dm 644 "${_pamfile}" "${pkgdir}"/etc/pam.d/$(basename "${_pamfile}" .authpam | sed "s/d$//")
    rm -f "${_pamfile}"
  done

  # Install systemd service files

  install -Dm 644 "${srcdir}/courier-imapd.service"		"${pkgdir}/usr/lib/systemd/system/courier-imapd.service"
  install -Dm 644 "${srcdir}/courier-imapd-ssl.service"		"${pkgdir}/usr/lib/systemd/system/courier-imapd-ssl.service"
  install -Dm 644 "${srcdir}/courier-pop3d.service"		"${pkgdir}/usr/lib/systemd/system/courier-pop3d.service"
  install -Dm 644 "${srcdir}/courier-pop3d-ssl.service"		"${pkgdir}/usr/lib/systemd/system/courier-pop3d-ssl.service"
  install -Dm 644 "${srcdir}/courier-esmtpd.service"		"${pkgdir}/usr/lib/systemd/system/courier-esmtpd.service"
  install -Dm 644 "${srcdir}/courier-esmtpd-ssl.service"	"${pkgdir}/usr/lib/systemd/system/courier-esmtpd-ssl.service"
  install -Dm 644 "${srcdir}/courier-esmtpd-msa.service"	"${pkgdir}/usr/lib/systemd/system/courier-esmtpd-msa.service"
  install -Dm 644 "${srcdir}/courier.service"			"${pkgdir}/usr/lib/systemd/system/courier.service"
  install -Dm 644 "${srcdir}/courier-courierfilter.service"	"${pkgdir}/usr/lib/systemd/system/courier-courierfilter.service"
  install -Dm 644 "${srcdir}/webmaild.service"			"${pkgdir}/usr/lib/systemd/system/webmaild.service"
  install -Dm 644 "${srcdir}/courier-mkdhparams.service"	"${pkgdir}/usr/lib/systemd/system/courier-mkdhparams.service"
  install -Dm 644 "${srcdir}/courier-mkdhparams.timer"		"${pkgdir}/usr/lib/systemd/system/courier-mkdhparams.timer"

  # pacman gives an error for /var/run file conflict. Circumvent this by removing the directory
  rm -rf "${pkgdir}/var/run"

  # Install systemd configuration file which will set up empty /run/courier directory (and clean up after uninstall)

  install -Dm 644 "$srcdir/courier-mta.conf" "$pkgdir/usr/lib/tmpfiles.d/courier-mta.conf"

  # create password file for webadmin -> standard archwebadmin

  echo archwebadmin > "${pkgdir}/etc/courier/webadmin/password"
  chown courier:courier "${pkgdir}/etc/courier/webadmin/password"
  chmod 400 "${pkgdir}/etc/courier/webadmin/password"

  # install the imapd binary as /usr/lib/courier/courierimapd and modify usr/share scripts.
  # courier-mta by default installs usr/bin/imapd as the binary, usr/share/imapd as script file and usr/sbin/imapd as link to /usr/share/imapd
  # hence the binary gets overwritten by the link because Arch bin and sbin are same location
  install -m 755 "${srcdir}/courier-${pkgver}/courier/imapd" "${pkgdir}/usr/lib/courier/courierimapd"
  sed -i 's/\/usr\/bin\/imapd/\/usr\/lib\/courier\/courierimapd/' "${pkgdir}/usr/share/imapd" "${pkgdir}/usr/share/imapd-ssl"
}
