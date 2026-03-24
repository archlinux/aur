# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: scadu <scadu at yandex dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Sébastien Luttringer
# Contributor: Alain Kalker <a dot c dot kalker at gmail dot com>

pkgname=('luajit-lgi')
pkgver=0.9.2
pkgrel=5
pkgdesc='LuaJIT bindings for gnome/gobject using gobject-introspection library'
url='https://github.com/pavouk/lgi'
arch=('x86_64')
license=('MIT')
depends=('glibc' 'glib2' 'libffi' 'luajit' 'gobject-introspection-runtime')
makedepends=('gobject-introspection')
#replaces=('lgi')
#conflicts=('lgi')
source=(lgi-${pkgver}.tar.gz::https://github.com/pavouk/lgi/archive/${pkgver}.tar.gz
  https://patch-diff.githubusercontent.com/raw/lgi-devs/lgi/pull/352.patch)
sha512sums=('755a96b78530f42da6d4e2664f8e37cb07a356419e7e6448003c3f841c9d98ad18b851715d9eb203ea7eb27b13ec46223fa8a1c90a99fd12960ce85b0a695335'
            '5b53b2f482fd707acee9634d64f9fed382d3ce1deea45802194edebf364da01905b4192aa4e5e7aa804a5d3680275f027fe52c6275553773e889da7d4c0a4a4d')

prepare() {
  cd lgi-${pkgver}
  patch -Np1 -i "${srcdir}/../352.patch"
}

build() {
  cd lgi-${pkgver}
  make LUA_INCDIR=/usr/include/luajit-2.0/ \
       LUA_CFLAGS="$(pkg-config --cflags luajit) -O2"
}

check() {
  cd lgi-${pkgver}
  # TODO: fix cairo-gobject dependency
  # make check
}

package_luajit-lgi() {
  cd lgi-${pkgver}
  make \
    LUA_LIBDIR=/usr/lib/lua/5.1 \
    LUA_SHAREDIR=/usr/share/lua/5.1 \
    DESTDIR="${pkgdir}/" install

  install -Dm 755 tools/dump-typelib.lua "${pkgdir}/usr/bin/dump-typelib-luajit"

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 samples/*.lua -t "${pkgdir}/usr/share/${pkgname}/samples"
  install -Dm 644 samples/gtk-demo/* -t "${pkgdir}/usr/share/${pkgname}/samples/gtk-demo"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
