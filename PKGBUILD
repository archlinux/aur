# Maintainer: imnotpolar
# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>
# Contributor: éclairevoyant
# Contributor: ThatOneCalculator <kainoa at t1c dot dev>

_pkgname="hyprpicker"
pkgname="$_pkgname-git"
pkgver=0.4.7.r8.gd7d3b5d
pkgrel=1
pkgdesc="A wlroots-compatible Wayland color picker that does not suck"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprwm/hyprpicker"
license=('BSD-3-Clause')

depends=(
  cairo
  glibc
  hyprutils-git
  libgcc
  libstdc++
  libxkbcommon
  wayland
)
makedepends=(
	cmake
	git
	hyprutils-git
	hyprwayland-scanner-git
	libgl
	libjpeg-turbo
	meson
	ninja
	pango
	wayland-protocols
	xorgproto
)
optdepends=(
  'wl-clipboard: --autocopy'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc=$_pkgname
source=("$_pkgsrc::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _tag=$(git tag -l --contains $(git describe --tags --abbrev=0) --sort=-v:refname | head -n1 | sed 's/^v//')
  printf "%s.r%s.g%s" "$_tag" $(git rev-list --count --cherry-pick "v${_tag}...HEAD") $(git rev-parse --short=7 HEAD)
}

build() {
  local cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
