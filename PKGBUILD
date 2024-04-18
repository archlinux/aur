# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=gibson-git
pkgver=r304.9710de4
pkgrel=1
pkgdesc='A high efficiency, tree based memory cache server'
arch=(x86_64)
url="https://github.com/evilsocket/gibson"
license=(BSD-3-Clause)
makedepends=(git cmake)
backup=(etc/gibson/gibson.conf)
source=("git+${url}"
        gibson.service)
sha1sums=('SKIP'
          'e78f6f4988c56f91dfb287f83cf9ded0183ef091')

pkgver() {
  cd gibson
  # repo does not have any git tags yet
  echo r$(git rev-list --count unstable).$(git rev-parse --short unstable)
}

build() {
  cd gibson
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd gibson
  make install DESTDIR="$pkgdir"

  rm -r "$pkgdir/etc/init.d"
  install -D -m644 "$srcdir/gibson.service" "$pkgdir/usr/lib/systemd/system/gibson.service"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
