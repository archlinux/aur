# Maintainer: Alfredo Ramos <alfredo.ramos@proton.me>
# Contributor: Alison Watson <marrub@greyserv.net>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Corey Richardson <corey@octayn.net>

_pkgname="krita"
pkgname="$_pkgname-qt6-git"
pkgver=6.0.0.prealpha.r598.g79b3845
pkgrel=1
pkgdesc="Edit and paint images"
url='https://invent.kde.org/graphics/krita'
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'exiv2'
  'fftw'
  'fontconfig'
  'freetype2'
  'fribidi'
  'gcc-libs'
  'giflib'
  'glibc'
  'gsl'
  'harfbuzz'
  'imath'
  'kcolorscheme'
  'kcompletion'
  'kconfig'
  'kcoreaddons'
  'kguiaddons'
  'ki18n'
  'kitemmodels'
  'kitemviews'
  'kwidgetsaddons'
  'kwindowsystem'
  'lcms2'
  'libjpeg-turbo'
  'libkdcraw'
  'libpng'
  'libtiff'
  'libunibreak'
  'libwebp'
  'mlt'
  'opencolorio'
  'openexr'
  'openjpeg2'
  'qt6-base'
  'qt6-svg'
  'quazip-qt6'
  'sdl2'
  'zlib'
)
makedepends=(
  'boost'
  'eigen'
  'extra-cmake-modules'
  'git'
  'immer'
  'kdoctools'
  'kseexpr-qt6' # aur/kseexpr-qt6-git
  'lager'
  'libheif'
  'libjxl'
  'libmypaint'
  'ninja'
  'poppler-qt6'
  'python-pyqt6'
  'qt6-tools'
  'sip'
  'vulkan-headers'
  'xsimd'
  'zug'
)
optdepends=(
  'kimageformats: PSD support'
  'krita-plugin-gmic: GMic plugin'
  'kseexpr-qt6: SeExpr generator layer'
  'libheif: HEIF filter'
  'libjxl: JPEG-XL filter'
  'libmypaint: support for MyPaint brushes'
  'poppler-qt6: PDF filter'
  'python-legacy-cgi: for the Python plugins'
  'python-pyqt6: for the Python plugins'
)

provides=("$_pkgname=${pkgver%.g*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _file _hash _ver _rev _commit
  _file="CMakeLists.txt"
  read -r _hash _ver < <(
    NL=$(awk '/set.*KRITA_VERSION_STRING.*"[6789]/{n=NR}END{print n}' "$_file")

    git blame -L "$NL,+1" -- "$_file" \
      | awk '{print $1" "$NF }' \
      | sed -E -e 's&-&.&g;s&[^0-9\.a-z\ ]&&g'
  )
  _rev=$(git rev-list --count --cherry-pick "$_hash"...HEAD)
  _commit=$(git rev-parse --short=7 HEAD)

  printf "%s.r%s.g%s" "${_ver:?}" "${_rev:?}" "${_commit:?}"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DBUILD_WITH_QT6=ON
    -DBUILD_TESTING=$CHECKFUNC
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
