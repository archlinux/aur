# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Old Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: tobias <tobias@archlinux.org>
# Committer: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=courier-imap
pkgver=5.2.1
pkgrel=1
pkgdesc="IMAP(s)/POP3(s) Server"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
url="http://www.courier-mta.org/imap/"
depends=('courier-maildrop' 'gcc-libs' 'gamin' 'gdbm' 'openssl' 'courier-unicode>=2.1' 'courier-authlib>=0.71.0')
backup=('etc/courier-imap/imapd.cnf' 'etc/courier-imap/pop3d.cnf' \
        'etc/courier-imap/imapd' 'etc/courier-imap/imapd-ssl' \
        'etc/courier-imap/pop3d' 'etc/courier-imap/pop3d-ssl')
conflicts=('courier-mta')
provides=('imap-server' 'pop3-server')
options=('!libtool' '!staticlibs')
source=(http://downloads.sourceforge.net/project/courier/imap/${pkgver}/${pkgname}-${pkgver}.tar.bz2
	courier-imapd-ssl.service
	courier-imapd.service
	courier-pop3d.service
	courier-pop3d-ssl.service)
sha512sums=('88ce60b666bc1db10059ffd34f76d8275f399ac1833ee820308db25df49ab4914a03547e6d58075d5fecb34204b5fb958877db06b3bb4529eb8cb9e547bbcf63'
            '3a5334b38dcae3f4caeaef0819debe6c13ead992dafb224eef7bdaee6d1c8c1faa4fb995ec79aeb71abf5ea03f05eb6d1981386b2b90058ba6fd0c2c82c34f04'
            'f293231a59f92ffb2e1835b56216ec6658cb48c97f5d2701be4d809600ee6f49f0a2678f9156f084e097d9fab8bd8de53acb9862457da313afcbf06326d75dcb'
            '20d8bab38bbb00023437c9384894471649e75b10bbcf7d3a7b3923b6453af96421c494bc5f7f83f5463a266d0d14dfb0ba0e08b01ea3e4deac24f40f5e986b2f'
            'f1bd578c7fa8af060252aea84dacbe629cf6f76895c0499d84b26e17526965d9b27584b8c0240670fd0294506ac426c99f6af1d1e1c062a82e420105b65d7433')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # fix a tiny bug
  sed -i -e \
    's|--with-authchangepwdir=/var/tmp/dev/null|--with-authchangepwdir="$libexecdir"/authlib|' \
    configure && chmod 755 configure

  ./configure --prefix=/usr \
    --sysconfdir=/etc/courier-imap \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/courier-imap \
    --localstatedir=/var/spool/courier-imap \
    --disable-root-check \
    --enable-unicode \
    --enable-workarounds-for-imap-client-bugs \
    --with-piddir=/run/courier \
    --with-trashquota \
    --with-db=gdbm \
    --with-mailuser=courier --with-mailgroup=courier \
    --with-notice=unicode --build=x86_64
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # cleanup - provided by courier-maildrop
  rm "${pkgdir}/usr/bin/"{deliverquota,maildirmake,makedat,maildirkw}
  rm "${pkgdir}/usr/share/man/man1/"maildirmake*
  rm "${pkgdir}/usr/share/man/man1/"maildirkw*
  rm "${pkgdir}/usr/share/man/man8/"deliverquota*
  ###############################################################################
  # this is what usually "make install-configure" does
  # *.dist files get rid of "dist"
  for _distfile in "${pkgdir}/etc/courier-imap/"*.dist; do
     # change ownership where it is assumed the user & group already exist
     chown -R 72:72 "${pkgdir}/etc/courier-imap/"
     mv "${_distfile}" "${pkgdir}/etc/courier-imap/"$(basename "${_distfile}" .dist)
  done
  sed -i 's|TLS_CERTFILE=/usr/share/|TLS_CERTFILE=/etc/courier-imap/|' \
    "${pkgdir}/etc/courier-imap/"*-ssl
  #for _pamfile in imap/*.pam; do
  #  sed -i "s|/lib/security/||;s|pam_pwdb|pam_unix|" "${_pamfile}"
  #  install -Dm 644 "${_pamfile}" \
  #    "${pkgdir}/etc/pam.d/"$(basename "${_pamfile}" .pam | sed "s/d$//")
  #done

  chown 72:72 "${pkgdir}/usr/lib/courier-imap"

  # Install systemd service files
  install -Dm 644 "${srcdir}/courier-imapd.service" 	"${pkgdir}/usr/lib/systemd/system/courier-imapd.service"
  install -Dm 644 "${srcdir}/courier-imapd-ssl.service" "${pkgdir}/usr/lib/systemd/system/courier-imapd-ssl.service"
  install -Dm 644 "${srcdir}/courier-pop3d.service" 	"${pkgdir}/usr/lib/systemd/system/courier-pop3d.service"
  install -Dm 644 "${srcdir}/courier-pop3d-ssl.service" "${pkgdir}/usr/lib/systemd/system/courier-pop3d-ssl.service"

  # Install systemd configuration files
  mkdir "$pkgdir/usr/lib/tmpfiles.d" -p
  echo "D /run/courier 0755 courier courier" > "$pkgdir/usr/lib/tmpfiles.d/courier-imapd.conf"
  echo "D /run/courier 0755 courier courier" > "$pkgdir/usr/lib/tmpfiles.d/courier-imapd-ssl.conf"

  mkdir -p "${pkgdir}/run/courier"
}
