# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname="wsjtx"
pkgver=3.0.2
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
url="https://sourceforge.net/projects/wsjt/"
license=('GPL-3.0-only')
arch=('i686' 'x86_64' 'aarch64')

depends=(
  'fftw'
  'glibc'
  'hamlib'
  'libboost_filesystem.so'
  'libboost_log_setup.so'
  'libboost_log.so'
  'libboost_thread.so'
  'libgcc'
  'libgfortran'
  'libgomp'
  'libstdc++'
  'libusb'
  'portaudio'
  'qt5-base'
  'qt5-multimedia'
  'qt5-serialport'
  'qt5-websockets'
  'readline'
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

_pkgsrc="$pkgname-$pkgver"
source=("$_pkgsrc.tar.gz"::"https://github.com/WSJTX/wsjtx/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/df7cb/wsjtx/commit/1f9518389ef66b961f4c41ed4f105e70ee99f4a2.patch")
sha256sums=('8483a851bcb6455f5787de87b89efdf90e928842debde036e287e93e7f3837bd'
            '3f2680d694d09e2b5a517ccbfa561104804eaed6e884e3e9664b1c3c205be257')

prepare() {
  cd ${_pkgsrc}
  patch -p1 < "$srcdir"/1f9518389ef66b961f4c41ed4f105e70ee99f4a2.patch
}

build() {
  local _cmake_options=(
    -B build
    -S ${_pkgsrc}
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DCMAKE_CXX_FLAGS='-Wno-error=maybe-uninitialized'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
