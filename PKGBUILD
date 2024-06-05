# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=canu-git
pkgver=2.2.r162.gc61ebbb7a
pkgrel=1
pkgdesc="A fork of the Celera Assembler designed for high-noise single-molecule sequencing"
arch=('i686' 'x86_64')
url="https://canu.readthedocs.io/"
license=('custom')
depends=('glibc' 'java-runtime' 'perl')
makedepends=('git')
optdepends=('gnuplot')
provides=("canu=$pkgver")
conflicts=('canu')
options=('staticlibs')
source=("git+https://github.com/marbl/canu.git")
sha256sums=('SKIP')


prepare() {
  cd "canu"

  git submodule update --init --recursive
}

pkgver() {
  cd "canu"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "canu"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  make -C "src"
}

package() {
  cd "canu"

  install -Dm755 "build/bin"/* -t "$pkgdir/usr/bin"
  install -Dm644 "build/lib/site_perl/canu"/*.pm -t "$pkgdir/usr/lib/site_perl/canu"
  install -Dm644 "build/share/java/classes"/*.jar -t "$pkgdir/usr/share/java/classes"
  install -Dm644 "build/lib"/*.a -t "$pkgdir/usr/lib"

  install -Dm644 "README.licenses" -t "$pkgdir/usr/share/licenses/canu"
}
