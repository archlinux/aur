# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=apk-tools-git
pkgver=2.12.10.r248.gff7c8f6
pkgrel=1
pkgdesc="Alpine package manager"
arch=('i686' 'x86_64')
url="https://gitlab.alpinelinux.org/alpine/apk-tools"
license=('GPL2')
depends=('glibc' 'openssl' 'zlib')
makedepends=('git' 'meson' 'scdoc' 'lua53' 'lua53-zlib')
provides=("apk-tools=$pkgver")
conflicts=('apk-tools')
options=('staticlibs')
source=("git+https://gitlab.alpinelinux.org/alpine/apk-tools.git")
sha256sums=('SKIP')

pkgver() {
  cd "apk-tools"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "apk-tools"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "apk-tools"

  meson test -C "_build"
}

package() {
  cd "apk-tools"

  meson install -C "_build" --destdir "$pkgdir"
}
