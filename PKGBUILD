# Maintainer:

# options
: ${_pocketsphinx:=false}

: ${_pkgtype:=-qt6}

# basic info
_pkgname="subtitlecomposer"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.8.0
pkgrel=1
pkgdesc="Video subtitle editor"
url="https://invent.kde.org/multimedia/subtitlecomposer"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'ffmpeg'
  'kcodecs'
  'kcompletion'
  'kconfig'
  'kconfigwidgets'
  'kcoreaddons'
  'ki18n'
  'kio'
  'ktextwidgets'
  'kwidgetsaddons'
  'kxmlgui'
  'libicui18n.so' # icu
  'openal'
  'openssl'
  'qt6-5compat'
  'qt6-base'
  'qt6-declarative'
  'sonnet'
)
makedepends=(
  'blas'
  'extra-cmake-modules'
  'git'
  'jack'
)
_checkdepends=(
  'xorg-server-xvfb'
)
optdepends=(
  'ruby: scripting'
  'python: scripting'
)

if [[ "${_pocketsphinx::1}" == "t" ]]; then
  makedepends+=('pocketsphinx')
  optdepends+=('pocketsphinx: speech recognition')
fi

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

_backport() (
  cd "$_pkgsrc"
  local _c
  for _c in "${_backports[@]}"; do
    git cherry-pick -n -m1 "${_c}"
  done
)

prepare() {
  _backports=(
    f8280dbcc0b23aed2e55d8db39c220ad900e7825
  )

  _backport

  if [[ "${_pocketsphinx::1}" != "t" ]]; then
    sed -Ei '/^add_subdirectory(speechplugins\/pocketsphinx)/d' "$_pkgsrc/src/CMakeLists.txt"
  fi
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DQT_MAJOR_VERSION=6
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

_check() {
  export DISPLAY=:99
  Xvfb :99 >&/dev/null &
  trap "kill $! || true" EXIT
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
