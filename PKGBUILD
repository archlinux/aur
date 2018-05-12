# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sudo-hg
pkgver=r11370.d568dc923c7d
pkgrel=1
pkgdesc="Run commands as root or another user"
arch=('i686' 'x86_64')
url="https://www.sudo.ws/sudo.html"
license=('custom')
depends=('glibc' 'libgcrypt' 'libldap' 'pam')
makedepends=('mercurial')
provides=('sudo')
conflicts=('sudo')
backup=('etc/sudoers' 'etc/pam.d/sudo')
source=("hg+https://www.sudo.ws/repos/sudo/"
        "sudo.pam::https://git.archlinux.org/svntogit/packages.git/plain/trunk/sudo.pam?h=packages/sudo")
sha256sums=('SKIP'
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
  install -Dm644 "doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  # Remove sudoers.dist; not needed since pacman manages updates to sudoers
  rm "$pkgdir/etc/sudoers.dist"

  # Remove /run/sudo directory; we create it using systemd-tmpfiles
  rm -r "$pkgdir/run"
}
