# Maintainer: Fabrizio del Tin <fdt@euniversity.pub>
pkgname=muse-git
pkgver=latest.r0.8b83cb3e
pkgrel=1
pkgdesc="A MIDI/Audio sequencer with recording and editing capabilities"
arch=('i686' 'x86_64')
url="http://muse-sequencer.org/"
license=('GPL2')
depends=('qt5-base' 'fluidsynth' 'liblo' 'gtkmm' 'lib32-gtk2' 'gcc-libs-multilib' 'jack' 'rtaudio')
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
provides=('muse-git')
conflicts=('muse')
source=('git+https://github.com/muse-sequencer/muse.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/muse"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/_/./g;s/muse.//g')"
}

build() {
  cd "${srcdir}/muse/src/"

  # build dir
  [ -d build ] || mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=release \
        -DENABLE_VST_VESTIGE=1 \
        -DENABLE_VST_NATIVE=1 \
        -DENABLE_PYTHON=1 \
        -DENABLE_FLUID=1 \
        -DENABLE_DSSI=1 \
        -DENABLE_LASH=1 \
        -DENABLE_OSC=1 \
        -DENABLE_RTAUDIO=1 ..

#        -DENABLE_LV2=1 \
#        -DENABLE_LV2_MAKE_PATH=1 \

  make -j$(nproc)
}

package() {
  cd "$srcdir/muse/src/build"
  make DESTDIR="$pkgdir" install

  # .. and oomidi grepmidi bin
  cd "$pkgdir/usr/bin"
  mv grepmidi "$pkgname-grepmidi"

  # grepmidi man
  cd "$pkgdir/usr/share/man/man1"
  mv grepmidi.1 "$pkgname-grepmidi.1"
}
