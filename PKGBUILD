# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: JIN Xiao-Yong <jinxiaoyong@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=freetype2-infinality
pkgver=2.7
pkgrel=1
pkgdesc="TrueType font rendering library with Infinality patches and custom settings."
arch=(armv7h i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11')
optdepends=('libx11: Some demo programs')
conflicts=('freetype2')
provides=("freetype2=$pkgver" 'libfreetype.so' 'freetype2-infinality-ultimate')
install=freetype2.install
backup=('etc/profile.d/freetype2.sh')
_abs_commit=f6f3016966633b17d3ec6360b4b8d62075ea6af4
_infinality_commit=acb83b884f46b4c54a5529376592739f929e0fbe
source=(http://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        http://download.savannah.gnu.org/releases/freetype/freetype-doc-${pkgver}.tar.bz2{,.sig}
        http://download.savannah.gnu.org/releases/freetype/ft2demos-${pkgver}.tar.bz2{,.sig}
        "0001-Enable-table-validation-modules.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-Enable-table-validation-modules.patch?id=${_abs_commit}"
        "0005-freetype-2.5.2-more-demos.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0005-freetype-2.5.2-more-demos.patch?id=${_abs_commit}"
        "freetype2.sh::https://git.archlinux.org/svntogit/packages.git/plain/trunk/freetype2.sh?id=${_abs_commit}"
        "https://raw.githubusercontent.com/archfan/infinality_bundle/${_infinality_commit}/01_freetype2-iu/0002-infinality-2.7-2016.09.09.patch")
sha1sums=('f251029d5ab542a96dd4531605fe577185077560'
          'SKIP'
          '22949e7c809d7d5931331ca54da30e4d195669ea'
          'SKIP'
          'b7f7633ca0b828ca319afdd09a81b42592685d9c'
          'SKIP'
          'b31882ef5e8447e761acee1c4a44c0630cd4d465'
          '72cfecbe738085eec475e012617661ad0cc9b76f'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f'
          '753a97119586e69c5e57d4b4cf9e445637d4ae49')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  # Rename source dir to allow building the demos
  mv freetype-${pkgver} freetype2

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-infinality-2.7-2016.09.09.patch

  cd ../ft2demos-${pkgver}
  # enable more demos
  patch -Np1 -i ../0005-freetype-2.5.2-more-demos.patch

  # Suppress RPATH
  sed -i '/X11_LIB:%=-R%/d' graph/x11/rules.mk
}

build() {
  cd freetype2
  ./configure --prefix=/usr --disable-static
  make

  # Build demos
  cd ../ft2demos-${pkgver}
  make
}

check() {
  cd freetype2
  make -k check
}

package() {
  cd freetype2
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../freetype2.sh "${pkgdir}/etc/profile.d/freetype2.sh"

  # Package docs
  install -dm755 "${pkgdir}/usr/share/doc"
  cp -a docs "${pkgdir}/usr/share/doc/${pkgname}"

  # Package demos
  cd ../ft2demos-${pkgver}
  for _i in bin/{f,t}t*; do
    libtool --mode=install install $_i "$pkgdir/usr/bin/"
  done
}
