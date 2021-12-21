pkgname=carla-bridges-linux32
pkgver=2.4.1
pkgrel=1
pkgdesc="Carla Linux VST 32-Bit Bridge (Stable)"
arch=(x86_64)
url="https://kxstudio.linuxaudio.org/Applications:Carla"
license=(GPL2)
groups=(pro-audio)
depends=(alsa-lib carla gcc-libs glibc lib32-gcc-libs lib32-glibc libglvnd libx11)
makedepends=(file fluidsynth freetype2 git libsndfile liblo libpulse qt5-tools)
provides=(carla-bridges-linux32)
source=(
  "${pkgname}::git+https://github.com/falkTX/Carla.git#tag=v${pkgver}?signed"
)
sha512sums=('SKIP')
b2sums=('SKIP')
validpgpkeys=('62B11043D2F6EB6672D93103CDBAA37ABC74FBA0')  # falkTX <falktx@falktx.com>

prepare() {
  cd "${pkgname}"
  # fix python 3.10 related crashes
  git cherry-pick -n 91720f6ddcfd00ebf9f0a6613099f53922426726
}

build() {
  cd "$srcdir/${pkgname}"
  make -j$(nproc) posix32
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/lib/carla"
  mkdir -p "${pkgdir}/usr/lib/lv2/carla.lv2"
  mkdir -p "${pkgdir}/usr/lib/vst/carla.vst"
  cp bin/*posix32 "${pkgdir}/usr/lib/carla/"
  cd "${pkgdir}/usr/lib/carla"
  ln -sr *posix32 ../lv2/carla.lv2/
  ln -sr *posix32 ../vst/carla.vst/
}
