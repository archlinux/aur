# Maintainer:
# Contributor: Daniel Mensinger daniel@mensinger-ka.de

#: ${_commit=15b1958a073b89cdd01b2532152c6be5f0b93c13} # 0.1.0
: ${_commit=c1b81ce26e62fae1aaa086b5cd337cb12361ea3d} # 0.1.0.r13

_pkgname="libopenglrecorder"
pkgname="$_pkgname"
pkgver=0.1.0
pkgrel=2
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

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}")
sha256sums=('SKIP')

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
