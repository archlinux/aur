# Maintainer: Neil Romig <neilromig@gmail.com>
# Contributor: Bernd Prünster <aur@berndpruenster.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

# -----------  NOTE TO ALL USERS ------------

# Go read http://www.courier-mta.org/install.html b4 running or building courier

# If upgrading, you must read the guidance at http://www.courier-mta.org/maildirmake.html on "Converting pre-unicode format maildirs"

pkgname=courier-mta
pkgver=1.0.5
pkgrel=1
pkgdesc="IMAP(s)/POP3(s) and SMTP Server with ML-manager, webmail and webconfig"
arch=(i686 x86_64)
license=('GPL2')
url="http://courier-mta.org"
depends=('courier-authlib>=0.68' 'courier-unicode>=2.1' 'gamin' 'gcc-libs' 'gdbm' 'pcre' 'mime-types' 'ca-certificates' 'libidn')
optdepends=('libldap')
makedepends=('pam' 'expect' 'gnupg' 'libldap' 'gamin')
provides=('smtp-server' 'smtp-forwarder' 'imap-server' 'pop3-server' 'courier-imap' 'courier-maildrop')
conflicts=('courier-imap' 'smtp-forwarder' 'smtp-server' 'imap-server' 'courier-maildrop' 'ucspi-tcp')
options=(!libtool !staticlibs)
# Specify some package files to backup that aren't managed by sysconftool during an upgrade
backup=('etc/courier/aliases/system' 'etc/courier/smtpaccess/default' 'etc/courier/webadmin/password' 'etc/courier/imapd.cnf' 'etc/courier/esmtpd.cnf' 'etc/courier/pop3d.cnf' 'etc/courier/esmtpauthclient')
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
sha1sums=('53ef0805b6c2a045ee66ad7f1898ab1f6cfec069'
          '9feaa269795a85c1464c104d9268fb266ad1a666'
          '0344ac948b189cae73d86f4565e40847c44772c9'
          '920bd35afc0bf6e6ba5cf7b309210be4d2c76e18'
          '47c289e743d1d513b7181e04bc8cb222ba7d7119'
          '0c57caa214c3e4da976162e08fd4f575f2976d94'
          '6cb5d9a472ff374089b0046362db899ffa4379a2'
          '86a07e4deddca5c1b3d17d2bd59074781a93711a'
          '20e07d4995d6028ef0a99333b31cc53d202ee6e9'
          'feb094c689a0c37c68f3b0c7e2b88eb5d572209f'
          '7c6e687d1cefe3139274b39c659351a503a3adb3'
          '7f4dd31cab51636983966d7c97df5e384b0ca3c1'
          '24d07f37ba5150b08f68dc73c0a5e53ae50ee9d5'
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
    --with-piddir=/run/courier \
    --with-trashquota \
    --with-db=gdbm \
    --with-random=/dev/urandom \
    --without-ispell \
    --with-mailuser=courier \
    --with-mailgroup=courier \
    --with-certdb=/etc/ssl/certs/ \
    --with-notice=unicode
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
