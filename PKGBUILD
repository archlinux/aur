# $Id: PKGBUILD 159813 2016-02-01 18:34:51Z spupykin $

pkgname=redis-git
provides=('redis')
conflicts=('redis')
pkgver=r7362.0d6f11f4d
pkgrel=1
pkgdesc='Advanced key-value store (git unstable branch)'
arch=('i686' 'x86_64')
url='http://redis.io/'
license=('BSD')
depends=('jemalloc' 'grep' 'shadow')
backup=('etc/redis.conf'
        'etc/logrotate.d/redis')
install=redis.install
source=(git+https://github.com/antirez/redis.git#branch=unstable
        redis.service
        redis.logrotate
        redis.conf-sane-defaults.patch
        redis-use-system-jemalloc.patch)
sha1sums=('SKIP'
          '285476bd6f92aa3dfba40cea1ad6cabef5a94df7'
          'b2a3cdc6ea1b89dc867d6db9ce02571e58e8b645'
          '8d60927802707bc7096f1c815e0e64937fc899ad'
          '46fed06e1b37165e1bfb994aaa367c232b83ee43')

pkgver() {
  cd redis
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd redis
  patch -p1 -i ../redis.conf-sane-defaults.patch
  patch -p0 -i ../redis-use-system-jemalloc.patch
}

build() {
  make -C redis
}

package() {
  cd redis
  make PREFIX="$pkgdir"/usr install

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/redis/LICENSE
  install -Dm644 redis.conf "$pkgdir"/etc/redis.conf
  install -Dm644 ../redis.service "$pkgdir"/usr/lib/systemd/system/redis.service

  # files kept for compatibility with installations made before 2.8.13-2
  install -Dm644 ../redis.logrotate "$pkgdir"/etc/logrotate.d/redis

  ln -sf redis-server $pkgdir/usr/bin/redis-sentinel
}
