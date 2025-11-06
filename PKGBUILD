pkgname=redis7
pkgver=7.2.12
pkgrel=1
pkgdesc='BSD licensed version of the in-memory database that persists on disk.'
arch=('x86_64')
url='https://redis.io/'
license=('BSD')
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
sha256sums=('a96a1bd1bf3f9acfe8070f86224cbdce62252aba52b82eaf71ebdabfc1dc89ba'
            'ec2c549a345c39fe51aa02ae9c5695eadf75b2ca40fd6762f610de92cbcd14b5'
            '85d9e0e69e948e6e5a2722ba164577cafb1cbd9776bd0c8bc3a6311fa7a3f6fe'
            '5f66305c49ba5ed67e777336e0a193c1d2b8ac7ba20a3e3cf0764804b60601f8'
            'cea6449811610ceff50913a611844b18c1bddebeb89a4de575c5df7cba66cea7'
            '24d8f61325dd7c400d7cdff43d697f4b5b5f0466c90ba5a7e8cb9e9d1f39953a'
            '54f45fa129dcb64924ccbad7116417dcb8791e665a097a0969fc8e1b4d3b2b33')
prepare() {
  cd redis-$pkgver
  patch -Np1 < ../redis.conf-sane-defaults.patch
  patch -Np1 < ../redis-5.0-use-system-jemalloc.patch
}

build() {
  make BUILD_TLS=yes \
       USE_SYSTEMD=yes \
       -C redis-$pkgver
}

package() {
  cd redis-$pkgver
  make PREFIX="$pkgdir"/usr install

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/redis/LICENSE
  install -Dm644 -t "$pkgdir"/etc/redis redis.conf sentinel.conf
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ ../redis.service ../redis-sentinel.service
  install -Dm644 "$srcdir"/redis.sysusers "$pkgdir"/usr/lib/sysusers.d/redis.conf
  install -Dm644 "$srcdir"/redis.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/redis.conf
}
