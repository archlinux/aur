# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hse-git
pkgver=3.1.0.dev.r9.g2161da28
pkgrel=1
pkgdesc="Heterogeneous-memory storage engine"
arch=('i686' 'x86_64')
url="https://hse-project.github.io/"
license=('apache')
depends=('glibc' 'cjson' 'curl' 'libbsd' 'libmicrohttpd' 'liburcu' 'libyaml' 'lz4' 'mongo-c-driver' 'pmdk' 'xxhash')
makedepends=('git' 'cmake' 'meson')
provides=("hse=$pkgver")
conflicts=('hse')
options=('staticlibs')
source=("git+https://github.com/hse-project/hse.git")
sha256sums=('SKIP')


pkgver() {
  cd "hse"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^r//;s/-/./'
}

build() {
  cd "hse"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    -Dforce_fallback_for="" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "hse"

  #meson test -C "_build"
}

package() {
  cd "hse"

  meson install -C "_build" --destdir "$pkgdir"
}
