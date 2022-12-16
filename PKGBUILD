# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=hyperion-hercules
pkgver=4.5
pkgrel=1
pkgdesc='Software implementation of System/370 and ESA/390'
arch=('x86_64')
url='https://sdl-hercules-390.github.io/html/'
license=('custom')
depends=('bzip2' 'libnsl' 'zlib')
optdepends=('x3270: terminal support')
conflicts=('hercules')
options=('!makeflags')
source=("https://github.com/SDL-Hercules-390/hyperion/archive/refs/tags/Release_${pkgver}.tar.gz")
sha256sums=('f4d9b53d1813c4beb0ca0ef47748a2a5ea6cea6aa016e36394cc46e7a585c794')

prepare() {
  ln -sf "hyperion-Release_${pkgver}" p
  # Change module extension from .la to .so.
  #sed '/HDL_MODULE_SUFFIX/ s/\.la/.so/' -i p/hdl.h
  sed '/^ *CFLAGS="-W / d' -i p/configure
  sed '/^ *CFLAGS="-Wall / d' -i p/configure
}

build() {
  cd p
  # --enable-optimization=no use CFLAGS supplied by makepkg
  # --enable-multi-cpu=2
  ./configure --prefix=/usr --enable-optimization=no --enable-multi-cpu=2
  make
}

package() {
  cd p
  DESTDIR="$pkgdir" make install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/${pkgname}/qpl1"
}

# vim: ts=2 sw=2 et:
