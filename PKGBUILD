# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=chafa-git
pkgver=1.14.0.r29.g5e9a6ea
pkgrel=1
pkgdesc="Terminal graphics for the 21st century"
arch=('i686' 'x86_64')
url="https://hpjansson.org/chafa/"
license=('LGPL-3.0-or-later')
depends=('glibc' 'freetype2' 'libavif' 'libjpeg' 'libjxl' 'librsvg' 'libtiff' 'libwebp')
makedepends=('git' 'gtk-doc')
provides=("chafa=$pkgver" 'libchafa.so')
conflicts=('chafa')
options=('staticlibs')
source=("git+https://github.com/hpjansson/chafa.git")
sha256sums=('SKIP')


pkgver() {
  cd "chafa"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "chafa"

  NOCONFIGURE=1 ./autogen.sh
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "chafa"

  #make check
}

package() {
  cd "chafa"

  make DESTDIR="$pkgdir" install
  make -C "tools/completions" PREFIX="$pkgdir/usr/share" install-zsh-completion
}
