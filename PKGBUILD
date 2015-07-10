# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Old Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: tobias <tobias@archlinux.org>
# Committer: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=courier-imap
pkgver=4.16.2
pkgrel=1
pkgdesc="IMAP(s)/POP3(s) Server"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.courier-mta.org/imap/"
depends=('courier-maildrop' 'gcc-libs' 'gamin' 'gdbm' 'openssl' 'courier-unicode>=1.3')
backup=('etc/courier-imap/imapd.cnf' 'etc/courier-imap/pop3d.cnf' \
        'etc/courier-imap/imapd' 'etc/courier-imap/imapd-ssl' \
        'etc/courier-imap/pop3d' 'etc/courier-imap/pop3d-ssl')
conflicts=('courier-mta')
provides=('imap-server' 'pop3-server')
options=('!libtool')
source=(http://downloads.sourceforge.net/project/courier/imap/${pkgver}/${pkgname}-${pkgver}.tar.bz2
	courier-imapd-ssl.service
	courier-imapd.service
	courier-pop3d.service
	courier-pop3d-ssl.service)
sha512sums=('42a685324b630835fe0c8735a67879e099f96eadf091c803368a9dd478a80b4ab47225fda6142942569c96b21355b5dac5e174ff434bcdc78784a810d2088609'
	    'fcbc553e2b4542f246762ed1b20f1ae6a8f2b7c808e9ac537577e21ad933a0b1b4ea04eabb900ef423e2f4d037f973e73bf5f7e8ff6f0e3f7997f26dfd39b09f'
	    'daec41de02a8b056a0b54e9c5446e144192762e4354875fb18b306473e006eadee74664e65f45e07e071b70158f741720a9acd41c14474d61ee0c619a59e8a98'
	    '329ae0f76d5db53ed5392584ddfe7c4a10bfcec51a50c80d10fda1c318ab4929251ecc206403e045dba2c1d7388334473e2d8bf04dcfcc3d07301e89a609ea57'
	    '337639e7c666e972ffc9d9fe58a897b3643582c80c22cf2503d616319c3e69969bba2fc629b4ae7f94a6f6a97ae0524b8c12426c5f05be4240e742a1f7c9d934')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # fix a tiny bug
  sed -i -e \
    's|--with-authchangepwdir=/var/tmp/dev/null|--with-authchangepwdir=$libexecdir/authlib|' \
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
    --with-mailuser=courier --with-mailgroup=courier
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install

  # cleanup - provided by courier-maildrop
  rm ${pkgdir}/usr/bin/{deliverquota,maildirmake}
  rm ${pkgdir}/usr/share/man/man1/maildirmake*
  rm ${pkgdir}/usr/share/man/man8/deliverquota*
  find ${pkgdir} -name '*\.a' -exec -rm -f {} \;
  ###############################################################################
  # this is what usually "make install-configure" does
  # *.dist files get rid of "dist"
  for distfile in ${pkgdir}/etc/courier-imap/*.dist; do
     mv ${distfile} ${pkgdir}/etc/courier-imap/$(basename ${distfile} .dist)
  done
  sed -i 's|TLS_CERTFILE=/usr/share/|TLS_CERTFILE=/etc/courier-imap/|' \
    ${pkgdir}/etc/courier-imap/*-ssl
  #for pamfile in imap/*.pam; do
  #  sed -i "s|/lib/security/||;s|pam_pwdb|pam_unix|" ${pamfile}
  #  install -Dm 644 ${pamfile} \
  #    ${pkgdir}/etc/pam.d/$(basename ${pamfile} .pam | sed "s/d$//")
  #done

  # Install systemd service files
  install -Dm 644 "${srcdir}/courier-imapd.service" 	"${pkgdir}/usr/lib/systemd/system/courier-imapd.service"
  install -Dm 644 "${srcdir}/courier-imapd-ssl.service" "${pkgdir}/usr/lib/systemd/system/courier-imapd-ssl.service"
  install -Dm 644 "${srcdir}/courier-pop3d.service" 	"${pkgdir}/usr/lib/systemd/system/courier-pop3d.service"
  install -Dm 644 "${srcdir}/courier-pop3d-ssl.service" "${pkgdir}/usr/lib/systemd/system/courier-pop3d-ssl.service"

  # Install systemd configuration files
  mkdir "$pkgdir/usr/lib/tmpfiles.d" -p
  echo "D /run/courier 0755 courier courier" > "$pkgdir/usr/lib/tmpfiles.d/courier-imapd.conf"
  echo "D /run/courier 0755 courier courier" > "$pkgdir/usr/lib/tmpfiles.d/courier-imapd-ssl.conf"

  mkdir -p ${pkgdir}/run/courier
}
