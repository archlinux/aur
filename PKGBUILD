# Maintainer:
# Contributor: ThatOneCalculator <kainoa@t1c.dev>

# options
_pkgtype+='-git'

# basic info
_pkgname="hyprpaper"
pkgname="$_pkgname${_pkgtype}"
pkgver=0.6.0.r3.g43b6e9d
pkgrel=1
pkgdesc="a blazing fast wayland wallpaper utility with IPC controls"
url="https://github.com/hyprwm/hyprpaper"
license=('BSD')
arch=(x86_64)

depends=(
  hyprlang
  libglvnd
  libjpeg.so
  libwebp.so
  pango
  wayland
  wlroots
)
makedepends=(
  cmake
  git
  ninja
  wayland-protocols
  xorgproto
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  make -C "$_pkgsrc" protocols
  cmake --build build
}

package() {
  cd "$_archive"
  # DESTDIR="$pkgdir" cmake --install build
  install -Dm0755 "build/$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm0644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
