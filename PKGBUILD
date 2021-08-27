# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=canu-git
pkgver=r10451.g6c4193847
pkgrel=1
pkgdesc="A fork of the Celera Assembler designed for high-noise single-molecule sequencing"
arch=('i686' 'x86_64')
url="https://canu.readthedocs.io/"
license=('custom')
depends=('glibc' 'java-runtime' 'perl')
makedepends=('git')
optdepends=('gnuplot')
provides=('canu')
conflicts=('canu')
options=('staticlibs')
source=("git+https://github.com/marbl/canu.git")
sha256sums=('SKIP')


prepare() {
  cd "canu"

  git submodule update --init --recursive --remote
}

pkgver() {
  cd "canu"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "canu"

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
