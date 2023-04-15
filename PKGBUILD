# Maintainer: Brate Z <brate kann karate at gmail dot com>
# This is a variant of slock-bgimage of GI_Jack. However, the original source of https://github.com/GIJack/slock-bgimage has been used to patch the actual suckless source repository, keeping a common merge base with upstream.

pkgname=slock-bgimage-cur
_pkgname=slock-bgimage
pkgver=1.5
pkgrel=1
pkgdesc="A simple screen locker for X (patched to allow background images, using the latest upstream)"
arch=('x86_64' 'i686' 'pentium4')
url="https://git.jaytechlab.com/public/slock-bgimage"
license=('MIT')
depends=('libxext' 'libxrandr')
providies=("slock=${pkgver}")
conflicts=("slock")
source=("${_pkgname}-${pkgver}.tar.gz::https://git.jaytechlab.com/api/v1/repos/public/slock-bgimage/archive/${pkgver}.tar.gz")
#source=("slock-$pkgver.tar.bz2::https://hg.suckless.org/slock/archive/$_pkgver.tar.gz")
sha256sums=('95ea8411dbc8f9e2a81277cb18b33760d292e9268e4344f3222012a219a6803a')

prepare() {
  cd "$srcdir/${_pkgname}"
  # TODO: WTF? Why not in source code?
  sed -i 's|static const char \*group = "nobody";|static const char *group = "nobody";|' config.def.h
  sed -ri 's/((CPP|C|LD)FLAGS) =/\1 +=/g' config.mk
}

build() {
  cd "$srcdir/${_pkgname}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/${_pkgname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/_$pkgname/LICENSE"
}

