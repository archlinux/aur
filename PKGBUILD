# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: JIN Xiao-Yong <jinxiaoyong@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=freetype2-infinality
pkgver=2.8
pkgrel=1
pkgdesc="Font rasterization library with Infinality patches and custom settings."
arch=(armv7h i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11')
conflicts=('freetype2')
provides=("freetype2=$pkgver" 'libfreetype.so' 'freetype2-infinality-ultimate')
install=freetype2.install
backup=('etc/profile.d/freetype2.sh')
_abs_commit=c419271e92acf355fc52824eb93e69b5c9f29d40
_infinality_commit=4db742f46f3b790d90183d44b166b44fb8e8197c
source=(http://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        http://download.savannah.gnu.org/releases/freetype/freetype-doc-${pkgver}.tar.bz2{,.sig}
        "0001-Enable-table-validation-modules.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-Enable-table-validation-modules.patch?id=${_abs_commit}"
        "0004-Enable-long-PCF-family-names.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0004-Enable-long-PCF-family-names.patch?id=${_abs_commit}"
        "freetype2.sh::https://git.archlinux.org/svntogit/packages.git/plain/trunk/freetype2.sh?id=${_abs_commit}"
        "https://raw.githubusercontent.com/djpohly/infinality_bundle/${_infinality_commit}/01_freetype2-iu/0002-infinality-2.8-2017.05.24.patch")
sha1sums=('42c6b1f733fe13a3eba135f5025b22cb68450f91'
          'SKIP'
          '5b221ee14fe674cd5f6db0193d55360bc0bd3655'
          'SKIP'
          'c3e91e668936206d3c158bffde0f69788a086a5b'
          '334f229875039794adeb574e27d365bb445fb314'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f'
          '4b442f097eeae28516b43c659a3d7a679129052c')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  cd freetype-${pkgver}

  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
  patch -Np1 -i ../0002-infinality-2.8-2017.05.24.patch
}

build() {
  cd freetype-${pkgver}
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd freetype-${pkgver}
  make -k check
}

package() {
  cd freetype-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../freetype2.sh "${pkgdir}/etc/profile.d/freetype2.sh"

  # Package docs
  install -dm755 "${pkgdir}/usr/share/doc"
  cp -a docs "${pkgdir}/usr/share/doc/${pkgname}"
}
