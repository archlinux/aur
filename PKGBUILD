# Maintainer: gandalf3 <zzyxpaw at gmail>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=irssi-passwd
_pkgname=irssi
pkgver=1.2.0
pkgrel=2
pkgdesc='Modular text mode IRC client with Perl scripting, with irssi-passwd patch'
url='https://github.com/swick/irssi-passwd'
arch=('x86_64')
license=('GPL')
depends=('glib2' 'openssl' 'libotr')
optdepends=('perl-libwww: for the scriptassist script')
conflicts=('irssi')
backup=('etc/irssi.conf')
source=(https://github.com/irssi/irssi/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz{,.asc}
        https://raw.githubusercontent.com/swick/irssi-passwd/master/irssi-connection-set-key.patch
        https://raw.githubusercontent.com/swick/irssi-passwd/master/passwd.pl
        irssi-connection-set-key.patch.patch)
sha512sums=('343530ca63355dd6683e84f31602c9162e1e3158e52ce81e37519d1e42abbdcb621fb710fcb605fcafd7e7ea3f2c30ed62607d4ea91d8c8dc29bf893e54aee40'
            'SKIP'
            '9610c2207777cd3699a9af077fa41da2131ddb97b57c5420abb155e421ca619cd03d5c242b50437acf9bfc1242945fb6d245cbfe164c5a159b83baa439544b31'
            '0b6985f9db8c641997109d1ef1ca8d6ae87dbc9f68033062ecca020b5efb86f1f3c3f7e2cf3f3971f826e52b001838acef01553b38338ebdf948ee7bf14575d1'
            '77c88bf55624b9c164a2fd0e119bbba9188deba1f187da2d1ae680a0568eb2c7594dbcb8f9d8626e50c6d65e55c35a11e80f074ff4e7739c6bc083fe534066d1')
validpgpkeys=('7EE65E3082A5FB06AC7C368D00CCB587DDBEF0E1') # The Irssi project <staff@irssi.org>

build() {
  cd ${_pkgname}-${pkgver}
  patch --follow-symlinks ${srcdir}/irssi-connection-set-key.patch < ${srcdir}/irssi-connection-set-key.patch.patch -o irssi-connection-set-key_patched.patch
  patch -p1 < irssi-connection-set-key_patched.patch
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-proxy \
    --with-perl-lib=vendor \
    --with-otr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/usr/share/irssi/scripts"
	install -D -m644 ${srcdir}/passwd.pl ${pkgdir}/usr/share/irssi/scripts/
}

# vim: ts=2 sw=2 et:

