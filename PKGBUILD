# See AUR interface to contact current maintainer.

pkgname=libreoffice-uglyfix-freetype2
pkgver=2.6
pkgrel=1
pkgdesc="Installs freetype2 .so files in the LibreOffice directory to fix font ugliness"
arch=(i686 x86_64)
license=('GPL')
url="http://freetype.sourceforge.net"
depends=('zlib' 'bzip2' 'sh' 'libpng' 'libreoffice-common')
options=(!docs)
source=(
  "http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2"
  'libreoffice-uglyfix.patch'
  'freetype-2.2.1-enable-valid.patch'
  'freetype-2.5.1-enable-spr.patch'
  'freetype-2.5.1-enable-sph.patch'
  'env_FT2_SUBPIXEL_HINTING.diff')    
sha256sums=('8469fb8124764f85029cc8247c31e132a2c5e51084ddce2a44ea32ee4ae8347e'
            '78932b6044c92367bf1eca07910b1c533ce6a0e721233feaeb27e6019adc3b81'
            '54c83a91b0b2ad7edad7df00a2c26a11ca18431a8e323db9471268a139c46f7e'
            '1c9a03e4cf07799deb7983b47b15f7557a8dbf9b8a7690910d017b6fd6804a23'
            'ae89da5ce6d196abd5fe44dfbec16e731d7045c0cdc043a503ed3f120663bcfd'
            '4b0a220ea989da35fc40f58c20bed092a901ecc35f28c45b02da38c96c470855')

prepare()
{
  cd "$srcdir/freetype-$pkgver"

  patch -Np1 -i "$srcdir/libreoffice-uglyfix.patch"

  # Arch patches
  #
  # Enable font validity checking (bad fonts can crash your
  # whole graphics stack)
  #
  patch -Np1 -i "$srcdir/freetype-2.2.1-enable-valid.patch"
  #
  # Enable subpixel rendering
  #
  patch -Np1 -i "$srcdir/freetype-2.5.1-enable-spr.patch"

  # Disabled for now due to resistance
  # Kept here for easier rebuilds via ABS
  # https://bugs.archlinux.org/task/35274
  #
  # Enable subpixel hinting.
  #
  #patch -Np1 -i "$srcdir/freetype-2.5.1-enable-sph.patch"

}
      
build()
{
  cd "$srcdir/freetype-$pkgver"
  ./configure --prefix=/usr --disable-static
  make
}

package()
{
  cd "$srcdir/freetype-$pkgver"
  install -d "$pkgdir"/usr/lib/libreoffice/program
  cp -aP "$srcdir/freetype-$pkgver"/objs/.libs/libfreetype.so* \
    "$pkgdir"/usr/lib/libreoffice/program
}
