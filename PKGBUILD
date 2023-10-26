# Maintainer: belst <aur at bel dot st>
_pkgbasename=minizip
pkgname=lib32-minizip
pkgver=1.3
pkgrel=3
pkgdesc="ZIP file extraction library (32-bit)"
url="http://www.winimage.com/zLibDll/minizip.html"
license=('ZLIB' 'custom')
arch=('x86_64')
makedepends=('gcc-multilib' 'lib32-gcc-libs' 'libtool-multilib')
options=(!libtool)
depends=('lib32-glibc' "$_pkgbasename" 'lib32-zlib')
source=(https://github.com/madler/zlib/releases/download/v$pkgver/zlib-$pkgver.tar.xz
        zlib-1.3-CVE-2023-45853.patch::https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c.patch)
sha256sums=('8a9ba2898e1d0d774eca6ba5b4627a11e5588ba85c8851336eb38de4683050a7'
            '7aa0221bf62796c29ae665ef3dd138489e1995b7095924dc035104959da13417')

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $srcdir/zlib-$pkgver/contrib/$_pkgbasename
  patch -Np3 < "${srcdir}/zlib-1.3-CVE-2023-45853.patch"
  rm Makefile
  autoreconf -i
  autoconf
  automake --add-missing
  automake
  ./configure --prefix=/usr --libdir=/usr/lib32

  make
}

package() {
  cd $srcdir/zlib-$pkgver/contrib/$_pkgbasename
  make install DESTDIR=${pkgdir}

  rm -rf $pkgdir/usr/{include,share}
  install -d $pkgdir/usr/share/licenses
  ln -s $_pkgbasename $pkgdir/usr/share/licenses/$pkgname
}
