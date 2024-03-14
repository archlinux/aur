# Maintainer:
# Contributor: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="hyprpaper"
pkgname="$_pkgname-git"
pkgver=0.6.0.r11.gf57d991
pkgrel=1
pkgdesc="a blazing fast wayland wallpaper utility with IPC controls"
url="https://github.com/hyprwm/hyprpaper"
license=('BSD-3-Clause')
arch=('x86_64')

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
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
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
  # DESTDIR="$pkgdir" cmake --install build
  install -Dm0755 "build/$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm0644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
