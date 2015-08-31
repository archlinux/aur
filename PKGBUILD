# Maintainer: Ainola
# Contributor: speps
# Contributor: Bernardo Barros

pkgname=muse
pkgver=2.2.1
pkgrel=1
pkgdesc="A MIDI/Audio sequencer with recording and editing capabilities"
arch=('i686' 'x86_64')
url="http://muse-sequencer.org/"
license=('GPL2')
depends=('qt4' 'fluidsynth' 'lash' 'liblo')
makedepends=('cmake' 'doxygen' 'graphviz' 'ladspa' 'dssi')
optdepends=('dssi: DSSI plugins'
            'ladspa: LADSPA plugins')
install="${pkgname}.install"
source=("https://github.com/muse-sequencer/muse/archive/muse_${pkgver//./_}.tar.gz")
sha256sums=('eab3b1051bc46ebc150af913e47ffaf6ce447889236819f44e74336aa5f71d32')

build() {
  cd "${srcdir}/muse-muse_${pkgver//./_}/muse2"

  # build dir
  [ -d bld ] || mkdir bld && cd bld

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=release \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
        -DCMAKE_ENABLE_VST_VESTIGE=1 \
        -DCMAKE_ENABLE_VST_NATIVE=1 \
        -DENABLE_PYTHON=1 \
        -DENABLE_FLUID=1 \
        -DENABLE_DSSI=1 \
        -DENABLE_LASH=1 \
        -DENABLE_OSC=1 ..
  make
}

package() {
  cd "$srcdir/muse-muse_${pkgver//./_}/muse2/bld"
  make DESTDIR="$pkgdir" install

  # .. and oomidi grepmidi bin
  cd "$pkgdir/usr/bin"
  mv grepmidi "$pkgname-grepmidi"

  # grepmidi man
  cd "$pkgdir/usr/share/man/man1"
  mv grepmidi.1 "$pkgname-grepmidi.1"

  # python2 Fixes
  sed -i "s/\#\!.*python/&2/" \
    `grep -rl "\#\!.*python" "$pkgdir"`
}
