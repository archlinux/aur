# Maintainer:
# Contributor: AI5C <ai5c@ai5c.com>

_pkgname="wsjtx"
pkgname="$_pkgname-beta"
pkgver=3.0.0rc1
pkgrel=1
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
  'qt5-websockets' # AUR
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

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname-${pkgver/r/-r}"
source=("$_pkgsrc.tar.gz"::"http://downloads.sourceforge.net/sourceforge/wsjt/$_pkgsrc.tgz")
sha256sums=('faeaf3c1146ae4e5a68502823d4b080d41d221d8ab19e1d1c374e2f7749bfe96')

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
    -DCMAKE_INSTALL_BINDIR="lib/$_pkgname"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  mkdir -pm755 "$pkgdir/usr/bin"
  ln -sf "/usr/lib/$_pkgname/wsjtx" "$pkgdir/usr/bin/wsjtx"
}
