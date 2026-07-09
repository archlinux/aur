# Maintainer: Misaka 19465 <19465@misakanet.team>

_pkgname=fcitx5-virtualkeyboard-ui
pkgname=$_pkgname-git
pkgver=5.0.0.r38.gd451680
pkgrel=2
pkgdesc='Wayland virtual keyboard UI module for Fcitx5'
arch=('x86_64')
url='https://github.com/clear-code/fcitx5-virtualkeyboard-ui'
license=('LGPL-2.1-or-later')
depends=(
  'cairo'
  'fcitx5>=5.0.14'
  'gdk-pixbuf2'
  'glib2'
  'pango'
  'wayland'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'fmt'
  'git'
  'ninja'
  'wayland-protocols'
)
optdepends=(
  'fcitx5-anthy: Japanese virtual keyboard support'
  'fcitx5-chewing: Traditional Chinese virtual keyboard support'
  'fcitx5-chinese-addons: Simplified Chinese virtual keyboard support'
  'fcitx5-hangul: Korean virtual keyboard support'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "git+$url.git"
  'fix-virtualkeyevent.patch'
)
sha256sums=('SKIP'
            'a3ebeedfc5073ea7c353848458da4934023bac6f0563b072d1408a1eb2068feb')

pkgver() {
  cd "$_pkgname"

  local _version
  _version=$(sed -n 's/^project(.* VERSION \([0-9.]*\)).*/\1/p' CMakeLists.txt)
  printf '%s.r%s.g%s' "$_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"

  patch -Np1 -i "$srcdir/fix-virtualkeyevent.patch"
}

build() {
  cd "$_pkgname"

  local _wayland_protocols_dir
  _wayland_protocols_dir=$(pkg-config --variable=pkgdatadir wayland-protocols)
  export CFLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=."
  export CXXFLAGS="${CXXFLAGS} -fno-char8_t -ffile-prefix-map=${srcdir}=."

  rm -rf build

  cmake -B build -S . -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_WAYLAND=ON \
    -DENABLE_X11=OFF \
    -DINSTALL_THEME=OFF \
    -DWAYLAND_PROTOCOLS_PKGDATADIR="$_wayland_protocols_dir" \
    -Wno-dev
  cmake --build build
}

package() {
  cd "$_pkgname"

  DESTDIR="$pkgdir" cmake --install build
}
