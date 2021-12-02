# Maintainer: SeerLite <seerlite@tuta.io>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xkeyboard-config-bbkt
real_pkgver=2.34-1
pkgver=${real_pkgver//-/_}
pkgrel=1
pkgdesc="Upstream XKB configuration files patched with DreymaR's Big Bag mods (Colemak)"
arch=(any)
license=('custom')
url="https://github.com/SeerLite/xkeyboard-config-bbkt"
makedepends=('xorg-xkbcomp' 'libxslt' 'python' 'meson')
provides=('xkbdata' 'xkeyboard-config')
replaces=('xkbdata')
conflicts=('xkbdata' 'xkeyboard-config')
source=(https://xorg.freedesktop.org/archive/individual/data/${pkgname}/${pkgname}-${real_pkgver}.tar.bz2{,.sig})
source=(https://github.com/SeerLite/${pkgname}/releases/download/${pkgname}-${real_pkgver}/${pkgname}-${real_pkgver}.tar.bz2)
sha512sums=('0707aaa6c877bb76d91c5b0df9899de9e5a7dac0e999551bd0ee6f20527f171542bb451bc9378ac89e74f4f1aae1b450a07aa50ad209da600f59d2908a6b1fe1')

build() {
  arch-meson ${pkgname}-${real_pkgver} build \
	-D xkb-base="/usr/share/X11/xkb" \
	-D compat-rules=true \
	-D xorg-rules-symlinks=true

  # Print config
  meson configure build

  ninja -C build

 }
 
 package() { 

  DESTDIR="$pkgdir" ninja -C build install

  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 ${pkgname}-${real_pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
