# Maintainer:  jeckhack <jeckhack/gmail/com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: frames <markkuehn at outlook dot com>
# Contributor: Estevao Valadao <estevao@archlinux-br.org>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Lee.MaRS <leemars@gmail.com>
# Contributor: freedom

pkgname=freetype2-cleartype
pkgver=2.9
pkgrel=1
pkgdesc="Font rasterization library with ClearType patch"
arch=(x86_64)
license=('GPL')
url="https://www.freetype.org/"
	# adding harfbuzz for improved OpenType features auto-hinting
	# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11')
conflicts=('freetype2')
provides=('freetype2' 'libfreetype.so')
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        	0001-Enable-table-validation-modules.patch
        	0002-Enable-infinality-subpixel-hinting.patch
        	0003-Enable-long-PCF-family-names.patch
		0001-psaux-Correctly-handle-Flex-features-52846.patch
		0007-cleartype.patch
		freetype2.sh
)
md5sums=('513c403c110016fdc7e537216a642b1d'
         'SKIP'
         'a1f96fd4abc2574b04c2599fb1c71293'
         '47e916030eec65a17d87641595cc1ae8'
         'b97d9d0b86f9edb961ee97f771016ba5'
         '0292b4dbbefbfc5404390e4879b88de2'
         '9df123ffc4fd56e6345abb2707efd84e'
         'fef731289a0f86933ff2d0b3615c3de0')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {

  mv freetype-${pkgver} freetype2
  cd freetype2
  

  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch
  patch -Np0 -i ../0007-cleartype.patch

  # Freetype 2.9 regression: bad rendering for some Type 1 fonts
  # https://savannah.nongnu.org/bugs/?52846
  patch -Np1 -i ../0001-psaux-Correctly-handle-Flex-features-52846.patch

}

build() {
    cd freetype2
    ./configure --prefix=/usr --disable-static
    make
}

check() {
  cd freetype2
  make -k check
}

package() {
    install=freetype2.install
    backup=('etc/profile.d/freetype2.sh')
    cd freetype2
    make DESTDIR="$pkgdir" install
    install -Dt "${pkgdir}/etc/profile.d" -m644 ../freetype2.sh

}
