# Maintainer: Fabrizio del Tin <fdt@euniversity.pub>
# Contributor: Yan Burdinsky
# Contributor: Ainola
# Contributor: speps
# Contributor: Bernardo Barros
# Contributor: donarturo <arturwrona91@gmail.com>
pkgname=muse
pkgver=3.1
pkgrel=1
pkgdesc="A MIDI/Audio sequencer with recording and editing capabilities"
arch=('i686' 'x86_64')
url="http://muse-sequencer.org/"
license=('GPL2')
depends=('qt5-base' 'fluidsynth' 'liblo' 'gtkmm' 'lib32-gtk2'
'gcc-libs-multilib' 'jack2' 'rtaudio')
makedepends=('cmake' 'gcc' 'ladspa' 'lv2' 'dssi'
'dssi-vst' 'ladish' 'liblo' 'qt5-tools')
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
source=("https://github.com/muse-sequencer/muse/releases/download/muse_3_1_0/muse-${pkgver}.tar.gz")
sha256sums=('b2d5c57ea30607cd9f7bea8b5d6488c54de732a1565db8e88f5536c1e478e875')
#md5sums=('45557bf2f0932daedd057678b3faf913')

build() {
  cd "${srcdir}/muse-${pkgver}/"

 sed -i '1s/^/#include <QAction>\n\n/' muse/mplugins/mitplugin.cpp
  sed -i 's/PyInt_AsLong/PyLong_AsLong/g' muse/remote/pyapi.cpp
  sed -i 's/PyString_AsString/PyBytes_AsString/g' muse/remote/pyapi.cpp
  sed -i 's/static void\* pyapithreadfunc(void\*)/static struct PyModuleDef muse =\n{\n    PyModuleDef_HEAD_INIT,\n    "muse", \/\* name of module \*\/\n    "",          \/\* module documentation, may be NULL \*\/\n    -1,          \/\* size of per-interpreter state of the module, or -1 if the module keeps state in global variables. \*\/\n    g_methodDefinitions\n};\n\nstatic void\* pyapithreadfunc(void\*)/' muse/remote/pyapi.cpp
  sed -i 's/Py_InitModule( "muse", g_methodDefinitions );/PyModule_Create( \&muse );/' muse/remote/pyapi.cpp

  # build dir
  [ -d bld ] || mkdir bld && cd bld

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=release \
        -DENABLE_VST_VESTIGE=1 \
        -DENABLE_VST_NATIVE=1 \
        -DENABLE_LV2=1 \
        -DENABLE_LV2_GTK2=ON \
        -DENABLE_LV2_MAKE_PATH=ON \
        -DENABLE_PYTHON=1 \
        -DENABLE_MIDNAM=ON \
        -DENABLE_FLUID=1 \
        -DENABLE_DSSI=1 \
        -DENABLE_LASH=1 \
        -DENABLE_OSC=1 \
        -DENABLE_RTAUDIO=1 ..
  make
}

package() {
  cd "$srcdir/muse-${pkgver}/bld"
  make DESTDIR="$pkgdir" install

  # .. and oomidi grepmidi bin
  cd "$pkgdir/usr/bin"
  mv grepmidi "$pkgname-grepmidi"

  # grepmidi man
  cd "$pkgdir/usr/share/man/man1"
  mv grepmidi.1 "$pkgname-grepmidi.1"

  # python2 Fixes
#  sed -i "s/\#\!.*python/&2/" \
#    `grep -rl "\#\!.*python" "$pkgdir"`
}

