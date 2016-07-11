# sudo with insult gains
# safe-space disabled permanently
# not for the easily offended
#
# NB: This package does not edit the functionality of sudo in any way apart
#     from adding extra insults for obvious reasons, and tracks sudo
#     directly from upstream.
# Credit goes to the #archlinux-offtopic IRC chan for the constant inspiration
#
# Maintainer: NextHendrix <cjones12@sheffield.ac.uk>


pkgname=sudo-masochist
_sudover=1.8.17p1
pkgver=${_sudover/p/.p}
pkgrel=1
pkgdesc="Sudo with a little extra edge"
arch=('i686' 'x86_64')
url="https://www.sudo.ws/sudo/"
license=('custom')
depends=('glibc' 'pam' 'libldap')
backup=('etc/sudoers' 'etc/pam.d/sudo')
install=$pkgname.install
provides=('sudo')
conflicts=('sudo')
source=(https://www.sudo.ws/sudo/dist/sudo-$_sudover.tar.gz{,.sig}
        sudo.pam
        git+http://bitbucket.org/NextHendrix/sudo-masochist)

sha256sums=('c690d707fb561b3ecdf6a6de5563bc0b769388eff201c851edbace408bb155cc'
            'SKIP'
            'd1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2'
            'SKIP')
validpgpkeys=('CCB24BE9E9481B15D34159535A89DFA27EE470C4')

build() {
  cd "$srcdir/sudo-masochist"
  cp insults/* "$srcdir/sudo-$_sudover/plugins/sudoers/" -f
  cd "$srcdir/sudo-$_sudover"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --with-rundir=/run/sudo \
    --with-vardir=/var/db/sudo \
    --with-logfac=auth \
    --enable-tmpfiles.d \
    --with-pam \
    --with-sssd \
    --with-ldap \
    --with-ldap-conf-file=/etc/openldap/ldap.conf \
    --with-env-editor \
    --with-passprompt="[sudo] password for %p: " \
    --with-all-insults
  make
}

check() {
  cd "$srcdir/sudo-$_sudover"
  make check
}

package() {
  cd "$srcdir/sudo-$_sudover"
  make DESTDIR="$pkgdir" install

  # Remove /run/sudo directory from the package; we create it using tmpfiles.d
  rmdir "$pkgdir/run/sudo"
  rmdir "$pkgdir/run"

  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  install -Dm644 doc/LICENSE "$pkgdir/usr/share/licenses/sudo/LICENSE"
}

# vim:set ts=2 sw=2 et:
