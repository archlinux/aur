# Maintainer: P. A. López-Valencia <https://aur.archlinux.org/users/vorbote/>

pkgname=libreoffice-uglyfix-freetype2
pkgver=2.7.1
pkgrel=1
pkgdesc="TrueType font rendering library"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
depends=('zlib' 'bzip2' 'libpng' 'harfbuzz' 'libreoffice')
options=(!docs)
source=(http://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        libreoffice-uglyfix-noautohint.patch
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch)
sha512sums=('df39e2ef55f9090a66fecb6b5e9a5d296a043ddfd919d0ce3d7ea5132aa388bfbbeeaa6d6df6513956134b987e1c3a5eac6975c0c9631213af77457a623b49da'
            'SKIP'
            '1dd25097eb2a3cd1ee5fa6c4bcb23d94603579a7c432a052c7a961a2a409975e401dd6e87ebcfe55221b32fcb794dcb3833e8ed10da499bb2116a2f041e26ef1'
            '41a84be2631b53072a76b78c582575aa48b650ee7b00017d018381002bc25df10cf33da4954c95ef50db39f1fa566678e3b4ae9bfee1dfd705423fb53e53e494'
            '65be5283f5050e9d6ebe1c6808ec28bb46d5290ee84aede570977b66988eeb674524d0a834dbb2999a487e3a85ca292774212dadc5a3e713e1f5b8a80d75ddf3'
            '7b52a3d67750d59b2c98e83dab4e0a0ab263142c2ca7bd5f8be5f8fe9cd1dc1f4debad44111c7886665329d8d2a3163756455618a6615df8f85d82bb0372d4dd')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  # Rename source dir to allow building the demos
  cd freetype-$pkgver

  patch -Np1 -i ../libreoffice-uglyfix-noautohint.patch

  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
}

build() {
  cd freetype-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd freetype-$pkgver
  make -k check
}

package() {
  cd freetype-$pkgver

  install -Dm755 "$srcdir/freetype-$pkgver/objs/.libs/libfreetype.so" "$pkgdir/usr/lib/libreoffice/program/libfreetype.so"
}
