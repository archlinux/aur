# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=polipo-git
pkgver=1.1.1.r41.g4d42ca1
pkgrel=1
pkgdesc="A caching web proxy"
arch=('i686' 'x86_64')
url="https://www.irif.fr/~jch/software/polipo/"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('polipo')
conflicts=('polipo')
source=("git+https://github.com/jech/polipo.git"
        "polipo.service::https://git.archlinux.org/svntogit/community.git/plain/trunk/polipo.service?h=packages/polipo"
        "polipo.sysusers::https://git.archlinux.org/svntogit/community.git/plain/trunk/polipo.sysusers?h=packages/polipo"
        "polipo.tmpfiles::https://git.archlinux.org/svntogit/community.git/plain/trunk/polipo.tmpfiles?h=packages/polipo")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "polipo"

  sed -i 's/-Os/-O2/g' Makefile
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

  make PREFIX="$pkgdir/usr" \
       MANDIR="$pkgdir/usr/share/man" \
       INFODIR="$pkgdir/usr/share/info" \
       LOCAL_ROOT="$pkgdir/usr/share/polipo/www" \
       DISK_CACHE_ROOT="$pkgdir/var/cache/polipo" \
       install

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/polipo/COPYING"

  # install config files
  install -Dm644 "config.sample" "$pkgdir/etc/polipo/config.sample"
  install -Dm644 "forbidden.sample" "$pkgdir/etc/polipo/forbidden.sample"

  # install systemd service
  install -Dm644 "$srcdir/polipo.service" "$pkgdir/usr/lib/systemd/system/polipo.service"

  # install system user
  install -Dm644 "$srcdir/polipo.sysusers" "$pkgdir/usr/lib/sysusers.d/polipo.conf"
  install -Dm644 "$srcdir/polipo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/polipo.conf"
}
