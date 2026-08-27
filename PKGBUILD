# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>

_pkgname="hyprpolkitagent"
pkgname="$_pkgname-git"
pkgver=0.1.3.r12.g7d8031c
pkgrel=1
pkgdesc="A polkit authentication agent written in QT/QML"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprwm/hyprpolkitagent"
license=('BSD-3-Clause')

depends=(
  hyprtoolkit-git
  hyprutils-git
)
makedepends=(
  cmake
  git
  ninja
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
	-D CMAKE_INSTALL_LIBEXECDIR=lib
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
