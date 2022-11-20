# Maintainer: Giuseppe Calà <gcala at mailbox dot org>

pkgname=libdeltachat-git
_srcname=deltachat-core-rust
pkgver=1.101.0.r6.g960a7f82
pkgrel=1
pkgdesc="Deltachat-core written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/deltachat/deltachat-core-rust/"
license=('Mozilla Public License, v. 2.0')
depends=('sqlcipher')
makedepends=('rust' 'git')
provides=('libdeltachat')
conflicts=('libdeltachat')
source=(
    "$_srcname::git+https://github.com/deltachat/deltachat-core-rust.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "${_srcname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/^py.//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_srcname"
  cmake -B build . -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/$_srcname"
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
