# PKGBUILD for lua52-lgi
# lua-lgi Maintainer: speps <speps at aur dot archlinux dot org>
# lua-lgi Maintainer: Sébastien Luttringer

_pkgbase=lgi
pkgname=lua52-lgi
pkgver=0.9.1
pkgrel=1
pkgdesc='Lua 5.2 bindings for gnome/gobject using gobject-introspection library'
arch=(i686 x86_64)
url='https://github.com/pavouk/lgi'
license=('custom:MIT')
depends=('glibc' 'glib2' 'libffi' 'lua52' 'gobject-introspection-runtime')
makedepends=('gobject-introspection')
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/pavouk/$_pkgbase/archive/$pkgver.tar.gz")
md5sums=('0c85f177e4b8192bd849b4e508c8bdf0')

build() {
  cd $_pkgbase-$pkgver
  make PREFIX=/usr LUA_VERSION=5.2 LUA_CFLAGS="$(pkg-config --cflags lua52) -O2"
}

package() {
  cd $_pkgbase-$pkgver
  make \
    LUA_LIBDIR=/usr/lib/lua/5.2 \
    LUA_SHAREDIR=/usr/share/lua/5.2 \
    DESTDIR="$pkgdir/" install

  # dump typelib tool
  install -Dm755 tools/dump-typelib.lua \
    "$pkgdir/usr/bin/dump-typelib-lua5.2"

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

# vim:set ts=2 sw=2 et:
