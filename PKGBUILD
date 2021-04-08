# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Maintainer emeritus: R. van Elst <https://raymii.org>

pkgname="simh-git"
pkgver=4.0.Beta.1.2676.gfc5bda90
pkgrel=1
pkgdesc="The Computer History Simulation Project"
arch=('i686' 'x86_64')
url="http://simh.trailing-edge.com/"
license=('MIT')
depends=('libpcap' 'unzip' 'sdl2' 'ttf-dejavu' 'zlib' 'libpng')
makedepends=('unoconv')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/simh/simh.git')
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

build() {
  cd "${pkgname%-*}"
  { test "$(nproc)" -gt 1 && make -j"$(nproc)" ;} || make
}

package() {
  echo "Entering directory $srcdir/simh/BIN."
  install -d "$pkgdir/usr/bin"
  cd "$srcdir/simh/BIN"
  for i in *; do
    { test -d "$i" && echo "Skipping directory $i." ;} || install "$i" "$pkgdir/usr/bin/simh-$i"
  done
  cd "$srcdir/simh/BIN/buildtools"
  echo "Entering directory $srcdir/simh/BIN/buildtools."
  for i in *; do
    { test -d "$i" && echo "Skipping directory $i." ;} || install "$i" "$pkgdir/usr/bin/simh-$i"
  done

  for dir in VAX swtp6800/swtp6800 3B2; do
    echo "Entering directory $srcdir/simh/$dir."
    cd "$srcdir/simh/$dir"
    find . -type f -name "*.bin" -exec install -D -t "$pkgdir/usr/lib/$pkgname" {} \;
    find . -type f -name "*.exe" -exec install -D -t "$pkgdir/usr/lib/$pkgname" {} \;
  done

  echo "Entering directory $srcdir/simh/doc."
  cd "$srcdir/simh/doc"
  unoconv -d document --format=html *.doc
  unoconv -d document --format=txt *.doc
  # install -D -t "$pkgdir/usr/share/doc/$pkgname" *.doc
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.html
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.pdf
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.txt

  echo "Entering directory $srcdir/simh."
  cd "$srcdir/simh"
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.md
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.txt
}
