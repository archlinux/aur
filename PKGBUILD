pkgname=carla-bridges-linux32
pkgver=2.4.1
pkgrel=1
pkgdesc="Carla linux32 bridge (Stable)"
arch=('x86_64')
url="https://kxstudio.linuxaudio.org/Applications:Carla"
license=('GPL2')
groups=('pro-audio')
depends=('carla' 'gcc-libs' 'glibc' 'lib32-alsa-lib' 'lib32-gcc-libs' 'lib32-glib2' 'lib32-glibc' 'lib32-gtk2' 'lib32-gtk3' 'lib32-libglvnd' 'lib32-libx11' 'libglvnd' 'libx11' 'python-pyqt5' 'python-pyliblo'
'python-rdflib' 'qt5-base' 'qt5-svg')
makedepends=('alsa-lib' 'file' 'fluidsynth' 'gcc-multilib' 'glib2' 'gtk2' 'gtk3'
'libsndfile' 'liblo' 'libpulse' 'qt5-tools')
conflicts=('carla-bridges-linux32-git')
provides=('carla-bridges-linux32')
source=("https://github.com/falkTX/Carla/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bbb188a672ea8871b11648d36770ba013497d03407ca9c73ed68429016f7536f')

build() {
  cd "$srcdir/Carla-${pkgver}"
  make -j$(nproc) features
  make -j$(nproc)
  make -j$(nproc) posix32 HAVE_LIBLO=false
  make -j$(nproc) posix32 TESTBUILD=false
}

package() {
  # libpulse is linked against in carla/libcarla_standalone2.so
  # liblo is linked against in carla/libcarla_standalone2.so,
  # carla/libcarla_native-plugin.so and the lv2 and vst plugins
  depends+=('libasound.so' 'libfluidsynth.so' 'libgdk-3.so'
  'libgdk-x11-2.0.so' 'libgobject-2.0.so' 'libglib-2.0.so' 'libgtk-3.so'
  'libgtk-x11-2.0.so' 'liblo.so' 'libmagic.so' 'libpulse.so'
  'libpulse-simple.so' 'libsndfile.so')

  cd "$srcdir/Carla-${pkgver}"
  mkdir -p "$pkgdir/usr/lib/carla"
  cp bin/carla-bridge-posix32 "$pkgdir/usr/lib/carla/carla-bridge-posix32"
  cp bin/carla-discovery-posix32 "$pkgdir/usr/lib/carla/carla-discovery-posix32"
  mkdir -p "$pkgdir/usr/lib/lv2/carla.lv2"
  mkdir -p "$pkgdir/usr/lib/vst/carla.vst"
  cd "$pkgdir/usr/lib/carla"
  ln -sr carla-bridge-posix32 ../lv2/carla.lv2/carla-bridge-posix32
  ln -sr carla-discovery-posix32 ../lv2/carla.lv2/carla-discovery-posix32
  ln -sr carla-bridge-posix32 ../vst/carla.vst/carla-bridge-posix32
  ln -sr carla-discovery-posix32 ../vst/carla.vst/carla-discovery-posix32
}
# vim:set ts=2 sw=2 et:
