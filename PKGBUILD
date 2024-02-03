# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Arjan Timmerman <arjan.archlinux.org>
# Contributor: Tom Newsom <Jeepster.gmx.co.uk>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-imlib2
_pkgname=imlib2
pkgver=1.12.2
pkgrel=1
pkgdesc='Library that does image file loading and saving as well as rendering, manipulation, arbitrary polygon support, lib32'
url='https://sourceforge.net/projects/enlightenment/'
arch=('x86_64')
license=('BSD')
# this could link against these libs if exists...
#  * lib32-libheif
#  * lib32-libjxl
#  * lib32-libspectre
#  * lib32-openjpeg2
makedepends=('lib32-libid3tag' 'lib32-librsvg' 'lib32-libwebp')
depends=("${_pkgname}" 'lib32-bzip2' 'lib32-freetype2' 'lib32-giflib' 'lib32-libjpeg-turbo'
         'lib32-libpng' 'lib32-libtiff' 'lib32-libxext' 'lib32-xz')
optdepends=('lib32-libid3tag: ID3 loader'
            'lib32-librsvg: SVG loader'
            'lib32-libwebp: WEBP loader')
source=("https://downloads.sourceforge.net/project/enlightenment/imlib2-src/$pkgver/$_pkgname-$pkgver.tar.xz")
sha256sums=('cc49931a20560968a8648c9ca079085976085ea96d59a01b1e17cb55af0ffe42')
sha512sums=('3bffb8f0f6b3ec73a81f1d0c6ef3a3443425677cd8a1950422f102b67769c06df54128b21f84bd6c7880120cc5ec6f30d2ab134b3c001ad77f2d39efd749a5b7')

build() {
  cd "$_pkgname-$pkgver"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  # Configure and Build
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/imlib2 \
    --x-libraries=/usr/lib32 \
    --enable-mmx \
    --disable-amd64 \
    --libdir=/usr/lib32 \
    --libexecdir=/usr/lib32 \
    --without-heif

  make
}

check() {
  cd "$_pkgname-$pkgver"
  make check
}

package() {
  cd "${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
  cd "$pkgdir/usr"
  rm -rf {bin,include,share/imlib2}/

  install -Dm644 "$srcdir/${_pkgname}-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
