# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Arjan Timmerman <arjan.archlinux.org>
# Contributor: Tom Newsom <Jeepster.gmx.co.uk>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-imlib2
_pkgname=imlib2
pkgver=1.8.0
pkgrel=1
pkgdesc='Library that does image file loading and saving as well as rendering, manipulation, arbitrary polygon support, lib32'
url='https://sourceforge.net/projects/enlightenment/'
arch=('x86_64')
license=('BSD')
# this could link against lib32-libheif if exists...
depends=('lib32-libtiff' 'lib32-giflib' 'lib32-bzip2' 'lib32-freetype2' 'lib32-libxext' 'lib32-libpng' 'lib32-libid3tag' 'lib32-libjpeg-turbo' 'lib32-libwebp' 'lib32-librsvg' 'lib32-xz' "${_pkgname}")
source=("https://downloads.sourceforge.net/project/enlightenment/imlib2-src/$pkgver/$_pkgname-$pkgver.tar.xz")
sha512sums=('e4e4dbd58b9413d11a2ca645b7351c5b441b330d579b6d9f53db445e4d10e30cfeb77158d018ce14d37b536314f238b8ddf7366d293975709d9c11765e7c5735')

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
    --libexecdir=/usr/lib32 

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
