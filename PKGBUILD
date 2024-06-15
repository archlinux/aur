# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=StompTuner
pkgname=${_name,,}
pkgver=0.5
pkgrel=1
pkgdesc='A multi-format instrument strobe tuner plugin and JACK application'
arch=(aarch64 x86_64)
url='https://github.com/brummer10/StompTuner'
license=(GPL-3.0-or-later)
depends=(cairo dbus fftw glibc gcc-libs libx11 libxcursor libxext libxrandr)
makedepends=(git)
optdepends=(
  'jack: for using the stand-alone programs with JACK'
  'clap-host: for loading the CLAP format plugins'
  'lv2-host: for loading the LV2 format plugins'
  'vst-host: for loading the VST2 format plugins'
  'vst3-host: for loading the VST3 format plugins'
)
groups=(clap-plugins lv2-plugins pro-audio vst-plugins vst3-plugins)
source=(
  "git+https://github.com/brummer10/$_name#tag=v$pkgver"
  'git+https://github.com/DISTRHO/DPF'
  'git+https://github.com/DISTRHO/pugl'
)
sha256sums=('baf1b301b69e40a2e2d4c1ebfe83c9818c861f69fdf73d3ebe95e34279920aa1'
            'SKIP'
            'SKIP')

prepare() {
  cd $_name

  # setup submodules
  git submodule init dpf
  git submodule set-url dpf "$srcdir"/DPF
  git -c protocol.file.allow=always submodule update
  cd dpf
  git submodule init dgl/src/pugl-upstream
  git submodule set-url dgl/src/pugl-upstream "$srcdir"/pugl
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $_name
  make SKIP_NATIVE_AUDIO_FALLBACK=true BUILD_AU=false
}

package() {
  depends+=(libcairo.so libdbus-1.so libfftw3f.so)
  cd $_name
  make DESTDIR="$pkgdir" PREFIX=/usr BUILD_AU=false install
}
