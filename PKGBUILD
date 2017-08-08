# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Old Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Neil Romig <neil@sixtythree.me.uk>

pkgname=courier-authlib
pkgver=0.68.0
pkgrel=3
pkgdesc="Authentication library for the Courier mailserver(s)"
arch=(i686 x86_64)
license=('GPL2')
url="http://courier-mta.org/authlib/"
backup=('etc/authlib/authdaemonrc' 'etc/authlib/authldaprc' \
        'etc/authlib/authmysqlrc' 'etc/authlib/authpgsqlrc')
depends=('openssl' 'gdbm' 'perl' 'libtool' 'expect' 'courier-unicode>=2.0')
makedepends=('expect' 'pam' 'libldap' 'libmariadbclient' 'postgresql-libs>=8.3.0')
optdepends=('sqlite: With support for the authsqlite authentication module'
	    'libmariadbclient: With support for the authmysql authentication module'
	    'libldap: With support for the authldap authentication module'
	    'postgresql-libs: With support for the authpgsql authentication module'
	    'pam: With support for the authpam authentication module')
options=(!libtool !staticlibs emptydirs)
install=${pkgname}.install
source=(http://downloads.sourceforge.net/project/courier/authlib/${pkgver}/${pkgname}-${pkgver}.tar.bz2
        courier-authlib.tmpfiles
	authdaemond.service)
sha512sums=('5c4adaf0fd69f4b9e780962aa3f9eeac6b15cea3f302288ff4549ce2b0be9ea0808b4501670ef3c4e0419c3d27505c256c082f795dea4683dd5265fd7dcab93b' '5047fea9990cd2cd415e11c81fbd8ff83b70dadf0fc178b2398b2c9930843a4669abb3c6801f2953c1ebfdae73c1f82d0ee8c24e900f3876ee6b3aa689363b62' '2168a3d2f92bbc4c24ba80030236dd39a871ccd0f945ea9481518356f6ddfeec3661f161cd6a65d852bce6d9b089d7fa4860337615b9157199aaef336c58d268')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --with-db=gdbm \
    --with-mailuser=courier \
    --with-mailgroup=courier \
    --with-authpam \
    --with-authpwd \
    --with-authshadow \
    --with-authldap \
    --with-authmysql \
    --with-authpgsql \
    --with-authuserdb \
    --with-authcram \
    --with-authdaemon \
    --with-authdaemonvar=/run/authdaemon
    #--with-authsqlite --with-sqlite-libs
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install

  for distfile in ${pkgdir}/etc/authlib/*.dist; do
    # change ownership - this is usually done by the Makefile where it is assumed the user & group already exist
    chown 72:72 ${distfile}
    # remove the .dist suffix - mimics the install-configure step of a standard Courier installation
    mv ${distfile} ${pkgdir}/etc/authlib/`basename ${distfile} .dist`
  done

  # copy the .schema; mostly refered to as courier.schema -> rename it
  install -Dm 444 authldap.schema  ${pkgdir}/etc/openldap/schema/courier.schema

  chown 72:72 ${pkgdir}/usr/lib/courier-authlib

  # Install service file
  install -Dm 644 "${srcdir}/authdaemond.service" "${pkgdir}/usr/lib/systemd/system/authdaemond.service"

  # Install systemd configuration file
  install -Dm 644 "$srcdir/courier-authlib.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/courier-authlib.conf"
}

