# Maintainer: Zach Callear <zach@callear.org>
# Contributor: Mark Quinn <mmq.arch@dekinai.com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=imgmin
pkgname=$_pkgname-git
pkgver=1.1.r17.g3451031
pkgrel=2
pkgdesc="Automated lossy JPEG optimization"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/rflynn/imgmin"
license=('MIT')
depends=('imagemagick')
makedepends=('git libmagick6')
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

  # Use libmagick6 with MagickWand-config.
  sed -i 's~\($(MAGICK_CONFIG\)~PKG_CONFIG_PATH=/usr/lib/imagemagick6/pkgconfig \1~g' src/Makefile.am src/apache2/Makefile.am

  #fix build issue with Apache module on some systems
  sed -i 's/\(MAGICK_CONFIG.*\?xargs\)/\1|sed "s\/-fopenmp\\s\/\/g"/' src/apache2/Makefile.am

  #temporarily fix https://github.com/rflynn/imgmin/issues/56 (Quality Worse than with ImageMagick convert)
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
