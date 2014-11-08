# $Id$
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>

pkgname=sudo-selinux
_sudover=1.8.11p2
pkgver=${_sudover/p/.p}
pkgrel=1
pkgdesc="Give certain users the ability to run some commands as root - SELinux support"
arch=('i686' 'x86_64')
url="http://www.sudo.ws/sudo/"
license=('custom')
groups=('selinux')
depends=('glibc' 'pam-selinux' 'libldap' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=('etc/sudoers' 'etc/pam.d/sudo')
install=${pkgname/-selinux}.install
source=(http://www.sudo.ws/sudo/dist/${pkgname/-selinux}-$_sudover.tar.gz{,.sig}
        sudo.tmpfiles.conf
        sudo.pam)
sha256sums=('8133849418fa18cf6b6bb6893d1855ff7afe21db8923234a00bf045c90fba1ad'
            'SKIP'
            '080dd97111b3149f8d140ffac68c88acd63da9eacc81fbcc7c43591be13b42fe'
            'd1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2')

build() {
  cd "$srcdir/${pkgname/-selinux}-$_sudover"

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
    --with-selinux
  make
}

check() {
  cd "$srcdir/${pkgname/-selinux}-$_sudover"
  make check
}

package() {
  cd "$srcdir/${pkgname/-selinux}-$_sudover"
  make DESTDIR="$pkgdir" install

  # Remove /run/sudo directory from the package; we create it using tmpfiles.d
  rmdir "$pkgdir/run/sudo"
  rmdir "$pkgdir/run"

  install -Dm644 "$srcdir/sudo.tmpfiles.conf" \
    "$pkgdir/usr/lib/tmpfiles.d/sudo.conf"

  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  install -Dm644 doc/LICENSE "$pkgdir/usr/share/licenses/sudo-selinux/LICENSE"
}

# vim:set ts=2 sw=2 et:
