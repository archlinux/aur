# Maintainer: Fabian Maurer <dark.shadow4@web.de>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgbase=lib32-smbclient
pkgname=('lib32-libwbclient' 'lib32-smbclient')
pkgver=4.10.10
pkgrel=2
pkgdesc="Tools to access a server's filespace and printers via SMB"
arch=('x86_64')
url='http://www.samba.org'
license=('GPL3')
makedepends=('lib32-avahi' 'lib32-gnutls' 'lib32-libbsd' 'lib32-libcap'
             'lib32-libcups' 'lib32-libgcrypt' 'lib32-pam'
             'lib32-systemd' 'lib32-talloc' 'lib32-tdb' 'lib32-popt'
             'lib32-tevent' 'lib32-ldb' 'lib32-libarchive' 'lib32-libaio'
             'lib32-libnsl' 'lib32-libtirpc' 'perl-parse-yapp'
             'lib32-jansson' 'rpcsvc-proto' 'smbclient' 'libwbclient' 'lib32-ncurses')
source=("https://www.samba.org/samba/samba/ftp/stable/samba-${pkgver}.tar.gz")
sha256sums=('700c734b51610e2feaa0d6744f9bec0c0d8917bca8cc78d5b63a4591f32866a5')

prepare() {
  cd samba-${pkgver}
  
  SAVEIFS=${IFS}
  IFS=$(echo -en "\n\b")
  PYTHON_CALLERS="$(find ${srcdir}/samba-${pkgver} -name '*.py')
$(find ${srcdir}/samba-${pkgver} -name 'wscript*')
$(find ${srcdir}/samba-${pkgver} -name 'configure.ac')
$(find ${srcdir}/samba-${pkgver} -name 'upgrade_from_s3')
$(find ${srcdir}/samba-${pkgver}/buildtools -type f)
$(find ${srcdir}/samba-${pkgver}/source4/scripting -type f)"
  sed -i -e 's|/usr/bin/env python$|/usr/bin/env python3-32|' \
         -e 's|python-config|python3-32-config|' \
         -e 's|bin/python|bin/python3-32|' \
      ${PYTHON_CALLERS}
  IFS=${SAVEIFS}
}

build() {
  cd samba-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  _samba4_idmap_modules='idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2'
  _samba4_pdb_modules='pdb_tdbsam,pdb_ldap,pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4'
  _samba4_auth_modules='auth_unix,auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4'

  ./configure --enable-fhs \
              --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libdir=/usr/lib32 \
              --libexecdir=/usr/lib32/samba \
              --localstatedir=/var \
              --with-configdir=/etc/samba \
              --with-lockdir=/var/cache/samba \
              --with-sockets-dir=/var/run/samba \
              --with-piddir=/var/run \
              --with-ads \
              --with-ldap \
              --with-winbind \
              --with-acl-support \
              --with-systemd \
              --systemd-install-services \
              --enable-gnutls \
              --with-pam \
              --with-pammodulesdir=/usr/lib32/security \
              --bundled-libraries=!tdb,!talloc,!pytalloc-util,!tevent,!popt,!ldb,!pyldb-util \
              --with-shared-modules=${_samba4_idmap_modules},${_samba4_pdb_modules},${_samba4_auth_modules} \
              --disable-rpath-install \
              --disable-glusterfs \
              --without-lttng \
              --without-gpgme \
              --disable-python \
              --without-ad-dc

  make
  make DESTDIR="${srcdir}/staging" install
}

package_lib32-libwbclient() {
  pkgdesc='Samba winbind client library'
  depends=('lib32-libbsd' 'libwbclient')

  cd staging

  install -dm 755 "${pkgdir}"/usr/lib32/{pkgconfig,samba}
  mv usr/lib32/libwbclient*.so* "${pkgdir}"/usr/lib32/
  mv usr/lib32/samba/libwinbind-client*.so* "${pkgdir}"/usr/lib32/samba/
  mv usr/lib32/samba/libreplace*.so* "${pkgdir}"/usr/lib32/samba/
  mv usr/lib32/pkgconfig/wbclient.pc "${pkgdir}"/usr/lib32/pkgconfig/
}

package_lib32-smbclient() {
  depends=('lib32-avahi' 'lib32-gnutls' 'lib32-libcap' 'lib32-libcups'
           'lib32-libgcrypt' 'lib32-libwbclient' 'lib32-pam' 'lib32-systemd'
           'lib32-talloc' 'lib32-tdb' 'lib32-ldb'
           'lib32-libaio' 'perl-parse-yapp' 'lib32-jansson' 'smbclient' 'lib32-ncurses')

  cd staging

  install -dm 755 "${pkgdir}"/usr/lib32/{pkgconfig,samba}
  for lib in usr/lib32/lib*.so*; do
    mv ${lib} "${pkgdir}"/usr/lib32/
  done
  for lib in usr/lib32/samba/lib*.so*; do
    mv ${lib} "${pkgdir}"/usr/lib32/samba/
  done
}

# vim: ts=2 sw=2 et:
