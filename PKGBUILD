# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=qimgv-gtk-git
_pkgname=qimgv-gtk
pkgver=0.1.0_r1_g46c9d5f
pkgrel=1
pkgdesc='Fast and easy to use image viewer, GTK 3 rewrite of qimgv with JPEG XL, AVIF, HEIF, APNG and RAW support (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/TheElevatedOne/qimgv-gtk'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'glib2' 'gtk3' 'cairo' 'pango' 'gdk-pixbuf2' 'libjpeg-turbo' 'libpng' 'libwebp'
         'libjxl' 'libavif' 'libheif' 'libraw' 'exiv2' 'giflib' 'zlib')
makedepends=('git' 'cmake' 'pkgconf')
provides=("$_pkgname" 'qimgv')
conflicts=("$_pkgname" 'qimgv')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/_/g'
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQIMGV_BUILD_TESTS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd "$_pkgname"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
