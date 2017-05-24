pkgname=libcoap-dtls-git
_gitname=libcoap
pkgver=r849.2586304
pkgrel=1
pkgdesc="C-Implementation of CoAP, DTLS"
arch=('x86' 'x86_64')
url="https://libcoap.net/"
license=('BSD2' 'GPL2')
makedepends=('git')
provides=('libcoap')
conflicts=('libcoap')
source=("$_gitname::git://github.com/obgm/libcoap.git#branch=dtls" "automakehack.patch")
md5sums=('SKIP'  'SKIP')
pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {  
  cd "$srcdir/$_gitname"
  git submodule update --init --recursive
  patch -p0 -d "ext/tinydtls" < ../automakehack.patch
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix="/usr" --disable-documentation --disable-shared --without-debug CFLAGS="-D COAP_DEBUG_FD=stderr"
  make DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/$_gitname"
  make DISTDIR="$pkgdir"  DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
