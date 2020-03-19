# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=sudo-selinux
_sudover=1.8.31p1
pkgver=${_sudover/p/.p}
pkgrel=1
pkgdesc="Give certain users the ability to run some commands as root - SELinux support"
arch=('x86_64')
url="https://www.sudo.ws/sudo/"
license=('custom')
groups=('selinux')
depends=('glibc' 'libgcrypt' 'pam-selinux' 'libldap' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=('etc/sudoers' 'etc/pam.d/sudo')
install=${pkgname/-selinux}.install
source=(https://www.sudo.ws/sudo/dist/${pkgname/-selinux}-$_sudover.tar.gz{,.sig}
        sudo.pam)
sha256sums=('c73cfdfbc1c5cc259fcc3a355e1bacfed99c5580daeadec9704a24cd5e6d15d8'
            'SKIP'
            'd1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2')
validpgpkeys=('59D1E9CCBA2B376704FDD35BA9F4C021CEA470FB')

prepare() {
  cd "$srcdir/${pkgname/-selinux}-$_sudover"
}

build() {
  cd "$srcdir/${pkgname/-selinux}-$_sudover"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --with-rundir=/run/sudo \
    --with-vardir=/var/db/sudo \
    --with-logfac=auth \
    --enable-gcrypt \
    --enable-tmpfiles.d \
    --with-pam \
    --with-sssd \
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

  # Remove sudoers.dist; not needed since pacman manages updates to sudoers
  rm "$pkgdir/etc/sudoers.dist"

  # Remove /run/sudo directory; we create it using systemd-tmpfiles
  rmdir "$pkgdir/run/sudo"
  rmdir "$pkgdir/run"

  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  install -Dm644 doc/LICENSE "$pkgdir/usr/share/licenses/sudo-selinux/LICENSE"
}

# vim:set ts=2 sw=2 et:
