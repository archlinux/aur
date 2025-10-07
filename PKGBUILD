# Maintainer:
# Contributor: Daniel Mensinger daniel@mensinger-ka.de

_pkgname="libopenglrecorder"
pkgname="$_pkgname-git"
pkgver=0.1.0.r13.gc1b81ce
pkgrel=1
pkgdesc="A library allowing optional async readback OpenGL frame buffer with optional audio recording"
url="https://github.com/Benau/libopenglrecorder"
license=('BSD-3-Clause')
arch=('x86_64' 'i686')

depends=(
  'libjpeg-turbo'
  'libpulse'
  'libvpx'
  'openh264'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DBUILD_WITH_VPX=ON
    -DBUILD_WITH_H264=ON
    -DBUILD_RECORDER_WITH_SOUND=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
