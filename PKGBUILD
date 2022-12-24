# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Old Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Neil Romig <neilromig@gmail.com>

pkgname=courier-authlib
pkgver=0.72.0
pkgrel=1
pkgdesc="Authentication library for the Courier mailserver(s)"
arch=(i686 x86_64)
license=('GPL2')
url="http://courier-mta.org/authlib/"
backup=('etc/authlib/authdaemonrc' 'etc/authlib/authldaprc' \
        'etc/authlib/authmysqlrc' 'etc/authlib/authpgsqlrc')
depends=('openssl' 'gdbm' 'perl' 'libtool' 'expect' 'courier-unicode>=2.1')
makedepends=('procps-ng' 'expect' 'pam' 'libldap' 'libmariadbclient' 'postgresql-libs>=8.3.0')
optdepends=('sqlite: With support for the authsqlite authentication module'
	    'libmariadbclient: With support for the authmysql authentication module'
	    'libldap: With support for the authldap authentication module'
	    'postgresql-libs: With support for the authpgsql authentication module'
	    'pam: With support for the authpam authentication module')
options=(!libtool !staticlibs emptydirs)
install=${pkgname}.install
source=(http://downloads.sourceforge.net/project/courier/authlib/${pkgver}/${pkgname}-${pkgver}.tar.bz2
        courier-authlib.tmpfiles
	authdaemond.service
	courier.conf)
sha512sums=('1d04c3a10fffddfd2c3cae1c5543a01ec6fcc4ccdf77b13714542ce7189e4924836a64123a9e7231fda698cca9a930be65a4a2382f3cd96364635f754bf40ce3'
            '5047fea9990cd2cd415e11c81fbd8ff83b70dadf0fc178b2398b2c9930843a4669abb3c6801f2953c1ebfdae73c1f82d0ee8c24e900f3876ee6b3aa689363b62'
            '2f827ec0d8e5c95122c10cb030cf8ff3dda382ca55e7eafc37baf5eef39963c7504c902a76def2c1517f9d1724d60256c0eff4bf6db9bf837b32660ee883edb0'
            '997f755516a64f38abb626790e22e0ad6c3d9fbd7d3e76199cc335ce60f9d5e94dfa083deb637cc36fe039b5b1aa713224e2175b65b1980bf3b304499e3e96e6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  for _distfile in "${pkgdir}/etc/authlib/"*.dist; do
    # change ownership - this is usually done by the Makefile where it is assumed the user & group already exist
    chown 72:72 "${_distfile}"
    # remove the .dist suffix - mimics the install-configure step of a standard Courier installation
    mv "${_distfile}" "${pkgdir}/etc/authlib/"`basename "${_distfile}" .dist`
  done

  # copy the .schema; mostly refered to as courier.schema -> rename it
  install -Dm 444 authldap.schema  "${pkgdir}/etc/openldap/schema/courier.schema"

  chown 72:72 "${pkgdir}/usr/lib/courier-authlib"

  # Install systemd sysuser file
  install -Dm 644 "$srcdir/courier.conf" "${pkgdir}/usr/lib/sysusers.d/courier.conf"

  # Install service file
  install -Dm 644 "${srcdir}/authdaemond.service" "${pkgdir}/usr/lib/systemd/system/authdaemond.service"

  # Install systemd configuration file
  install -Dm 644 "$srcdir/courier-authlib.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/courier-authlib.conf"

  mkdir -p "$pkgdir/var/spool/courier"
}

