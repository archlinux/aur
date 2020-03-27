# Maintainer: Zach Callear <zach@callear.org>
# Contributor: Mark Quinn <mmq.arch@dekinai.com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=imgmin
pkgname=$_pkgname-git
pkgver=1.1.r17.g3451031
pkgrel=6
pkgdesc="Automated lossy JPEG optimization"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/rflynn/imgmin"
license=('MIT')
depends=('libmagick6')
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  # Use libmagick6 instead of 7 by using pkg-config directly instead of MagickWand-config.
  #
  # Previously it was possible to use the MagickWand-config script from ImageMagick 7, but it
  #     now hardcodes MagickWand-7 in its pkg-config call.
  sed -i 's~AC_CHECK_PROGS(MAGICK_CONFIG.*~AC_CHECK_PROG(MAGICK_CONFIG, MagickWand-config, PKG_CONFIG_PATH=/usr/lib/imagemagick6/pkgconfig pkg-config MagickWand)~g' configure.ac
  sed -i 's~ --cppflags~ --cflags~g' src/Makefile.am src/apache2/Makefile.am
  sed -i 's~ --ldflags~ --libs~g' src/Makefile.am src/apache2/Makefile.am
  
  # Temporarily fix https://github.com/rflynn/imgmin/issues/56 (Chroma Downsampling Lowers Visual Quality).
  sed -i 's~        (void) MagickSetImageProperty(mw, "jpeg:sampling-factor", "2x2");~//\0~' src/imgmin.c

  autoreconf -fi
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE-MIT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
