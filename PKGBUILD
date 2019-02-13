# Maintainer: Fabrizio del Tin <fdt@euniversity.pub>
pkgname=muse-git
pkgver=4.0.0
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
source=("$pkgname"::'git+https://github.com/muse-sequencer/muse.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

build() {
  cd "${srcdir}/muse-git/muse3/"

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
        -DENABLE_PYTHON=1 \
        -DENABLE_FLUID=1 \
        -DENABLE_DSSI=1 \
        -DENABLE_LASH=1 \
        -DENABLE_OSC=1 \
        -DENABLE_RTAUDIO=1 ..
  make
}

package() {
  cd "$srcdir/muse-git/muse3/bld"
  make DESTDIR="$pkgdir" install

  # .. and oomidi grepmidi bin
  cd "$pkgdir/usr/bin"
  mv grepmidi "$pkgname-grepmidi"

  # grepmidi man
  cd "$pkgdir/usr/share/man/man1"
  mv grepmidi.1 "$pkgname-grepmidi.1"
}
