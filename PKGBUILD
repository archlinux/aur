# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=ganv
pkgver=1.8.2
pkgrel=1
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces"
arch=(x86_64)
url="https://drobilla.net/software/ganv.html"
license=(GPL3)
depends=(cairo gcc-libs glibc graphviz)
makedepends=(glib2 gobject-introspection gtk2 gtkmm harfbuzz libsigc++ meson pango)
provides=(libganv-1.so)
source=(https://download.drobilla.net/ganv-$pkgver.tar.xz{,.sig})
sha512sums=('12544d45fc3b06a02dcfaf41be266770a8dcbd079979b07cb1a05388e3cdddd54040b609f76c16c8982d89f864e5000d04fd2d09d8036705a41cafe944c2a6dd'
            'SKIP')
b2sums=('45e5370f3b94a7010f89943225748e40291583f7d2cc80f637f3db4fac3a03c9b58217bd8e8119f7867302c43846be47e928721addce68560c63cec5faa3b4d4'
        'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
  # NOTE: something probably provides intl, but we don't have it, so disable natural language support
  arch-meson $pkgname-$pkgver build -D nls=disabled
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  depends+=(libgdk-x11-2.0.so libglib-2.0.so libgobject-2.0.so
  libgtk-x11-2.0.so libpangocairo-1.0.so libpango-1.0.so libsigc-2.0.so)

  meson install -C build --destdir "$pkgdir"
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,NEWS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
