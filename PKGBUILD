# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=liblouis-git
pkgver=3.24.0.r3.g2ce32bd0
pkgrel=1
pkgdesc="An open-source braille translator, back-translator and formatter"
arch=('i686' 'x86_64')
url="http://liblouis.org/"
license=('LGPL')
depends=('glibc')
makedepends=('git' 'help2man' 'perl' 'python-build' 'python-installer' 'python-wheel')
provides=("liblouis=$pkgver")
conflicts=('liblouis')
options=('staticlibs')
source=("git+https://github.com/liblouis/liblouis.git")
sha256sums=('SKIP')


pkgver() {
  cd "liblouis"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "liblouis"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-ucs4
  make

  cd "python"
  python \
    -m build \
    --wheel \
    --no-isolation
}

check() {
  cd "liblouis"

  make check
}

package() {
  cd "liblouis"

  make DESTDIR="$pkgdir" install

  cd "python"
  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl
}
