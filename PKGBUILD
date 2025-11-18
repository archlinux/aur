# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: nofxx <x@<nick>.com>

pkgname=redis
pkgver=8.4.0
pkgrel=1
pkgdesc='An in-memory database that persists on disk'
arch=('x86_64')
url='https://redis.io/'
license=('AGPL-3.0-only')
depends=('jemalloc' 'grep' 'shadow' 'systemd-libs')
# pkg-config fails to detect systemd libraries if systemd is not installed
makedepends=('systemd' 'openssl')
backup=('etc/redis/redis.conf'
        'etc/redis/sentinel.conf')
install=redis.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/redis/redis/archive/${pkgver}.tar.gz"
        redis.service
        redis-sentinel.service
        redis.sysusers
        redis.tmpfiles
        redis.conf-sane-defaults.patch
        redis-5.0-use-system-jemalloc.patch)
sha512sums=('348e8de4d5f75980a080c0016aff66fa818609f81397347b9d9b92d968a1a415658210a36784c5b8e2b79b4813dda07bfdc6ffd504372c50f10714a579f08f4e'
            '8abf27f173a4532295dafd91b8e6e226e4376f1b2543c911e4fa60466d50523ada4dcfe520a738fd756c5725f4319153a0c0b26f6cdba234775114c72e4e7865'
            '2314c26920f5f0989fb98622f594b621a0b5035525146263da3fdfe640257118e03fc1903c15a62bcd4fbf260e0dcbf9249088292323739a607a11c9630795bf'
            '52a36e44dd0ebfbc75d4849c66fa68cedd8ab0dcdcaaf0e3ac92f1dfe9fbd538a3b98e0658c88295b4c9f61334445f887decbccee210d0b4e7c5b456485599d1'
            '149e56c5da953e61d2f3864949c38d3f36d2ab1af6c74571ae36fa9ec991dee93dcac81e3caff69ac581a5218405f3e896b5dc58b9474f997bff48f5af06ee68'
            'f45b5d20769159faeeb705e1bb9e4fdc3d74c0779b476cada829bfb49014c6ba6cd78d1d2751bf39acb6db4528281e9cab3aca684cadf687eb5fad10c7453154'
            '0acb08a6e0eaba239db7461bcfeddfbe0c1aaa517dc33c3918c9e991a1d5067cfe135b7f75085caade8c3ababd51ec9cefcc4120f57818bea1f7029a548a7732')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < ../redis.conf-sane-defaults.patch
  patch -Np1 < ../redis-5.0-use-system-jemalloc.patch
}

build() {
  make BUILD_TLS=yes \
       USE_SYSTEMD=yes \
       -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir"/usr install

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/redis/LICENSE
  install -Dm644 -t "$pkgdir"/etc/redis redis.conf sentinel.conf
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ ../redis.service ../redis-sentinel.service
  install -Dm644 "$srcdir"/redis.sysusers "$pkgdir"/usr/lib/sysusers.d/redis.conf
  install -Dm644 "$srcdir"/redis.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/redis.conf
}
