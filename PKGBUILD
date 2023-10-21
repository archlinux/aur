# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=patchelf-git
pkgver=0.18.0.r12.g917ea45
pkgrel=2
pkgdesc="A small utility to modify the dynamic linker and RPATH of ELF executables"
arch=('i686' 'x86_64')
url="https://github.com/NixOS/patchelf"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git')
provides=("patchelf=$pkgver")
conflicts=('patchelf')
source=("git+https://github.com/NixOS/patchelf.git")
sha256sums=('SKIP')


pkgver() {
  cd "patchelf"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "patchelf"

  ./bootstrap.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "patchelf"

  make check
}

package() {
  cd "patchelf"

  make DESTDIR="$pkgdir" install
}
