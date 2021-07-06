# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mlocate-git
pkgver=0.26.r14.gc98bf65
pkgrel=1
pkgdesc="A locate/updatedb implementation"
arch=('i686' 'x86_64')
url="https://pagure.io/mlocate"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('mlocate')
conflicts=('mlocate')
backup=('etc/updatedb.conf')
source=("git+https://pagure.io/mlocate.git"
        "git+https://git.savannah.gnu.org/git/gnulib.git#commit=5861339993f3014cfad1b94fc7fe366fc2573598"
        "sysusers.d::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/mlocate/trunk/sysusers.d"
        "updatedb.conf::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/mlocate/trunk/updatedb.conf"
        "updatedb.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/mlocate/trunk/updatedb.service"
        "updatedb.timer::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/mlocate/trunk/updatedb.timer")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "mlocate"

  sed -i '/^groupname /s/mlocate/locate/' "Makefile.am"

  "$srcdir/gnulib/gnulib-tool" --import
}

pkgver() {
  cd "mlocate"

  git describe --long --tags | sed 's/^mlocate-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "mlocate"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --localstatedir="/var/lib"
  make
}

check() {
  cd "mlocate"

  #make check
}

package() {
  cd "mlocate"

  make DESTDIR="$pkgdir" install

  chgrp 21 "$pkgdir/var/lib/mlocate"
  chmod 750 "$pkgdir/var/lib/mlocate"

  chgrp 21 "$pkgdir/usr/bin/locate"
  chmod 2755 "$pkgdir/usr/bin/locate"
  ln -s "locate" "$pkgdir/usr/bin/slocate"

  install -dm755 "$pkgdir/var/lib"
  install -dm750 -g21 "$pkgdir/var/lib/locate"

  install -Dm644 "$srcdir/updatedb.conf" -t "$pkgdir/etc"
  install -Dm644 "$srcdir/sysusers.d" "$pkgdir/usr/lib/sysusers.d/locate.conf"
  install -Dm644 "$srcdir/updatedb.timer" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/updatedb.service" -t "$pkgdir/usr/lib/systemd/system"

  install -d "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
  ln -s "../updatedb.timer" "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/updatedb.timer"
}
