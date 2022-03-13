# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vmaf
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=9.0.gf675a90
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=175862'
license=('GPL')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             'nasm'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-VMAF.git"
        'libvmaf::git+https://github.com/Netflix/vmaf.git'
        )
sha256sums=('SKIP'
            'SKIP'
            )
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p build{,-vmaf}
}

build() {
  cd "${srcdir}/build-vmaf"
    arch-meson  ../libvmaf/libvmaf \
     --default-library=static \
     --prefix="${srcdir}/fakeroot/usr" \
     -Denable_tests=false \
     -Denable_docs=false \
     -Dbuilt_in_models=true

  ninja install

  cd "${srcdir}/build"
  PKG_CONFIG_PATH="${srcdir}/fakeroot/usr/lib/pkgconfig" \
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
