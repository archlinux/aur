# Maintainer:

_pkgname="wsjtx"
pkgname="$_pkgname"
pkgver=2.7.0
pkgrel=3
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
url="https://sourceforge.net/projects/wsjt/"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64' 'aarch64')

depends=(
  'fftw'
  'hamlib'
  'libboost_filesystem.so'
  'libboost_log.so'
  'libboost_log_setup.so'
  'libboost_thread.so'
  'libusb'
  'qt5-base'
  'qt5-multimedia'
  'qt5-serialport'
)
makedepends=(
  'asciidoc'    # manpages
  'asciidoctor' # other docs
  'boost'
  'cmake'
  'gcc-fortran'
  'ninja'
  'qt5-tools'
)

options=('!lto')

_pkgsrc="$_pkgname-$pkgver"
source=("$_pkgsrc.tar.gz"::"http://downloads.sourceforge.net/sourceforge/wsjt/$_pkgsrc.tgz")
sha256sums=('3788f5df636af792514609ec2b4abe58477aa5f0ad32cb826424866fc21cec93')

prepare() {
  for i in "$_pkgsrc/src"/*.{tgz,tar.gz}; do
    [ -f "$i" ] && bsdtar -xf "$i"
  done
}

build() {
  local _cmake_options=(
    -B build
    -S wsjtx
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
