# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# sudo.install, sudo_logsrvd.service and sudo.pam taken from the archlinux/svntogit-packages repo: https://github.com/archlinux/svntogit-packages/tree/master/sudo/trunk

pkgname=sudo-git
_pkgname=sudo
pkgrel=1
pkgver=1.9.9.r11348.gdabd8d80a
pkgdesc="Give certain users the ability to run some commands as root - git version"
arch=('x86_64')
url="https://www.sudo.ws/sudo/"
license=('custom')
depends=('glibc' 'libgcrypt' 'pam' 'libldap' 'zlib')
conflicts=('sudo')
provides=('sudo')
backup=('etc/pam.d/sudo'
        'etc/sudo.conf'
        'etc/sudo_logsrvd.conf'
        'etc/sudoers')
install=$_pkgname.install
source=("git://github.com/sudo-project/sudo.git"
        sudo_logsrvd.service
        sudo.pam)
sha256sums=('SKIP'
            'SKIP'
            'd1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2')

pkgver() {
  cd $_pkgname
  _ver="$(grep -m1 "^#.*for sudo*" configure | sed 's/.*sudo //;s/.$//' | tr - .)"
  echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"

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
    --with-all-insults
  make
}

check() {
  cd "$srcdir/$_pkgname"
  make check
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install

  # sudo_logsrvd service file (taken from sudo-logsrvd-1.9.0-1.el8.x86_64.rpm)
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ../sudo_logsrvd.service

  # Remove sudoers.dist; not needed since pacman manages updates to sudoers
  rm "$pkgdir/etc/sudoers.dist"

  # Remove /run/sudo directory; we create it using systemd-tmpfiles
  rmdir "$pkgdir/run/sudo"
  rmdir "$pkgdir/run"

  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/sudo/LICENSE"
}

# vim:set ts=2 sw=2 et:
