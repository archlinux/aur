# Maintainer: Yan Burdonsky <psyrccio@gmail.com>
# Contributor: Ainola
# Contributor: speps
# Contributor: Bernardo Barros
pkgname=muse
pkgver=3.0.pre1
pkgrel=3
pkgdesc="A MIDI/Audio sequencer with recording and editing capabilities"
arch=('i686' 'x86_64')
url="http://muse-sequencer.org/"
license=('GPL2')
depends=('qt5-base' 'fluidsynth' 'liblo' 'gtkmm' 'lib32-gtk2' 'gcc-libs-multilib' 'jack')
makedepends=('cmake' 'gcc' 'ladspa' 'lv2' 'dssi' 'dssi-vst' 'ladish' 'liblo' 'qt5-tools')
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
sha256sums=('ce04fb02a88129d0fc458086bcf2f6700ad0ad7989715d15bf89da693104c4c2')

build() {
  cd "${srcdir}/muse-muse_${pkgver//./_}/muse3"

  # build dir
  [ -d bld ] || mkdir bld && cd bld

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=release \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DENABLE_VST_VESTIGE=1 \
        -DENABLE_VST_NATIVE=1 \
        -DENABLE_LV2=1 \
        -DENABLE_PYTHON=1 \
        -DENABLE_FLUID=1 \
        -DENABLE_DSSI=1 \
        -DENABLE_LASH=1 \
        -DENABLE_OSC=1 ..
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
