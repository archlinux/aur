# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Ildaeil
pkgname=${_name,,}
pkgver=1.2
pkgrel=1
pkgdesc='A mini-plugin host working as a plugin'
arch=(x86_64 aarch64)
url="https://github.com/DISTRHO/$_name"
license=(GPL2)
depends=(carla gcc-libs glibc libx11 libxcursor libxrandr)
makedepends=(dbus flac libglvnd libogg libsndfile libvorbis opus)
provides=(lv2-host)
groups=(clap-plugins lv2-plugins pro-audio vst-plugins vst3-plugins)
optdepends=(
    'clap-host: for CLAP plugins'
    'lv2-host: for LV2 plugins'
    'vst-host: for VST2 plugins'
    'vst3-host: for VST3 plugins'
)
source=("https://github.com/DISTRHO/$_name/releases/download/v$pkgver/$_name-src-$pkgver.tar.xz")
sha256sums=('9bdcdc0e563e4e990d3775cd7ac845b9799f7e2da090e85ecb1b438ddb2be2d3')


build() {
  cd $_name-$pkgver
  make \
    USE_SYSTEM_CARLA_BINS=true \
    SKIP_NATIVE_AUDIO_FALLBACK=true \
    VERBOSE=1
}

package() {
  depends+=(libbz2.so libcap.so libFLAC.so libGL.so libGLdispatch.so libGLX.so
            libdbus-1.so libopus.so libmagic.so libogg.so libsndfile.so
            libsystemd.so libvorbis.so libzstd.so)
  cd $_name-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  chmod +x "$pkgdir"/usr/lib/vst/$_name.vst/*.so \
    "$pkgdir"/usr/lib/lv2/$_name-*.lv2/*.so \
    "$pkgdir"/usr/lib/clap/$_name.clap/*.clap
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 screenshots/*.png -t "$pkgdir"/usr/share/doc/$pkgname/screenshots
}
