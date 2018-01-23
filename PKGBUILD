# Maintainer: Yan Burdonsky <psyrccio@gmail.com>
# Contributor: Ainola
# Contributor: speps
# Contributor: Bernardo Barros
pkgname=muse
pkgver=3.0.1
pkgrel=1
pkgdesc="A MIDI/Audio sequencer with recording and editing capabilities"
arch=('i686' 'x86_64')
url="http://muse-sequencer.org/"
license=('GPL2')
depends=('qt5-base' 'fluidsynth' 'liblo' 'gtkmm' 'lib32-gtk2' 'gcc-libs-multilib' 'jack' 'rtaudio')
makedepends=('cmake' 'gcc6' 'ladspa' 'lv2' 'dssi' 'dssi-vst' 'ladish' 'liblo' 'qt5-tools')
optdepends=(
    'python2: Python scripting'
    'python2-pyqt5: Python scripting'
    'ladspa: ladspa plugin support'
    'lv2: lv2 plugin support'
    'dssi: dssi plugin support'
    'dssi-vst: dssi-vst plugins support'
    'ladish: LASH session support'
)
install="${pkgname}.install"
provides=('muse')
conflicts=('muse')
source=("https://github.com/muse-sequencer/muse/archive/muse_${pkgver//./_}.tar.gz")
sha256sums=('49326fce7b2aecbc4b6f70b86cc5e502d3d8c8872f5f3583a9fe945865d6372e')

build() {
  cd "${srcdir}/muse-muse_${pkgver//./_}/muse3"

  # build dir
  [ -d bld ] || mkdir bld && cd bld

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=release \
        -DCMAKE_CXX_COMPILER=/usr/bin/c++-6 \
        -DCMAKE_CXX_COMPILER_AR=/usr/bin/gcc-ar-6 \
        -DCMAKE_CXX_COMPILER_RANLIB=/usr/bin/gcc-ranlib-6 \
        -DCMAKE_C_COMPILER=/usr/bin/cc-6 \
        -DCMAKE_C_COMPILER_AR=/usr/bin/gcc-ar-6 \
        -DCMAKE_C_COMPILER_RANLIB=/usr/bin/gcc-ranlib-6 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DENABLE_VST_VESTIGE=1 \
        -DENABLE_VST_NATIVE=1 \
        -DENABLE_LV2=1 \
        -DENABLE_PYTHON=1 \
        -DENABLE_FLUID=1 \
        -DENABLE_DSSI=1 \
        -DENABLE_LASH=1 \
        -DENABLE_OSC=1 \
        -DENABLE_RTAUDIO=1 ..
  make
}

package() {
  cd "$srcdir/muse-muse_${pkgver//./_}/muse3/bld"
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
