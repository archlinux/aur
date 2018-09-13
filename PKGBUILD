# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Arjan Timmerman <arjan.archlinux.org>
# Contributor: Tom Newsom <Jeepster.gmx.co.uk>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-imlib2
_pkgname=imlib2
pkgver=1.5.1
pkgrel=1
pkgdesc="Library that does image file loading and saving as well as rendering, manipulation, arbitrary polygon support, lib32"
url="http://sourceforge.net/projects/enlightenment/"
arch=('x86_64')
license=('BSD')
depends=('lib32-libtiff' 'lib32-giflib' 'lib32-bzip2' 'lib32-freetype2' 'lib32-libxext' 'lib32-libpng' 'lib32-libid3tag' 'lib32-libjpeg-turbo' "${_pkgname}")
source=("http://downloads.sourceforge.net/enlightenment/${_pkgname}-$pkgver.tar.bz2")
sha512sums=('f9d971674887d4af067c6921e34b6fe598db0317052bc864b676c526b36373ce021d9d49cad95aa64dbbd8e74f1831ddf3ed105900e3df2b66a6b53f7f27c732')

prepare() {
  cd "$_pkgname-$pkgver"
  sed -i 's/@my_libs@//' imlib2-config.in
}

build() {
  cd "$_pkgname-$pkgver"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  # Configure and Build
  ./configure --prefix=/usr --sysconfdir=/etc/imlib2 --x-libraries=/usr/lib32 --enable-mmx --disable-amd64 --libdir=/usr/lib32 --libexecdir=/usr/lib32 

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
