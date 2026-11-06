# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_name=libcvec
pkgname="$_name"-git
pkgver=r5.c2dcb09
pkgrel=1
pkgdesc="Generic C++ vector library for C (bleeding edge)"
arch=('x86_64')
url="https://tvoygit.ru/vi_is_lonely/${_name}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'clang')
conflicts=("${_name}")

source=(
  "git+${url}#branch=main"
  'makefile-paths.patch'
)
sha256sums=('SKIP'
            'c33b56e20d4277d441b7438032b43601e671ab43be20597ec1fdeec8e439fb04')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_name}"
  patch -p1 -F0 -i "$srcdir/makefile-paths.patch"
  sed -i "s|\$(DESTDIR)|$pkgdir/|g; s|\$(libdir)|usr/lib|g; s|\$(includedir)|usr/include|g" Makefile
}

build() {
  cd "$srcdir/${_name}"
  make build
}

package() {
  cd "$srcdir/${_name}"
  make install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

