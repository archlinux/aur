# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname="opensimh-git"
_pkgname="simh"
pkgver=open.simh.baseline.295.gc077c22d
pkgrel=1
pkgdesc="The Computer History Simulation Project"
arch=('i686' 'x86_64')
url="https://opensimh.org"
license=('custom:opensimh')
depends=('libpcap' 'unzip' 'sdl2' 'ttf-dejavu' 'zlib' 'libpng')
makedepends=('git' 'termcap' 'unoconv')
provides=("${_pkgname%-*}")
conflicts=("${_pkgname%-*}")
source=('git+https://github.com/open-simh/simh.git')
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname%-*}"
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

build() {
  cd "${_pkgname%-*}"
  { test "$(nproc)" -gt 1 && make -j"$(nproc)" ;} || make
}

package() {
  echo "Entering directory $srcdir/${_pkgname%-*}/BIN."
  cd "${_pkgname%-*}"
  install -d "$pkgdir/usr/bin"
  cd "$srcdir/${_pkgname%-*}/BIN"
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
  unoconv -d document --format=pdf *.doc
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
