# Maintainer:
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Alexey D. <lq07829icatm at rambler.ru>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname="ark"
pkgname="$_pkgname-git"
pkgver=24.02.1.r99.g531f976
pkgrel=1
pkgdesc='Archiving Tool'
url="https://invent.kde.org/utilities/ark"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  kconfig
  kcrash
  kdbusaddons
  kfilemetadata
  ki18n
  kio
  kparts
  kpty
  libarchive

  ## implicit
  #bash
  #hicolor-icon-theme
  #kcolorscheme
  #kcompletion
  #kconfigwidgets
  #kcoreaddons
  #kjobwidgets
  #kservice
  #kwidgetsaddons
  #kwindowsystem
  #kxmlgui
  #libzip
  #qt6-base
  #zlib
)
makedepends=(
  extra-cmake-modules
  git
  kdoctools
  ninja
)
optdepends=(
  'arj: ARJ format support'
  'lrzip: LRZ format support'
  'lzop: LZO format support'
  'p7zip: 7Z format support'
  'unarchiver: RAR format support'
  'unrar: RAR decompression support'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  local _tag=$(git tag | grep -Ev '\.[0-9][0-9]$' | sort -rV | head -1)
  local _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_tag#v}" "$_revision" "$_hash"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
