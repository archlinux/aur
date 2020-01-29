# Maintainer: milkii on Freenode
# Maintainer: Lieven Moors lievenmoors<aT>gmail<d0t>com
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com


_pkgname=radium_compressor
pkgname=${_pkgname}-git
pkgver=0.5.1.r10.gc19c3e3
pkgrel=1
pkgdesc="A standalone JACK audio compressor"
arch=(i686 x86_64)
url="http://users.notam02.no/~kjetism/radium/compressor_plugin.php"
license=('GPL2')
conflicts=('radium_compressor')
provides=('radium_compressor')
depends=(jack qt5-base)
makedepends=(faust)
source=("git+https://github.com/kmatheussen/radium_compressor"
		"radium_compressor.desktop"
		"radium_compressor.png")

md5sums=('SKIP'
         '19b176fb5434ebd1ef2e4fcd21081e6b'
         'c535752663bd92f3467e9aef7a5316fe')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  # patch -p0 -i ../Makefile.patch
  make
# make CXXFLAGS="-march=native"
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
  
  install -Dm644 ../$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm644 ../$_pkgname.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
}

# vim:set ts=2 sw=2 et:
