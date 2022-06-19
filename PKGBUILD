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
_sudover=1.9.11p2
pkgrel=1
pkgver=${_sudover/p/.p}
pkgdesc="Give certain users the ability to run some commands as root - SELinux support"
arch=('x86_64' 'aarch64')
url="https://www.sudo.ws/sudo/"
license=('custom')
groups=('selinux')
depends=('glibc' 'openssl' 'pam-selinux' 'libldap' 'zlib' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=('etc/pam.d/sudo'
        'etc/sudo.conf'
        'etc/sudo_logsrvd.conf'
        'etc/sudoers')
install=${pkgname/-selinux}.install
source=(https://www.sudo.ws/sudo/dist/${pkgname/-selinux}-$_sudover.tar.gz{,.sig}
        sudo_logsrvd.service
        sudo.pam)
sha256sums=('a21918eb9fc0063794f6887464fa2d924ab6d192e19063191a429605c22791d2'
            'SKIP'
            '8b91733b73171827c360a3e01f4692772b78e62ceca0cf0fd4b770aba35081a1'
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

  # sudo_logsrvd service file (taken from sudo-logsrvd-1.9.0-1.el8.x86_64.rpm)
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ../sudo_logsrvd.service

  # Remove sudoers.dist; not needed since pacman manages updates to sudoers
  rm "$pkgdir/etc/sudoers.dist"

  # Remove /run/sudo directory; we create it using systemd-tmpfiles
  rmdir "$pkgdir/run/sudo"
  rmdir "$pkgdir/run"

  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/sudo-selinux/LICENSE"
}

# vim:set ts=2 sw=2 et:
