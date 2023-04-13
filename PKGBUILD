# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sudo-hg
pkgver=r14698.59e0b245c776
pkgrel=1
pkgdesc="Run commands as root or another user"
arch=('i686' 'x86_64')
url="https://www.sudo.ws/sudo.html"
license=('custom')
depends=('glibc' 'libgcrypt' 'libldap' 'pam' 'zlib')
makedepends=('mercurial')
provides=("sudo=$pkgver")
conflicts=('sudo')
backup=('etc/pam.d/sudo'
        'etc/sudo.conf'
        'etc/sudo_logsrvd.conf'
        'etc/sudoers')
source=("hg+https://www.sudo.ws/repos/sudo/"
        "sudo.pam::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/sudo/trunk/sudo.pam"
        "sudo_logsrvd.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/sudo/trunk/sudo_logsrvd.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "sudo"

  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "sudo"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --libexecdir="/usr/lib" \
    --with-rundir="/run/sudo" \
    --with-vardir="/var/db/sudo" \
    --enable-gcrypt \
    --with-pam \
    --enable-tmpfiles.d \
    --with-sssd \
    --with-ldap \
    --with-ldap-conf-file="/etc/openldap/ldap.conf" \
    --with-env-editor \
    --with-passprompt="[sudo] password for %p: " \
    --with-all-insults
  make
}

check() {
  cd "sudo"

  make check
}

package() {
  cd "sudo"

  make DESTDIR="$pkgdir" install

  install -Dm644 "doc/LICENSE" -t "$pkgdir/usr/share/licenses/sudo"
  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  # sudo_logsrvd service file (taken from sudo-logsrvd-1.9.0-1.el8.x86_64.rpm)
  install -Dm644 "$srcdir/sudo_logsrvd.service" -t "$pkgdir/usr/lib/systemd/system"

  # Remove sudoers.dist; not needed since pacman manages updates to sudoers
  rm "$pkgdir/etc/sudoers.dist"

  # Remove /run/sudo directory; we create it using systemd-tmpfiles
  rm -r "$pkgdir/run"
}
