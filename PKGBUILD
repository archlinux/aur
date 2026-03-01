# Maintainer:  André Menrath <andre dot menrath at posteo dot de>

pkgbase=reevr
pkgname=(
  reevr
  reevr-lv2
  reevr-vst3
)
pkgver=1.4.0
pkgrel=1
pkgdesc="REEV-R is a cross-platform convolution reverb with modulation for pre/send and post/volume signals."
arch=('i686' 'x86_64')
url="https://github.com/tiagolr/reevr"
license=('GPL3')
_common_depends=(
  freetype2
  alsa-lib
)
makedepends=('git' 'lv2' 'cmake' 'libx11' 'freetype2' 'fontconfig' 'alsa-lib' 'libxrandr' 'libxinerama' 'libxcursor')
source=("${pkgbase}::git+https://github.com/tiagolr/reevr.git")
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgbase}"
    git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgbase}"
  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -S . -B ./build
  cmake --build ./build --config Release
}

package_reevr() {
  pkgdesc+=' Standalone version.'
  groups=('pro-audio')
  depends=(
    "${_common_depends[@]}"
  )

  # install required directory
  install -vd "$pkgdir/usr/bin"

  mv "${srcdir}/${pkgbase}/build/REEVR_artefacts/Release/Standalone/REEV-R" "$pkgdir/usr/bin"
}

package_reevr-lv2() {
  pkgdesc+=' LV2 plugin.'
  groups=('pro-audio' 'lv2-plugins')
  depends=(
    "${_common_depends[@]}"
    'lv2-host'
  )

  # install required directory
  install -vd "$pkgdir/usr/lib/lv2"

  mv "${srcdir}/${pkgbase}/build/REEVR_artefacts/Release/LV2/REEV-R.lv2/libREEV-R.so" "$pkgdir/usr/lib/lv2"
}

package_reevr-vst3() {
  pkgdesc+=' VST3 plugin.'
  groups=('pro-audio' 'vst3-plugins')
  depends=(
    "${_common_depends[@]}"
    'vst3-host'
  )

  # install required directory
  install -vd "$pkgdir/usr/lib/vst3"

  mv "${srcdir}/${pkgbase}/build/REEVR_artefacts/Release/VST3/REEV-R.vst3/Contents/x86_64-linux/REEV-R.so" "$pkgdir/usr/lib/vst3"
}