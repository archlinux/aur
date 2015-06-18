# $Id: PKGBUILD 81537 2012-12-23 19:51:51Z seblu $
# Maintainer: scadu <scadu at yandex dot com>
# Maintainer: speps <speps at aur dot archlinux dot org>
# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Alain Kalker <a dot c dot kalker at gmail dot com>

_pkgbase=lgi
pkgname=luajit-lgi
pkgver=0.9.0
pkgrel=1
pkgdesc='Lua binadings for gnome/gobject using gobject-introspection library'
arch=(i686 x86_64)
url='https://github.com/pavouk/lgi'
license=('custom:MIT')
depends=('glibc' 'glib2' 'libffi' 'luajit' 'gobject-introspection')
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/pavouk/$_pkgbase/archive/$pkgver.tar.gz")
md5sums=('cc433a597f23cfabdfc905c6c2cd3d7c')
conflicts=('lgi')

build() {
  cd $_pkgbase-$pkgver
  make LUA_INCDIR=/usr/include/luajit-2.0/ \
    LUA_CFLAGS=$(pkg-config --cflags luajit)
}

package() {
  cd $_pkgbase-$pkgver
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

# vim:set ts=2 sw=2 et:
