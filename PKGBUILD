# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_pkgbasename=libasyncns
pkgname=lib32-$_pkgbasename-git
pkgver=0.8+3+g68cd5af
pkgrel=1
pkgdesc="A C library for executing name service queries asynchronously"
arch=(x86_64)
url="http://0pointer.de/lennart/projects/libasyncns"
license=(LGPL)
depends=(lib32-glibc $_pkgbasename)
makedepends=(gcc-multilib git lynx)
provides=(lib32-libasyncns)
conflicts=(lib32-libasyncns)
source=("git://git.0pointer.de/libasyncns.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbasename
  git describe | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgbasename

  # Fix libdir
  sed -i '/^libdir=/s:/lib:/lib32:' *.pc.in

  NOCONFIGURE=1 ./bootstrap.sh
}

build() {
  cd $_pkgbasename
  export CC="gcc -m32" PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgbasename
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,share}
}
