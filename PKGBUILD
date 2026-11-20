# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Arjan Timmerman <arjan.archlinux.org>
# Contributor: Tom Newsom <Jeepster.gmx.co.uk>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-imlib2
_pkgname=imlib2
pkgver=1.13.0
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
makedepends=('git' 'lib32-libid3tag' 'lib32-librsvg' 'lib32-libwebp'
             'lib32-libavif' 'lib32-openjpeg2' 'lib32-libraw' 'lib32-libspectre')
depends=("${_pkgname}" 'lib32-bzip2' 'lib32-freetype2' 'lib32-giflib' 'lib32-libjpeg-turbo'
         'lib32-libpng' 'lib32-libtiff' 'lib32-libxext' 'lib32-xz')
optdepends=('lib32-libid3tag: ID3 loader'
            'lib32-librsvg: SVG loader'
            'lib32-libwebp: WEBP loader')
provides=('libImlib2.so')
source=("${_pkgname}::git+https://git.enlightenment.org/old/legacy-imlib2.git#tag=v${pkgver}")
sha512sums=('848fd1743ade5d6e40432d3dc7d91a2fe4a2740f783632ad376dfb2de5be163d10e866ebeb373e842a665280caca0601ddc007d8ef8f4db71bdf8509151d2e8d')

prepare() {
  cd "${_pkgname}"
  autoreconf -fiv
}

build() {
  cd "$_pkgname"

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
    --without-heif \
    --without-jxl

  make -j$(nproc)
}

check() {
  cd "$_pkgname"
  make check -j$(nproc)
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
  cd "$pkgdir/usr"
  rm -rf {bin,include,share/imlib2}/

  install -Dm644 "$srcdir/${_pkgname}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
