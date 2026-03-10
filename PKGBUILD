# Maintainer:
# Contributor: Rustmilian Rustmilian@proton.me

_pkgname="calamares"
pkgname="$_pkgname"
pkgver=3.4.2
pkgrel=1
pkgdesc="Distribution-independent installer framework"
url="https://codeberg.org/Calamares/calamares"
license=("GPL-3.0-or-later")
arch=('i686' 'x86_64')

depends=(
  'kcoreaddons'
  'kpmcore'
  'libpwquality'
  'qt6-declarative'
  'qt6-svg'
  'yaml-cpp'
)
makedepends=(
  'extra-cmake-modules'
  'libglvnd'
  'ninja'
  'qt6-tools'
  'qt6-translations'
)

_pkgsrc="$_pkgname"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('7b8d0ee09645ad9d625baaebe0ba9ffd5baedbe92153347fd4d0a003a2d7639c')

build() {
  local _skip_modules=(
    dracut
    dracutlukscfg
    dummycpp
    dummyprocess
    dummypython
    dummypythonqt
    initramfs
    initramfscfg
    interactiveterminal
    packagechooser
    packagechooserq
    services-openrc
  )

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DWITH_QT6=ON
    -DINSTALL_CONFIG=ON
    -DSKIP_MODULES="${_skip_modules[*]}"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
