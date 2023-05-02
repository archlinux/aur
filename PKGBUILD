# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Arjan Timmerman <arjan.archlinux.org>
# Contributor: Tom Newsom <Jeepster.gmx.co.uk>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-imlib2
_pkgname=imlib2
pkgver=1.11.1
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
sha256sums=('f712b6bb9dcad46d8b8f4ad52610dcbbaebb4cc80b5fd12f93124d3a380fa6bf')
sha512sums=('2d0dc569ab35822d5ac3cd07979a807462c1ad501ea15e4c757a15bbe254657c08acf6da8603ba2e9ab5b57a6b0c0ecf119eab80ffe59a55f29d325c839763ac')

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
