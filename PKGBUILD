# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>

_pkgname="hyprpm"
pkgname="$_pkgname-git"
pkgver=0.56.2.r164.g1b85c7a
pkgrel=1
pkgdesc="Plugin manager for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/hyprwm/Hyprland"
license=('BSD-3-Clause')

depends=(
  cmake
	cpio
	glaze
	hyprland-git
	hyprland-protocols-git
	hyprwayland-scanner-git
	meson
)
makedepends=(
  git
  xorgproto
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
  cmake --build build --target hyprpm
}

package() {
  install -Dm755 "$srcdir/build/hyprpm/hyprpm" "$pkgdir/usr/bin/hyprpm"

  install -Dm644 "$_pkgsrc/hyprpm/hyprpm.bash" "$pkgdir/usr/share/bash-completion/completions/hyprpm"
  install -Dm644 "$_pkgsrc/hyprpm/hyprpm.fish" "$pkgdir/usr/share/fish/vendor_completions.d/hyprpm.fish"
  install -Dm644 "$_pkgsrc/hyprpm/hyprpm.zsh"  "$pkgdir/usr/share/zsh/site-functions/_hyprpm"

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

