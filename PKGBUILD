# Contributor: anatolik $
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Sébastien Luttringer
# Maintainer: Yauheni Kirylau <yawghen at gmail dot com>

_pkgbase=lgi
pkgbase=lua-lgi-git
pkgname=$pkgbase
pkgver=0.9.0.r30.g2c5e63d
pkgrel=1
pkgdesc='Lua bindings for gnome/gobject using gobject-introspection library'
arch=(i686 x86_64)
url='https://github.com/pavouk/lgi'
license=('custom:MIT')
depends=('glibc' 'glib2' 'libffi' 'lua' 'gobject-introspection-runtime')
makedepends=('gobject-introspection')
replaces=('lgi' 'lua-lgi')
conflicts=('lgi' 'lua-lgi')
provides=('lua-lgi')
source=('git+https://github.com/pavouk/lgi.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long | sed 's/-/.r/; s/-/./'
}


build() {
  cd $_pkgbase
  make
}

package() {
  cd $_pkgbase
  make \
    LUA_LIBDIR=/usr/lib/lua/5.3 \
    LUA_SHAREDIR=/usr/share/lua/5.3 \
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
