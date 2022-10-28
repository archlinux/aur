# Maintainer: George Raven <GeorgeRavenCommunity PLUS fdtviewer AT pm DOT me>

pkgname=fdt-viewer-git
_branch="HEAD"
pkgdesc="Flattened device tree viewer written in Qt"
pkgver=r100.6aaa362
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/dev-0x7C6/fdt-viewer"
license=('GPL-3.0-or-later')
depends=('qt6-base')
makedepends=('git' 'make' 'cmake')
conflicts=('fdt-viewer')
provides=('fdt-viewer')
source=("${pkgname}::git+${url}#branch=${_branch}")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make -j ${nproc}
}

check() {
  cd "${srcdir}/${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir/" install
}
