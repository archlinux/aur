# Maintainer: Nicholas Wang <wck963@gmail.com>

pkgname=libtgbot-cpp-git
pkgver=r218.7f38839
pkgrel=3
pkgdesc="C++ library for Telegram bot API."
arch=('x86_64')
url="https://github.com/reo7sp/tgbot-cpp"
license=('MIT')
depends=('openssl' 'boost-libs')
makedepends=('boost' 'cmake')
replaces=("libtgbot-cpp")
provides=("libtgbot-cpp")
source=('tgbot-cpp::git+https://github.com/reo7sp/tgbot-cpp.git#branch=master'
	'shared.patch')
md5sums=('SKIP'
	'edfaaac5acf67c4c8f5c1cb7e8c351a8')
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
	patch -p0 -i "$srcdir/shared.patch"
}

build() {
	cd "$srcdir/tgbot-cpp"
	cmake .
	make -j4
}

package() {
	cd "$srcdir/tgbot-cpp"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/usr/local/"* "$pkgdir/usr"
	rmdir "$pkgdir/usr/local"
	install -Dm644 "$srcdir/tgbot-cpp/LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
