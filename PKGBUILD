pkgname=redis6
provides=('redis6')
conflicts=('redis6')
pkgver=6.2.7
pkgrel=1
pkgdesc='Advanced key-value store (version 6)'
arch=('i686' 'x86_64')
url='http://redis.io/'
license=('BSD')
depends=('jemalloc' 'grep' 'shadow')
backup=('etc/redis6.conf'
        'etc/logrotate.d/redis6')
install=redis.install
source=(https://download.redis.io/releases/redis-${pkgver}.tar.gz
        redis.service
        redis.logrotate
        redis.conf-sane-defaults.patch
        redis-use-system-jemalloc.patch)
sha1sums=('b01ef3f117c9815dea41bf2609e489a03c3a5ab1'
          'd509e13130a103309a7505d395f947d6a9b28082'
          '5db6e7b62f1cfca12a3e8e053c5e2a337640cdd2'
          '8d60927802707bc7096f1c815e0e64937fc899ad'
          '46fed06e1b37165e1bfb994aaa367c232b83ee43')

prepare() {
  cd redis-${pkgver}
  patch -p1 -i ../redis.conf-sane-defaults.patch
  patch -p0 -i ../redis-use-system-jemalloc.patch
}

build() {

  make -C redis-${pkgver} BUILD_TLS=yes
  
}

package() {
  cd redis-${pkgver}
  make PREFIX="$pkgdir"/usr install

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/redis6/LICENSE
  install -Dm644 redis.conf "$pkgdir"/etc/redis6.conf
  install -Dm644 ../redis.service "$pkgdir"/usr/lib/systemd/system/redis6.service
  for bin in server benchmark cli check-rdb check-aof sentinel; do
    mv "$pkgdir"/usr/bin/redis-$bin "$pkgdir"/usr/bin/redis6-$bin
  done

  sed 's:dir /var/lib/redis:dir /var/lib/redis6:g' -i "$pkgdir/etc/redis6.conf"
  
  # files kept for compatibility with installations made before 2.8.13-2
  install -Dm644 ../redis.logrotate "$pkgdir"/etc/logrotate.d/redis6
}
