# Maintainer: Tinu Weber <http://ayekat.ch>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libfiber-git
pkgver=r215.111db17
pkgrel=4
arch=(x86_64)

pkgdesc='A User Space Threading Library Supporting Multi-Core Systems'
url='https://github.com/brianwatling/libfiber'
license=(custom:ISC)

depends=(gcc-libs glibc)
makedepends=(cmake git libev)
checkdepends=(time)

provides=(libfiber)
conflicts=(libfiber)

source=('git+https://github.com/brianwatling/libfiber'
        '0002-dist-libev.diff'
        '0003-no-work-stealing.diff'
        '0004-fix-void-args.diff'
        'libfiber.pc')
sha256sums=(SKIP
            e36b02fc439e1185a734db2a312a4650e803acb3eeef1105e40ffdc65726ae5d
            88ac1ea4517e6d73a571d243ffd51711a2e4ba2c45b92136968489f9c1979b62
            e6cabc2f4a41bdf6385f9c1e57213913f2a2706967ec74d0a75d0df5fe94c9c7
            eb8f429c6705a23aec697990271e724541815d8b43aafcb36d21fd7186dacacd)

pkgver() {
  cd libfiber
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd libfiber

  # Use downstream (distribution) libev:
  patch -p1 -i "$srcdir"/0002-dist-libev.diff

  # Fix void arguments in header files:
  patch -p1 -i "$srcdir"/0004-fix-void-args.diff

  # Don't use work stealing:
  # NOTE: This is disabled by default, as it deviates from vanilla upstream;
  # apply if you run into issues with fibers being scheduled in an awkward way.
  #patch -p1 -i "$srcdir"/0003-no-work-stealing.diff

}

build() {
  cd libfiber
  make libfiber.so
}

check() {
  cd libfiber
  make runtests
}

package() {
  cd libfiber

  # library
  install -Dm0755 libfiber.so "$pkgdir"/usr/lib/libfiber.so

  # headers
  install -dm0755 "$pkgdir"/usr/include
  install -m0644 include/*.h "$pkgdir"/usr/include/

  # pkg-config
  install -Dm0644 "$srcdir"/libfiber.pc "$pkgdir"/usr/lib/pkgconfig/libfiber.pc

  # misc
  install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.txt
}
