# Maintainer: fuero <fuerob@gmail.com> 
_pkgname=bonk
pkgname="${_pkgname}-git"
# renovate: pkgName=https://github.com/FascinatedBox/bonk depName=bonk
pkgver=r34.7f13460
pkgrel=1
pkgdesc="command-line tool that provides subcommands to modify windows, adjust window properties, change window decorations, and more."
license=('GPL-2.0-only')
arch=('x86_64')
url="https://github.com/FascinatedBox/bonk"
source=(
  "${_pkgname}.git::git+${url}"
)
depends=('libxcb' 'xcb-util-wm')
makedepends=('cmake' 'make' 'git' 'libx11')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}.git"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  cmake -B build -S "${_pkgname}.git" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr 
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
