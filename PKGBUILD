# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=freeipmi-git
pkgver=r11526.gd6e3e4e92
pkgrel=1
pkgdesc="Provides in-band and out-of-band IPMI software"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/freeipmi/"
license=('GPL')
depends=('glibc' 'libgcrypt')
makedepends=('git')
optdepends=('perl: for contrib scripts')
provides=('freeipmi')
conflicts=('freeipmi')
backup=(etc/freeipmi/{freeipmi,freeipmi_interpret_sel,freeipmi_interpret_sensor,ipmidetect,ipmidetectd,ipmiseld,libipmiconsole}.conf)
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/freeipmi.git"
        "tmpfiles.conf::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/freeipmi/trunk/tmpfiles.conf")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "freeipmi"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "freeipmi"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --exec-prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --localstatedir="/var" \
    --mandir="/usr/share/man" \
    --with-systemdsystemunitdir="/usr/lib/systemd/system" \
    --with-systemconfigdir="/etc/conf.d"
  make
}

check() {
  cd "freeipmi"

  make check
}

package() {
  cd "freeipmi"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/freeipmi.conf"

  # delete cache
  rm -rf "$pkgdir/var/cache"
}
