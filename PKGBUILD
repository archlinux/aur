# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=dn-git
_pkgname=dawn
pkgver=r61.219393c
pkgrel=4
pkgdesc="Colour-managed image browser"
url="https://git.janouch.name/p/dawn"
arch=('x86_64')
license=('0BSD')
conflicts=('dn')
provides=('dn')
makedepends=(
  'cmake'
  'git'
  'glslang'
  'librsvg'
  'pkg-config'
  'vulkan-headers'
)
depends=(
  'libcolord'
  'libjpeg-turbo'
  'libwebp'
  'qt6-base'
  'resvg'
  'shared-mime-info'
  'vulkan-icd-loader'
  'wayland-protocols'
)
optdepends=(
  'gdk-pixbuf2: GdkPixbuf module support'
  'libheif: HEIF images'
  'libraw: raw photo images'
  'librsvg: SVG images'
  'libtiff: TIFF images'
  'libxcursor: X cursor images'
  'perl-image-exiftool: file information'
)
install=dn.install
source=(
  "git+https://git.janouch.name/p/$_pkgname.git"
  update-dn-desktop-files.hook
)
sha256sums=(
  SKIP
  baa1bcd3bc55eacd28ad54e78b64d1f872d3e40100bb98a1af43d7ba0d4743bd
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
  rm -rf "$srcdir/$_pkgname-build"
  mkdir "$srcdir/$_pkgname-build"
  cd "$srcdir/$_pkgname-build"
  cmake "$srcdir/$_pkgname" -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-build"
  make install DESTDIR="$pkgdir"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 \
	  "$srcdir/update-dn-desktop-files.hook"
}
