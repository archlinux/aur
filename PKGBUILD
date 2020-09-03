# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Pol Marcet Sardà <polmarcetsarda@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Curtis Smith <kman922002@gmail.com>

pkgname=odamex
pkgver=0.8.3
pkgrel=1
pkgdesc='A free client/server multiplayer engine for the classic FPS Doom.'
arch=('i686' 'x86_64' 'aarch64')
url='http://odamex.net/'
license=('GPL')
depends=('sdl2_mixer' 'portmidi' 'wxgtk' 'miniupnpc')
makedepends=('cmake')
optdepends=('timidity++: Required for music')
source=("http://downloads.sourceforge.net/odamex/odamex-src-${pkgver}.tar.gz"
        0001-Fix-WAD-path.patch
        fix-cxxflags.diff)
sha256sums=('26e111bef9af14dd538e6424b6663b24e97eab60fda8c76e2398d575d03b0839'
            'c4ce4072515c7dbfe65d1829a317d21b5f1091e04997761cdfee345a60141638'
            '0541328408d71dfcd7cdf866497f9cc2c7f10780986d2fea5743f5df584d923a')

prepare() {
  cd $pkgname-src-$pkgver
  patch --forward --strip=1 --input="${srcdir}/0001-Fix-WAD-path.patch"
  patch --forward --strip=1 --input="${srcdir}/fix-cxxflags.diff"
}

build() {
  cd $pkgname-src-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release                              \
        -DCMAKE_INSTALL_PREFIX=/usr                             \
        .
  make
}

package() {
  cd $pkgname-src-${pkgver}
  make DESTDIR=$pkgdir install
  # Use system headers.
  rm -r "$pkgdir/usr/include/miniupnpc/"
}

# vim:set ts=2 sw=2 et:
