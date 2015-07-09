# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgbase=lib32-smbclient
pkgname=('lib32-libwbclient' 'lib32-smbclient')
pkgver=4.1.12
pkgrel=1
pkgdesc="Tools to access a server's filespace and printers via SMB"
arch=('x86_64')
url='http://www.samba.org'
license=('GPL3')
makedepends=('lib32-avahi' 'lib32-gnutls' 'lib32-libbsd' 'lib32-libcap' \
             'lib32-libcups' 'lib32-libgcrypt' 'lib32-pam' 'lib32-python2' \
             'lib32-systemd' 'lib32-talloc' 'lib32-tdb')
source=("http://us1.samba.org/samba/ftp/stable/samba-${pkgver}.tar.gz")
sha256sums=('033604674936bf5c77d7df299b0626052b84a41505a6a6afe902f6274fc29898')

build() {
  cd samba-${pkgver}

  SAVEIFS=${IFS}
  IFS=$(echo -en "\n\b")
  PYTHON_CALLERS="$(find ${srcdir}/samba-${pkgver} -name '*.py')
$(find ${srcdir}/samba-${pkgver} -name 'wscript*')
$(find ${srcdir}/samba-${pkgver} -name 'configure.ac')
$(find ${srcdir}/samba-${pkgver} -name 'upgrade_from_s3')
$(find ${srcdir}/samba-${pkgver}/buildtools -type f)
$(find ${srcdir}/samba-${pkgver}/source4/scripting -type f)"
  sed -i -e 's|/usr/bin/env python$|/usr/bin/env python2|' \
         -e 's|python-config|python2-config|' \
         -e 's|bin/python|bin/python2|' \
      ${PYTHON_CALLERS}
  IFS=${SAVEIFS}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export PYTHON='/usr/bin/python2'
  _samba4_idmap_modules='idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2'
  _samba4_pdb_modules='pdb_tdbsam,pdb_ldap,pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4'
  _samba4_auth_modules='auth_unix,auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --localstatedir='/var' \
    --sbindir='/usr/bin' \
    --enable-fhs \
    --enable-gnutls \
    --disable-rpath-install \
    --with-configdir='/etc/samba' \
    --with-lockdir='/var/cache/samba' \
    --with-piddir='/var/run' \
    --with-sockets-dir='/var/run/samba' \
    --with-{ads,ldap,winbind,acl-support} \
    --with-pam \
    --with-pammodulesdir='/usr/lib/security' \
    --bundled-libraries='!tdb,!talloc,!pytalloc-util,!tevent,!popt,!ldb,!pyldb-util' \
    --with-shared-modules="${_samba4_idmap_modules},${_samba4_pdb_modules},${_samba4_auth_modules}"
  make
  make DESTDIR="${srcdir}/staging" install
}

package_lib32-libwbclient() {
  pkgdesc='Samba winbind client library'
  depends=('lib32-libbsd' 'libwbclient')

  cd staging

  install -dm 755 "${pkgdir}"/usr/lib/{pkgconfig,samba}
  mv usr/lib/libwbclient*.so* "${pkgdir}"/usr/lib/
  mv usr/lib/samba/libwinbind-client*.so* "${pkgdir}"/usr/lib/samba/
  mv usr/lib/samba/libreplace.so* "${pkgdir}"/usr/lib/samba/
  mv usr/lib/pkgconfig/wbclient.pc "${pkgdir}"/usr/lib/pkgconfig/
}

package_lib32-smbclient() {
  depends=('lib32-avahi' 'lib32-gnutls' 'lib32-libcap' 'lib32-libcups' \
           'lib32-libgcrypt' 'lib32-libwbclient' 'lib32-pam' 'lib32-systemd' \
           'lib32-talloc' 'lib32-tdb' 'smbclient')

  cd staging

  install -dm 755 "${pkgdir}"/usr/lib/{pkgconfig,samba}
  for lib in usr/lib/lib*.so*; do
    mv ${lib} "${pkgdir}"/usr/lib/
  done
  for lib in usr/lib/samba/lib*.so*; do
    mv ${lib} "${pkgdir}"/usr/lib/samba/
  done
}

# vim: ts=2 sw=2 et:
