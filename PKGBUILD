# Contributor: anatolik $
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Sébastien Luttringer
# Maintainer: Yauheni Kirylau <yawghen at gmail dot com>

_pkgbase=lgi
pkgbase=lua53-lgi-git
pkgname=$pkgbase
pkgver=0.9.2.r55.g05038e4
pkgrel=1
pkgdesc='Lua 5.3 bindings for gnome/gobject using gobject-introspection library'
arch=(i686 x86_64)
url='https://github.com/pavouk/lgi'
license=('custom:MIT')
depends=('glibc' 'glib2' 'libffi' 'lua53' 'gobject-introspection-runtime')
makedepends=('git' 'gobject-introspection')
replaces=('lgi' 'lua53-lgi')
conflicts=('lgi' 'lua53-lgi')
provides=('lua53-lgi')
source=('git+https://github.com/pavouk/lgi.git')
md5sums=('SKIP')
_LUA_VER=5.3

pkgver() {
  cd $_pkgbase
  git describe --long | sed 's/-/.r/; s/-/./'
}


build() {
  cd $_pkgbase
  make LUA_INCDIR=/usr/include/lua${_LUA_VER}/ \
    LUA_CFLAGS="$(pkg-config --cflags lua${_LUA_VER}) -O2"
}

package() {
  cd $_pkgbase
  make \
    LUA_LIBDIR=/usr/lib/lua/${_LUA_VER} \
    LUA_SHAREDIR=/usr/share/lua/${_LUA_VER} \
    DESTDIR="$pkgdir/" install

  # dump typelib tool
  install -Dm755 tools/dump-typelib.lua \
    "$pkgdir/usr/bin/dump-typelib"

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
