# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gpm-git
pkgver=1.20.7.r38.ge82d1a6
pkgrel=1
pkgdesc="General purpose mouse daemon"
arch=('i686' 'x86_64')
url="https://www.nico.schottelius.org/software/gpm/"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('gpm' 'libgpm.so')
conflicts=('gpm')
options=('staticlibs')
source=("git+https://github.com/telmich/gpm.git"
        "https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/gpm/trunk/gpm.service"
        "https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/gpm/trunk/gpm.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "gpm"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gpm"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc"
  make
}

check() {
  cd "gpm"

  make check
}

package() {
  cd "gpm"

  make DESTDIR="$pkgdir" install

  install -Dm755 "$srcdir/gpm.sh" -t "$pkgdir/etc/profile.d"
  install -Dm644 "$srcdir/gpm.service" -t "$pkgdir/usr/lib/systemd/system"
}
