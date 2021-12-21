# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=fastiv-git
_pkgname=fastiv
pkgver=r241.b35590a
pkgrel=1
pkgdesc="Fast image viewer"
url="https://git.janouch.name/p/fastiv"
arch=('i686' 'x86_64')
license=('custom:0BSD')
conflicts=('fastiv')
provides=('fastiv')
makedepends=('meson' 'pkg-config' 'git')
depends=('gtk3' 'pixman' 'libjpeg-turbo')
optdepends=('libraw' 'librsvg' 'gdk-pixbuf2' 'libxcursor' 'libtiff' 'libheif'
  'libwebp' 'perl-image-exiftool')
source=("git+https://git.janouch.name/p/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git submodule update
}

build() {
  arch-meson --wrap-mode default "$srcdir/$_pkgname" "$srcdir/$_pkgname-build"
  meson compile -C "$srcdir/$_pkgname-build"
}

package() {
  meson install -C "$srcdir/$_pkgname-build" --destdir "$pkgdir"
}
