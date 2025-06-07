# Maintainer: drarig29 <corentingirard.dev@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Denis Meiswinkel <denis.meiswinkel@gmail.com>
# Contributor: Balló György <ballogyor+arch@gmail.com>
# Contributor: Tony Smith <bakugantony@proton.me>

pkgname=dee
pkgver=1.2.9
pkgrel=16
pkgdesc="Model to synchronize multiple instances over DBus"
arch=("x86_64")
url="https://github.com/MercySimp/dee"
license=("LGPL3.0")
depends=("glib2" "icu")
makedepends=("gobject-introspection" "python" "vala")
source=("${pkgname}-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a13d87e6ca95ad0974f112c0a996d4988d67201946ee8dc7c75b36d0c9c38d5f')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../dee-1.2.7-gcc6-fixes.patch
  patch -Np1 -i ../dee-1.2.7-fix-duplicates-vala-0.5X.patch
  patch -Np1 -i ../dee-1.2.7-deprecated-g_type_class_add_private.patch
  patch -Np1 -i ../dee-1.2.7-fix-g_string_free-usage.patch
  patch -Np1 -i ../vapi-skip-properties.patch
  autoreconf -fi
}

build() {
	cd ${pkgname}-${pkgver}
	export PYTHON="/usr/bin/python"
	./configure --prefix="/usr" --sysconfdir="/etc" --localstatedir="/var" --disable-{static,tests}
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
