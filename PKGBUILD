# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=polipo-git
pkgver=1.1.1.r41.g4d42ca1
pkgrel=2
pkgdesc="A caching web proxy"
arch=('i686' 'x86_64')
url="https://www.irif.fr/~jch/software/polipo/"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('polipo')
conflicts=('polipo')
source=("git+https://github.com/jech/polipo.git"
        "polipo.service::https://aur.archlinux.org/cgit/aur.git/plain/polipo.service?h=polipo"
        "polipo.sysusers::https://aur.archlinux.org/cgit/aur.git/plain/polipo.sysusers?h=polipo"
        "polipo.tmpfiles::https://aur.archlinux.org/cgit/aur.git/plain/polipo.tmpfiles?h=polipo")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "polipo"

  sed -i 's/-Os/-O2/g' "Makefile"
}

pkgver() {
  cd "polipo"

  git describe --long --tags | sed 's/^polipo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "polipo"

  make
}

package() {
  cd "polipo"

  make \
    PREFIX="$pkgdir/usr" \
    MANDIR="$pkgdir/usr/share/man" \
    INFODIR="$pkgdir/usr/share/info" \
    LOCAL_ROOT="$pkgdir/usr/share/polipo/www" \
    DISK_CACHE_ROOT="$pkgdir/var/cache/polipo" \
    install

  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/polipo"

  # install config files
  install -Dm644 {config,forbidden}.sample -t "$pkgdir/etc/polipo"

  # install systemd service
  install -Dm644 "$srcdir/polipo.service" -t "$pkgdir/usr/lib/systemd/system"

  # install system user
  install -Dm644 "$srcdir/polipo.sysusers" "$pkgdir/usr/lib/sysusers.d/polipo.conf"
  install -Dm644 "$srcdir/polipo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/polipo.conf"
}
