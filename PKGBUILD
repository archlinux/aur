# Maintainer: schaap137 <dojo86@gmail.com>
pkgname=chugins-git
pkgver=chuck.1.5.5.0.r14.g2284f96
pkgrel=4
pkgdesc="Repository for ChuGins (to use with chuck)"
arch=('i686' 'x86_64')
url="https://github.com/ccrma/chugins"
license=('GPL')
depends=('chuck')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/ccrma/chugins.git")
#buildflags=('FLAGS="${FLAGS} -std=c++14"')
sha256sums=('SKIP')

pkgver() {
  # The version
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g" | sed "s/chugins.//g"
}

prepare() {
  cd "$srcdir/$pkgname"
  # Change JACK to PULSE if you use chuck-pulse, or comment out the next line if you use chuck-alsa
  sed -e 's/__LINUX_ALSA__/__LINUX_JACK__/g' -i **/makefile.linux
  sed -e 's/\/usr\/local\/lib/\/usr\/lib/g' -i **/makefile.linux makefile
  # Fix for missing include to circumvent integer type error in latest gcc
  sed -i 's|#include <cstdlib> // malloc / free|#include <cstdlib> // malloc / free\n#include <cstdint> // integer types|' NHHall/nh_hall.hpp
}

build() {
  cd "$srcdir/$pkgname"
  make linux
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir"/usr/lib/chuck
  install -Dm755 **/*.chug "$pkgdir"/usr/lib/chuck/
  mkdir -p "$pkgdir"/usr/share/doc/chuck/examples/chugins
  while read -r file; do install -Dm644 "$file" "$pkgdir/usr/share/doc/chuck/examples/chugins/$file"; done < <(find . -type f -regex '.*\.\(md\|wav\|ck\)')
}
