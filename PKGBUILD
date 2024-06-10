# Maintainer:
# Contributor: Giuseppe Calà <gcala at mailbox dot org>

_pkgname="audiotube"
pkgname="$_pkgname-git"
pkgver=24.05.0.r26.gd9b1902
pkgrel=1
pkgdesc="Client for YouTube Music"
url="https://invent.kde.org/multimedia/audiotube"
license=(
  'GPL-2.0-or-later'
  'LGPL-2.0-or-later'
)
arch=('x86_64' 'aarch64')

depends=(
  futuresql
  kcoreaddons
  kcrash
  ki18n
  kirigami-addons
  kwindowsystem
  purpose
  python
  python-ytmusicapi
  qt6-base
  qt6-declarative
  qt6-imageformats
  qt6-multimedia
  qt6-multimedia-gstreamer
  qt6-svg
  yt-dlp
)
makedepends=(
  extra-cmake-modules
  pybind11
  qcoro-qt6
  ninja
  git
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _tag=$(git tag | sort -rV | head -1)
  local _version="${_tag#v}"
  local _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DQT_MAJOR_VERSION=6
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
