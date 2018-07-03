# $Id: PKGBUILD 159813 2016-02-01 18:34:51Z spupykin $

pkgname=redis-git
provides=('redis')
conflicts=('redis')
pkgver=r7054.93238575f
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
md5sums=('SKIP'
         'afa0f4a9000c26c3323e83fe34883e23'
         '9e2d75b7a9dc421122d673fe520ef17f'
         '0edaae8f1ada3add150fa02f601184d7'
         '396f5543b68f3fe96c90dd9d50202ac0')


pkgver() {
  cd redis
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd redis
  patch -p1 -i ../redis.conf-sane-defaults.patch
  patch -p1 -i ../redis-use-system-jemalloc.patch
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
