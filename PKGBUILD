# Maintainer: gandalf3 <zzyxpaw at gmail>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=irssi-passwd
_pkgname=irssi
pkgver=1.2.0
pkgrel=3
pkgdesc='Modular text mode IRC client with Perl scripting, with irssi-passwd patch'
url='https://github.com/gandalf3/irssi-passwd'
arch=('x86_64')
license=('GPL')
depends=('glib2' 'openssl' 'libotr')
optdepends=('perl-libwww: for the scriptassist script')
conflicts=('irssi')
install=irssi-passwd.install
backup=('etc/irssi.conf')
source=(https://github.com/irssi/irssi/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz{,.asc}
        https://raw.githubusercontent.com/gandalf3/irssi-passwd/master/irssi-connection-set-key.patch
        https://raw.githubusercontent.com/gandalf3/irssi-passwd/master/passwd.pl)
sha512sums=('343530ca63355dd6683e84f31602c9162e1e3158e52ce81e37519d1e42abbdcb621fb710fcb605fcafd7e7ea3f2c30ed62607d4ea91d8c8dc29bf893e54aee40'
            'SKIP'
            'b9be4bb568838fa2f31735b3290b31d6a88a9f31f1d6d1ac367391d951620ac0fcdbf664efa7fdbcc2ce181f2ff32bfa0ffc3146058836ec4ffcae9b3e11f36f'
            '8e5694e5dd56caac3fae268160e0d82544ce1ee8690972a5f502ac728cb189cd71baf09b14425c2d4d42bb799cc7336eb1a1258cc648bc3237906eb804da6092')
validpgpkeys=('7EE65E3082A5FB06AC7C368D00CCB587DDBEF0E1') # The Irssi project <staff@irssi.org>

build() {
  cd ${_pkgname}-${pkgver}
  patch -p1 < ${srcdir}/irssi-connection-set-key.patch
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

