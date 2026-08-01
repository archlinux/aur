# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=asciicast2webp-git
_pkgname=asciicast2webp
pkgver=r1.5c56c50
pkgrel=1
pkgdesc="Render asciicast as WebP"
url="https://git.janouch.name/p/asciicast2webp"
arch=('i686' 'x86_64')
license=('0BSD')
options=(zipman)
conflicts=('asciicast2webp')
provides=('asciicast2webp')
makedepends=('cmake' 'pkg-config' 'git')
depends=('ncurses' 'libwebp' 'jq' 'libvterm' 'cairo')
source=("git+https://git.janouch.name/p/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  rm -rf "$srcdir/$_pkgname-build"
  mkdir "$srcdir/$_pkgname-build"
  cd "$srcdir/$_pkgname-build"
  cmake "$srcdir/$_pkgname" -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-build"
  make install DESTDIR=$pkgdir
  install -Dm644 "$srcdir/$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
