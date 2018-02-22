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
pkgrel=2
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
sha1sums=('94c4399b1a55c5892812e732843fcb4a7c2fe657'
          'SKIP'
          'b69531770c343d403be294b7e4d25ac45738c833'
          '3d26a569f0cb94c28a550577f5dcaadb4e193d91'
          '770f1981734a837bcf065564c91644b4cc5e256a'
          '21ad7dd31e16adb5b39adfa5671018a736626562'
          '6aaa8af267f85079c8f21db417bc1741de980113'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f')
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
