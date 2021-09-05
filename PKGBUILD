# Maintainer: Teteros <teteros at teknik dot io>

pkgname=airwindows-git
pkgver=r225.a4343495
pkgrel=1
pkgdesc="Airwindows plugins are modular, graphic-less, stripped-down, VST plugins for Mac and PC"
arch=(x86_64)
url="https://www.airwindows.com/"
license=(MIT)
groups=(vst-plugins pro-audio)
makedepends=(git cmake steinberg-vst36)
provides=("${pkgname%-*}")
source=("git+https://github.com/${pkgname%-*}/${pkgname%-*}.git"
        "https://raw.githubusercontent.com/magnetophon/airwindows/master/plugins/LinuxVST/include/vstsdk/CMakeLists.txt")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-*}/plugins/LinuxVST"
  # Fix cmake build, see:
  # https://github.com/airwindows/airwindows/pull/5
  rm -f build/CMakeCache.txt
  mkdir -p include/vstsdk build
  cp "${srcdir}/CMakeLists.txt" include/vstsdk/CMakeLists.txt
}

build() {
  cd "${pkgname%-*}/plugins/LinuxVST/build"
  cmake -DVSTSDK_ROOT=/usr/include/vst36 -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-O3 -ffast-math" ..
  make || return 1
}

package() {
  cd "${pkgname%-*}/plugins/LinuxVST/build"
  mkdir -p "${pkgdir}/usr/lib/vst/${pkgname%-*}"
  cp ./*.so "${pkgdir}/usr/lib/vst/${pkgname%-*}"
}
