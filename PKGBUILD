pkgver=5.0.14
_ver=$(echo "$pkgver" | sed -e "s:\([0-9]*\).*:\1:g")
pkgname=redis${_ver}
pkgrel=2
pkgdesc="Advanced key-value store (version $_ver)"
arch=('i686' 'x86_64')
url='http://redis.io/'
license=('BSD')
depends=('jemalloc' 'grep' 'shadow')
backup=("etc/redis${_ver}.conf"
        "etc/logrotate.d/redis${_ver}")
install=redis.install
source=(https://download.redis.io/releases/redis-${pkgver}.tar.gz
        redis.service
        redis.logrotate
        redis.conf-sane-defaults.patch
        redis-use-system-jemalloc.patch)
sha1sums=('58f2b4bfd4aded983195c21275516dac2f7e283e'
          '758d0a2cdd99b75c556e6fc13d9ab4cd7475a943'
          'f1edcd6e469dc6f076e223e3611ac683a6c37766'
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

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/redis${_ver}/LICENSE
  install -Dm644 redis.conf "$pkgdir"/etc/redis${_ver}.conf
  install -Dm644 ../redis.service "$pkgdir"/usr/lib/systemd/system/redis${_ver}.service
  for bin in server benchmark cli check-rdb check-aof sentinel; do
    mv "$pkgdir"/usr/bin/redis-$bin "$pkgdir"/usr/bin/redis{$_ver}-$bin
  done

  install -Dm644 ../redis.logrotate "$pkgdir"/etc/logrotate.d/redis${_ver} 
  
  sed "s/<version>/${_ver}/g" -i "$pkgdir"/usr/lib/systemd/system/redis${_ver}.service
  sed "s/<version>/${_ver}/g" -i "$pkgdir"/etc/logrotate.d/redis${_ver}
  sed "s:dir /var/lib/redis:dir /var/lib/redis${_ver}:g" -i "$pkgdir/etc/redis${_ver}.conf"
  
}
