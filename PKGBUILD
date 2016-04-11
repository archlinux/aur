# See AUR interface to contact current maintainer.

# Do note that this PKGBUILD follows closely the PKGBUILD provided by 
# Arch extra repository, for obvious reasons.

pkgname=libreoffice-uglyfix-freetype2
pkgver=2.6.3
pkgrel=1
pkgdesc="Installs freetype2 .so files in the LibreOffice directory to fix font ugliness"
arch=(i686 x86_64)
license=('GPL')
url="http://freetype.sourceforge.net"
# adding harfbuzz for improved OpenType features auto-hinting 
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'libpng' 'harfbuzz' 'libreoffice')
options=(!docs)
source=(
  http://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
  libreoffice-uglyfix-noautohint.patch
  0001-Enable-table-validation-modules.patch
  0002-Enable-subpixel-rendering.patch
  0003-Enable-subpixel-hinting.patch
  0004-Mask-subpixel-hinting-with-an-env-var.patch)
sha256sums=('371e707aa522acf5b15ce93f11183c725b8ed1ee8546d7b3af549863045863a2'
            'SKIP'
            '65915726ba3adfc5903ddd6b706ce91751994e7635ea6111e33e5939c674496b'
            '9de28c1156c0a5edff1b3860ad44f4cc2494fc5663bd40c3914fdd64e8ee0724'
            '60e767ccee37939bfea73fa86229108c51b665713a89fbda5506759af2e7d629'
            '78aba5d04418952cf4a29351420fc82c5830616d221e95a21a0c8e3da827d681'
            '3672ef244d6c455623bd0ddecde46bd3758152713a03d475f91aaccfa1a2e0f4')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare()
{
  cd "$srcdir/freetype-$pkgver"

  patch -Np1 -i "$srcdir/libreoffice-uglyfix-noautohint.patch"

  #
  # Arch patches
  #

  patch -Np1 -i "${srcdir}/0001-Enable-table-validation-modules.patch"
  patch -Np1 -i "${srcdir}/0002-Enable-subpixel-rendering.patch"

  # https://bugs.archlinux.org/task/35274
  patch -Np1 -i "${srcdir}/0003-Enable-subpixel-hinting.patch"
  # Provide a way to enable the above patch at runtime.
  # Hopefully just a temporary measure until fontconfig picks up
  # the necessary configurables.
  patch -Np1 -i "${srcdir}/0004-Mask-subpixel-hinting-with-an-env-var.patch"
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
