# Maintainer: Kristopher James Kent <kris@kjkent.dev>
pkgname='imsprog'
_pkgname='IMSProg'
depends=('libusb>=1.0.20' 'qt5-base' 'wget' 'zenity')
makedepends=('cmake>=3.10.0', 'qt5-tools')
url="https://github.com/bigbigmdm/$pkgname"
pkgver='1.8.2'
pkgrel='1'
arch=('x86_64')
license=('GPL-3.0-only')
pkgdesc='I2C, SPI and MicroWire EEPROM/flash chip programmer for CH341a devices.'
source=("$url/archive/refs/tags/v$pkgver.tar.gz")

# Used in lieu of upstream hash
# curl -L https://github.com/bigbigmdm/IMSProg/archive/refs/tags/v$pkgver.tar.gz | b2sum | cut -d ' ' -f 1
b2sums=('c21698a618a6ebeba28cbc0b4b1495b03a8d070e895d55d358e89a6b0f01eeec71cc7b885d731316d132a759ce850126faa5217260a88460c6a7940bccd0a142')

_srcprefix="$_pkgname-$pkgver/$_pkgname"
_srcdirs=("${_srcprefix}_editor" "${_srcprefix}_programmer")

build() {
  local srcdir

  # Sane defaults for Arch package guidelines. Commented if unused by project.
  # https://wiki.archlinux.org/title/CMake_package_guidelines
  local cmakeopts=(
    -Wno-dev
    -D 'CMAKE_BUILD_TYPE=None'
    #-D 'CMAKE_INSTALL_LIBDIR=lib'
    #-D "CMAKE_INSTALL_LIBEXECDIR=lib/$pkgname"
    -D 'CMAKE_INSTALL_PREFIX=/usr'
    -D 'CMAKE_SKIP_INSTALL_RPATH=YES'
    -D 'CMAKE_SKIP_RPATH=YES'
    #-D 'FETCHCONTENT_FULLY_DISCONNECTED=ON'
  )

  for srcdir in "${_srcdirs[@]}"; do
    local bindir="$srcdir/build"

    cmake "${cmakeopts[@]}" -S "$srcdir" -B "$bindir"
    cmake --build "$bindir" --parallel
  done
}

package() {
  local bindir

  for bindir in "${_srcdirs[@]/%//build}"; do
    DESTDIR="$pkgdir" cmake --install "$bindir"
  done
}
