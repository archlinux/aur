# Maintainer: TingPing <tingping@tingping.se>
# Contributor: scadu <scadu at yandex dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Alain Kalker <a dot c dot kalker at gmail dot com>

_gitname=lgi
pkgname=luajit-lgi-git
pkgver=0.9.0.r37.g9b717c3
pkgrel=1
pkgdesc='Lua binadings for gobject using gobject-introspection library'
arch=('i686' 'x86_64')
url='https://github.com/pavouk/lgi'
license=('custom:MIT')
provides=('luajit-lgi')
conflicts=('luajit-lgi')
depends=('libffi' 'luajit' 'gobject-introspection-runtime')
makedepends=('gobject-introspection')
source=('git+https://github.com/pavouk/lgi.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname

  git describe --long | sed 's/-/.r/; s/-/./'
}

build() {
  cd $_gitname

  make LUA_INCDIR=/usr/include/luajit-2.0/ \
    LUA_CFLAGS="$(pkg-config --cflags luajit) -O2"
}

package() {
  cd $_gitname

  make \
    LUA_LIBDIR=/usr/lib/lua/5.1 \
    LUA_SHAREDIR=/usr/share/lua/5.1 \
    DESTDIR="$pkgdir/" install

  # dump typelib tool
  install -Dm755 tools/dump-typelib.lua \
    "$pkgdir/usr/bin/dump-typelib-luajit"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/* \
    "$pkgdir/usr/share/doc/$pkgname"

  # samples
  install -d "$pkgdir/usr/share/$pkgname/samples/gtk-demo"
  install -Dm644 samples/*.lua \
    "$pkgdir/usr/share/$pkgname/samples"
  install -Dm644 samples/gtk-demo/* \
    "$pkgdir/usr/share/$pkgname/samples/gtk-demo"

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
  cd $_gitname

  make LUA=luajit LUA_INCDIR=/usr/include/luajit-2.0/ \
    LUA_CFLAGS="$(pkg-config --cflags luajit) -O2" check
}

# vim:set ts=2 sw=2 et:
