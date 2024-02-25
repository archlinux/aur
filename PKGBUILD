# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=fiv-git
_pkgname=fiv
pkgver=r610.a5ebc69
pkgrel=1
pkgdesc="Image browser and viewer"
url="https://git.janouch.name/p/fiv"
arch=('i686' 'x86_64')
license=('custom:0BSD')
conflicts=('fiv')
provides=('fiv')
makedepends=('meson' 'pkg-config' 'git')
depends=('gtk3' 'pixman' 'libjpeg-turbo' 'libwebp')
optdepends=(
  'libraw: raw photo images'
  'resvg: SVG images'
  #'librsvg: SVG images'
  #'gdk-pixbuf2: GdkPixbuf module support'
  #'libxcursor: X cursor images'
  'libtiff: TIFF images'
  'libheif: HEIF images'
  'perl-image-exiftool: file information'
  'xdg-utils: reverse image search'
  'curl: reverse image search'
  'jq: reverse image search'
)
install=fiv.install
source=(
  "git+https://git.janouch.name/p/$_pkgname.git"
  update-fiv-desktop-files.hook
)
sha256sums=(
  SKIP
  b1f135e28fc09994fb891984990c9567ee49d1ad82ffebb6deb131c2e22cee52
)

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
  # resvg is unstable and needs to be enabled explicitly
  arch-meson --auto-features auto --wrap-mode default \
	"$srcdir/$_pkgname" "$srcdir/$_pkgname-build"
  meson compile -C "$srcdir/$_pkgname-build"
}

package() {
  meson install -C "$srcdir/$_pkgname-build" --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
}
