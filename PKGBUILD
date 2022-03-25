# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Anders Bergh <anders1@gmail.com>
# Contributor: Stephen Smith <stephen304@gmail.com>

pkgbase=lua-socket-git
pkgname=(lua-socket-git lua51-socket-git lua52-socket-git lua53-socket-git)
pkgver=3.0.0.r0.g88c8a85
pkgrel=1
pkgdesc='Networking support library for the Lua language'
arch=('x86_64')
url='https://github.com/lunarmodules/luasocket'
license=('MIT')
#options=('debug')
makedepends=('lua' 'lua51' 'lua52' 'lua53' 'git')
source=("git+https://github.com/lunarmodules/luasocket.git")
md5sums=('SKIP')

prepare() {
  cp -a luasocket luasocket-51
  cp -a luasocket luasocket-52
  cp -a luasocket luasocket-53
}

pkgver() {
  cd luasocket
  git describe --always --long --tags --abbrev=7 HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/luasocket-51
  MYCFLAGS="$CFLAGS" MYLDFLAGS=$LDFLAGS make LUAV=5.1 linux

  cd "$srcdir"/luasocket-52
  MYCFLAGS="$CFLAGS" MYLDFLAGS=$LDFLAGS make LUAV=5.2 linux

  cd "$srcdir"/luasocket-53
  MYCFLAGS="$CFLAGS" MYLDFLAGS=$LDFLAGS make LUAV=5.3 linux

  cd "$srcdir"/luasocket
  MYCFLAGS="$CFLAGS" MYLDFLAGS=$LDFLAGS make LUAV=5.4 linux
}

package_lua51-socket-git() {
  depends=('lua51')
  provides=("lua51-socket=$pkgver")
  conflicts=('lua51-socket' 'luasocket')
  replaces=('luasocket')

  cd luasocket-51
  make DESTDIR="$pkgdir" LUAV=5.1 prefix=/usr install-unix
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-socket-git() {
  depends=('lua52')
  provides=("lua52-socket=$pkgver")
  conflicts=('lua52-socket')
  cd luasocket-52
  make DESTDIR="$pkgdir" LUAV=5.2 prefix=/usr install-unix
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-socket-git() {
  depends=('lua53')
  provides=("lua53-socket=$pkgver")
  conflicts=('lua53-socket')
  cd luasocket-53
  make DESTDIR="$pkgdir" LUAV=5.3 prefix=/usr install-unix
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-socket-git() {
  depends=('lua')
  provides=("lua-socket=$pkgver")
  conflicts=('lua-socket')
  cd luasocket
  make DESTDIR="$pkgdir" LUAV=5.4 prefix=/usr install-unix
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
