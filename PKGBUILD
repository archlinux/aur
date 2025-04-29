# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

_upstream_name='stompbox'
pkgname="${_upstream_name}-jack-git"
pkgver='0.1.13.r10.g5b11c1f'
pkgrel=1
pkgdesc='Guitar amplification and effects library (headless JACK client)'
arch=('x86_64' 'aarch64')
url="https://github.com/mikeoliphant/${_upstream_name}"
license=('GPL-3.0-only')
groups=('pro-audio')
depends=('glibc' 'gcc-libs' 'jack')
_comp_name="${pkgname//-git}"
conflicts=("$_comp_name")
provides=("$_comp_name")
makedepends=('git' 'libjack.so')
source=(
  "git+${url}"
  "git+https://github.com/mackron/dr_libs"
  "git+https://github.com/avaneev/r8brain-free-src"
  "git+https://github.com/mikeoliphant/WDL"
  "git+https://github.com/mikeoliphant/NeuralAudio"
  "git+https://github.com/mikeoliphant/NeuralAmpModelerCore"
  "git+https://github.com/mikeoliphant/RTNeural"
  "git+https://github.com/Chowdhury-DSP/math_approx"
)
sha256sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP)

pkgver() {
  cd ${_upstream_name}
  ver=$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
  echo "'$ver'"
}

prepare() {
  cd "${srcdir}/${_upstream_name}"

  git submodule init
  submodules=(dr_libs r8brain-free-src WDL NeuralAudio)
  for m in "${submodules[@]}"; do
    git config "submodule.Dependencies/${m}.url" "${srcdir}/${m}"
  done
  git -c protocol.file.allow=always submodule update

  cd "${srcdir}/${_upstream_name}/Dependencies/NeuralAudio"
  git submodule init
  submodules=(NeuralAmpModelerCore RTNeural math_approx)
  for m in "${submodules[@]}"; do
    git config "submodule.deps/${m}.url" "${srcdir}/${m}"
  done
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${_upstream_name}/build/"
  cmake .. -DCMAKE_BUILD_TYPE='Release'
  cmake --build stompbox-jack/
}

package() {
  cd "${srcdir}/${_upstream_name}/build/"
  install -D -m 755 stompbox-jack/stompbox-jack -t "${pkgdir}/usr/bin/"

  cd "${srcdir}/${_upstream_name}/"
  pwd
  ls -1
  install -D -m 644 CREDITS.md README.md -t "${pkgdir}/usr/share/docs/${_comp_name}/"
}
