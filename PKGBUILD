# Maintainer:
# Contributor: Dennis Hamester <dennis.hamester@startmail.com>

_pkgname="scraw"
pkgname="$_pkgname"
pkgver=0.2.1
pkgrel=3
pkgdesc="Steam Controller C library"
url="https://gitlab.com/dennis-hamester/scraw"
license=('ISC')
arch=('i686' 'x86_64')

depends=(
  'libusb'
)
makedepends=(
  'cmake'
  'doxygen'
  'ninja'
)

_pkgsrc="$_pkgname-v$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/-/archive/v$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('6b0afd0417577aad482a010b3f2754790b1e2cce59d14711dac3a0dd25afc39c')

prepare() {
  cd "$_pkgsrc"
  doxygen -u "doc/Doxyfile.in"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DBUILD_SCRAW_INFO=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
