# Maintainer: jeckhack <jeckhack/gmail/com>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: frames <markkuehn at outlook dot com>
# Contributor: Estevao Valadao <estevao@archlinux-br.org>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Lee.MaRS <leemars@gmail.com>
# Contributor: freedom

pkgname=freetype2-cleartype
pkgver=2.8.1
pkgrel=1
pkgdesc="Font rasterization library with ClearType patch"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.freetype.org/"
	# adding harfbuzz for improved OpenType features auto-hinting
	# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11')
conflicts=('freetype2')
provides=('freetype2=$pkgver' 'libfreetype.so')
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        	0001-Enable-table-validation-modules.patch
        	0003-Enable-infinality-subpixel-hinting.patch
        	0004-Enable-long-PCF-family-names.patch
		0007-cleartype.patch
		freetype2.sh
)
md5sums=('bf0a210b6fe781228fa0e4a80691a521'
         'SKIP'
         '6e7911925d68acd7758ab61db380ee7b'
         'a24cb1f7b3439e656f8c53f677cdb2f0'
         'ae5ceb3e8f0d8bbce0c8fa21cc2ef458'
         '9df123ffc4fd56e6345abb2707efd84e'
         'fef731289a0f86933ff2d0b3615c3de0')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {

  mv freetype-${pkgver} freetype2
  cd freetype2
  

  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
  patch -Np0 -i ../0007-cleartype.patch

}

build() {
    cd freetype2
    ./configure --prefix=/usr --disable-static
    make
}


package() {
    install=freetype2.install
    backup=('etc/profile.d/freetype2.sh')
    cd freetype2
    make DESTDIR="$pkgdir" install
    install -Dt "${pkgdir}/etc/profile.d" -m644 ../freetype2.sh

}
