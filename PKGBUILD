# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Old Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=courier-authlib
pkgver=0.67.0
pkgrel=1
pkgdesc="Authentification library for the courier mailserver(s)"
arch=(i686 x86_64)
license=('GPL2')
url="http://courier-mta.org/authlib/"
backup=('etc/authlib/authdaemonrc' 'etc/authlib/authldaprc' \
        'etc/authlib/authmysqlrc' 'etc/authlib/authpgsqlrc')
depends=('openssl' 'gdbm' 'perl' 'libtool' 'expect' 'courier-unicode>=1.4')
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
sha512sums=('6e3da28d555761177727c44b1422bf5baf6ffbf28f53cea89a4a8e13daa5433803deba1614295d9679c41b5be4750f464e7869a2d3ecbfd91ae84e7281c4f3ef'
	    '6fa87f52a3a26ae470bc28f9ff6d5f7c16afc5ccaf0d3209378e7339271d568dc59ca9fc9d0b5bbfc4155e76702f5de18899237252860a4a3636eabb94a770d7'
	    '923b501bd250068956d304c2ab922af4e22f2828eae9fb17dc5945bbd2af3d0eb641ba8783a91a20f970bdda95e97f6ef2801e0b50d767c626ca38de6cb140b4')

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
