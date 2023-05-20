# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=binaryen-git
pkgver=113.r9.g97178d08d
pkgrel=1
pkgdesc="Compiler infrastructure and toolchain library for WebAssembly"
arch=('i686' 'x86_64')
url="https://github.com/WebAssembly/binaryen"
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'cmake')
#checkdepends=('python')
provides=("binaryen=$pkgver")
conflicts=('binaryen')
source=("git+https://github.com/WebAssembly/binaryen.git"
        "binaryen.sh::https://gitlab.archlinux.org/archlinux/packaging/packages/binaryen/-/raw/main/binaryen.sh")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "binaryen"

  _tag=$(git tag -l --sort -v:refname | grep -E '^version_[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^version_//'
}

build() {
  cd "binaryen"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "binaryen/_build"

  #python ../check.py
}

package() {
  cd "binaryen"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/binaryen.sh" -t "$pkgdir/etc/profile.d"
}
