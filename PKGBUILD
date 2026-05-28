# Maintainer: uwuclxdy <uwuclxdy@pm.me>

pkgname=katdown-git
_pkgbase=katdown
pkgver=r3.f4f7b4c
pkgrel=2
pkgdesc="GitHub-styled live Markdown preview for Kate (KTextEditor/KF6)"
arch=('x86_64')
url="https://github.com/uwuclxdy/katdown"
license=('GPL-3.0-or-later')
depends=('ktexteditor' 'syntax-highlighting' 'kxmlgui' 'kconfig' 'ki18n' 'kcoreaddons' 'qt6-base' 'qt6-webengine')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=('katdown')
conflicts=('katdown')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  if desc=$(git describe --long --tags 2>/dev/null); then
    printf '%s' "$desc" | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
  else
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/$_pkgbase"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/$_pkgbase"
  DESTDIR="$pkgdir" cmake --install build
}
