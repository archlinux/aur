# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>
# Contributor: Tim Besard <tim.besard@gmail.com>

# Build order: avr-binutils -> avr-gcc -> avr-libc

pkgname=avr-libc-git
pkgver=r1962.b9deb4e8
pkgrel=1
pkgdesc='The C runtime library for the AVR family of microcontrollers'
arch=(any)
url='https://github.com/avrdudes/avr-libc'
license=(BSD)
depends=(avr-gcc)
makedepends=('git')
provides=('avr-libc')
conflicts=('avr-libc')
options=(!strip) # it corrupts avr libraries
source=('git+https://github.com/avrdudes/avr-libc.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

  # Tags are not included in the main branch
  # git describe --long --tags --match 'avr-libc-*-release' | sed 's/^avr-libc-\(.*\)-release/\1/;s/\([^-]*-g\)/r\1/;s/-\|_/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./bootstrap
  ./configure --build=$(./config.guess) --host=avr --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
