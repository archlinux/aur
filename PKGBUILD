# Maintainer: drarig29 <corentingirard.dev@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Denis Meiswinkel <denis.meiswinkel@gmail.com>
# Contributor: Balló György <ballogyor+arch@gmail.com>
# Contributor: Tony Smith <bakugantony@proton.me>

pkgname=dee
pkgver=1.2.8
pkgrel=15
pkgdesc="Model to synchronize multiple instances over DBus"
arch=("x86_64")
url="https://github.com/MercySimp/dee"
license=("LGPL3.0")
depends=("glib2" "icu")
makedepends=("gobject-introspection" "python" "vala")
source=("${pkgname}-${pkgver}.tar.gz::$url/blob/main/${pkgname}-${pkgver}.tar.gz"
         dee-1.2.7-gcc6-fixes.patch
         dee-1.2.7-fix-duplicates-vala-0.5X.patch
         dee-1.2.7-deprecated-g_type_class_add_private.patch
         dee-1.2.7-fix-g_string_free-usage.patch
         vapi-skip-properties.patch)
sha256sums=('212872b3f6bf433820976c5147543c05232a0177f23a614e51c5f17554846fa1'
            '0a97d52b6c1e63ac070d9870914b1741d0bd2cd69f179c6a8ae69d0482905d38'
            '03acd7a0f80a89d7520df27396ba9771b3cc3688f759eee7283f8bcc3852a988'
            'e9be91ded88cbb8256ea71d20a71be6ca8e304bc971902e28ffe9bba0ac1dc05'
            'cc5cffd8ad8803ec39c625d782e7cbfdd6380dca6d0fbe0f4253a35222519569'
            'ba0f9f80e3827fc4e1e546e4011982512b5b09e8f66496b213a4bd319bf829f5')

prepare() {
  cd ${pkgname}-${pkgver}
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
