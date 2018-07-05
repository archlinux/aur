# Maintainer: Nicholas Wang <wck963@gmail.com>

pkgname=libtgbot-cpp-git
pkgver=r218.7f38839
pkgrel=1
pkgdesc="C++ library for Telegram bot API."
arch=('x86_64')
url="https://github.com/reo7sp/tgbot-cpp"
license=('MIT')
depends=('glibc' 'openssl' 'boost-libs' 'gcc-libs')
makedepends=('boost')
replaces=("libtgbot-cpp")
source=('tgbot-cpp::git+https://github.com/reo7sp/tgbot-cpp.git#branch=master')
md5sums=('SKIP')
epoch=1

pkgver() {
  cd tgbot-cpp
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$srcdir/tgbot-cpp"
	patch -p1 -i "$srcdir/shared.patch"
}

build() {
	cd "$srcdir/tgbot-cpp"
	cmake .
	make -j4
}

package() {
	cd "$srcdir/tgbot-cpp"
	make DESTDIR="$pkgdir/" install
}
