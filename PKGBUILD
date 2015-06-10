# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: LTSmash <lord.ltsmash@gmail.com>

pkgname=psychosynth
pkgver=0.3.0
pkgrel=1
pkgdesc='Interactive 3D software synthesizer, inspired by Reactable'
arch=('x86_64' 'i686')
url='http://www.psychosynth.com/'
license=('GPL3')
depends=('cegui' 'ogre' 'liblo' 'jack' 'soundtouch' 'libsigc++2.0')
makedepends=('boost')
source=("ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5993fa4a8c0b793456f43b18932684eab45ca708db270b9508ca300c6d85197e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  aclocal
  autoconf
  automake
  sed -i 's/AX_BOOST/#/g' configure
  sed -i 's/signals}" !=/signals}" ==/g' configure
  sed -i 's/filesystem}" !=/filesystem}" ==/g' configure
  ./configure --prefix=/usr --bindir=/usr/bin --libdir=/usr/lib --with-boost-filesystem=boost_filesystem --with-bost-signals=boost_signals
  export CXXFLAGS="$CXXFLAGS -lboost_system -lboost_filesystem -lboost_signals"
  find src -type f -exec sed -i 's/-lboost_system-mt/-lboost_system -lboost_signals -lboost_filesystem/g' {} \;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -Dm644 "data/desktop/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "data/desktop/psynth3d.desktop" \
    "$pkgdir/usr/share/applications/psynth3d.desktop"
}

# vim:set ts=2 sw=2 et:
