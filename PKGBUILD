# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=wiringpi-tinkerboard-git
pkgver=2.31.r92.57d4c4b
pkgrel=1
pkgdesc="WiringPi for Tinker Board / S"
arch=('any')
url="https://github.com/TinkerBoard/gpio_lib_c"
license=('LGPL3')
makedepends=('git')
provides=('wiringpi' 'wiringpi-tinkerboard')
conflics=('wiringpi')
source=('git+https://github.com/TinkerBoard/gpio_lib_c.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/gpio_lib_c"

  printf "%s.r%s.%s" "$(<VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/gpio_lib_c"

  sed -i 's|$(DESTDIR)/lib|$(DESTDIR)$(PREFIX)/lib|g' */Makefile
  sed -i 's|ln -sf $(DESTDIR)/(PREFIX)/lib/|ln -sf |g' */Makefile
}

package() {
  cd "$srcdir/gpio_lib_c"

  install -dm755 "$pkgdir/usr/bin"

  _subdirs=('wiringPi' 'devLib' 'gpio')
  for subdir in "${_subdirs[@]}"; do
    pushd "$subdir"
    make DEFS='-D_GNU_SOURCE -DTINKER_BOARD' INCLUDE='-I../wiringPi'
    make DESTDIR="$pkgdir" PREFIX='/usr' LDCONFIG=true install
    popd
  done
}
