# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Old Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-authlib
pkgver=0.66.3
pkgrel=1
pkgdesc="Authentification library for the courier mailserver(s)"
arch=(i686 x86_64)
license=('GPL2')
url="http://courier-mta.org/authlib/"
backup=('etc/authlib/authdaemonrc' 'etc/authlib/authldaprc' \
        'etc/authlib/authmysqlrc' 'etc/authlib/authpgsqlrc')
depends=('openssl' 'gdbm' 'perl' 'libtool' 'expect' 'courier-unicode>=1.3')
makedepends=('expect' 'pam' 'libldap' 'libmysqlclient' 'postgresql-libs>=8.3.0')
optdepends=('sqlite: With support for the authsqlite authentication module'
	    'libmariadbclient: With support for the authmysql authentication module'
	    'libldap: With support for the authldap authentication module'
	    'postgresql-libs: With support for the authpgsql authentication module'
	    'pam: With support for the authpam authentication module')
options=(!libtool)
install=${pkgname}.install
source=(http://downloads.sourceforge.net/project/courier/authlib/${pkgver}/${pkgname}-${pkgver}.tar.bz2
        courier-authlib.tmpfiles
	authdaemond.service)
sha512sums=('09d97c8efc79d84437feefca13f5161c0e113864b9c971a4a980b359c9c14699f8d07eac6b52ac0a7d30f9770656e672f64c3445ecf4dcad88f51a427310d530'
	    '6fa87f52a3a26ae470bc28f9ff6d5f7c16afc5ccaf0d3209378e7339271d568dc59ca9fc9d0b5bbfc4155e76702f5de18899237252860a4a3636eabb94a770d7'
	    '6d0ed01836fd397ce7e34b0eb892e349c2e3dd092c2250dbb1d2db4a9ce41d1dbd072d53fbc9d378fdde87e71fa317a919ddb47835416c7e2b6ba45bd8bd25e2')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --with-db=gdbm \
    --with-mailuser=courier --with-mailgroup=courier \
    --with-authpam --with-authpwd --with-authshadow \
    --with-authldap --with-authmysql --with-authpgsql \
    --with-authuserdb --with-authcram --with-authdaemon \
    --with-authdaemonvar=/run/authdaemon
    #--with-authsqlite --with-sqlite-libs
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  ###############################################################################
  # post_installation ---- rename the config file and change ownerschip
  for distfile in ${pkgdir}/etc/authlib/*.dist; do
    chown 72:72 ${distfile}
    mv ${distfile} ${pkgdir}/etc/authlib/`basename ${distfile} .dist`
  done
   # copy the .schema; mostly refered to as courier.schema -> rename it
  install -Dm 444 authldap.schema \
    ${pkgdir}/etc/openldap/schema/courier.schema
  ###############################################################################
  #mkdir -p ${pkgdir}/var/spool/authdaemon
  #chown -R 72:72 ${pkgdir}/var/spool/authdaemon
  mkdir -p ${pkgdir}/run/authdaemon
  mkdir -p ${pkgdir}/var/spool/courier
  chown -R 72:72 ${pkgdir}/var/spool/courier
  # docs say we can remove .a files after make
  find ${pkgdir} -name '*\.a' -exec rm -f {} \;
  # Make libs available to /usr/lib
  cd $pkgdir/usr/lib
  for lib in courier-authlib/*.so; do
      ln -s $lib .
  done

  # Install service file
  install -Dm 644 "${srcdir}/authdaemond.service" "${pkgdir}/usr/lib/systemd/system/authdaemond.service"

  # Install systemd configuration files
  install -Dm644 "$srcdir/courier-authlib.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/courier-authlib.conf"
}
