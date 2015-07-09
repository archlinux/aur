# $Id$
# Maintainer: Nick Milosevic <nick000@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=sudo-sssd
_corepkgname=sudo
_sudover=1.8.13
pkgver=${_sudover/p/.p}
pkgrel=1
pkgdesc="core sudo package, but with sssd support added in"
arch=('i686' 'x86_64')
url="http://www.sudo.ws/sudo/"
license=('custom')
groups=('base-devel')
depends=('glibc' 'pam' 'libldap' 'sssd')
backup=('etc/sudoers' 'etc/pam.d/sudo')
provides=('sudo')
conflicts=('sudo')
install=$_corepkgname.install
source=(http://www.sudo.ws/sudo/dist/$_corepkgname-$_sudover.tar.gz{,.sig}
        sudo.tmpfiles.conf
        sudo.pam)
sha256sums=('e374e5edf2c11c00d6916a9f51cb0ad15e51c7b028370fa15169b07e61e05a25'
            'SKIP'
            'c1de59f1895373ecb39451372abf9a852518ed6eb3401da864e76a1baf2f20ce'
            'd1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2')
validpgpkeys=('CCB24BE9E9481B15D34159535A89DFA27EE470C4')

build() {
  cd "$srcdir/$_corepkgname-$_sudover"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --with-rundir=/run/sudo \
    --with-vardir=/var/db/sudo \
    --with-logfac=auth \
    --with-pam \
    --with-ldap \
    --with-ldap-conf-file=/etc/openldap/ldap.conf \
    --with-env-editor \
    --with-passprompt="[sudo] password for %p: " \
    --with-all-insults \
    --with-sssd \
    --with-sssd-lib=/usr/lib/sssd
  make
}

check() {
  cd "$srcdir/$_corepkgname-$_sudover"
  make check
}

package() {
  cd "$srcdir/$_corepkgname-$_sudover"
  make DESTDIR="$pkgdir" install

  # Remove /run/sudo directory from the package; we create it using tmpfiles.d
  rmdir "$pkgdir/run/sudo"
  rmdir "$pkgdir/run"

  # http://bugzilla.sudo.ws/show_bug.cgi?id=689
  install -Dm644 "$srcdir/sudo.tmpfiles.conf" \
    "$pkgdir/usr/lib/tmpfiles.d/sudo.conf"

  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  install -Dm644 doc/LICENSE "$pkgdir/usr/share/licenses/sudo/LICENSE"
}

# vim:set ts=2 sw=2 et:
