# $Id: PKGBUILD 159813 2016-02-01 18:34:51Z spupykin $
# Maintainer:  Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: nofxx <x@<nick>.com>

pkgname=redis-testing
provides=('redis')
conflicts=('redis')
_tag=3.2.0-rc3
pkgver=${_tag/-/_}
pkgrel=1
pkgdesc='Advanced key-value store'
arch=('i686' 'x86_64')
url='http://redis.io/'
license=('BSD')
depends=('jemalloc' 'grep' 'shadow')
backup=('etc/redis.conf'
        'etc/logrotate.d/redis')
install=redis.install
source=(https://github.com/antirez/redis/archive/${_tag}.tar.gz
        redis.service
        redis.logrotate
        redis.conf-sane-defaults.patch
        redis-2.8.11-use-system-jemalloc.patch)
md5sums=('2882bca0eb0116b56188af92fbc963fa'
         'afa0f4a9000c26c3323e83fe34883e23'
         '9e2d75b7a9dc421122d673fe520ef17f'
         '990536d339b694d76415ec1e847b861a'
         '2ae176578f538e37a67a463258302bc6')

prepare() {
  cd redis-$_tag
  patch -p1 -i ../redis.conf-sane-defaults.patch
  patch -p1 -i ../redis-2.8.11-use-system-jemalloc.patch
}

build() {
  make -C redis-$_tag
}

package() {
  cd redis-$_tag
  make PREFIX="$pkgdir"/usr install

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/redis/LICENSE
  install -Dm644 redis.conf "$pkgdir"/etc/redis.conf
  install -Dm644 ../redis.service "$pkgdir"/usr/lib/systemd/system/redis.service

  # files kept for compatibility with installations made before 2.8.13-2
  install -Dm644 ../redis.logrotate "$pkgdir"/etc/logrotate.d/redis

  ln -sf redis-server $pkgdir/usr/bin/redis-sentinel
}
