# Maintainer:
# Contributor: André Kugland <kugland@gmail.com>

# options
: ${_pocketsphinx:=false}

: ${_pkgtype:=nopocketsphinx-git}

# basic info
_pkgname="subtitlecomposer"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=0.8.0.r10.g8dee193a
pkgrel=1
pkgdesc="Video subtitle editor"
url="https://invent.kde.org/multimedia/subtitlecomposer"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'ffmpeg'
  'kcodecs5'
  'kcoreaddons5'
  'ki18n5'
  'kio5'
  'ktextwidgets5'
  'kxmlgui5'
  'openal'
  'qt5-declarative'
  'sonnet5'
)
makedepends=(
  'blas'
  'extra-cmake-modules'
  'jack'
  'xorg-server-xvfb'
)
optdepends=(
  'ruby: scripting'
  'python: scripting'
)

if [[ "${_pocketsphinx::1}" == "t" ]] ; then
  makedepends+=('pocketsphinx')
  optdepends+=('pocketsphinx: speech recognition')
fi

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git" )
sha256sums=('SKIP')

prepare() {
  if [[ "${_pocketsphinx::1}" != "t" ]] ; then
    sed -Ei '/^add_subdirectory(speechplugins\/pocketsphinx)/d' "$_pkgsrc/src/CMakeLists.txt"
  fi
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  export DISPLAY=:99
  Xvfb :99 >& /dev/null &
  trap "kill $! || true" EXIT
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
