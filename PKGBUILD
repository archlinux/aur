# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: jeckhack <jeckhack/gmail/com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: frames <markkuehn at outlook dot com>
# Contributor: Estevao Valadao <estevao@archlinux-br.org>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Lee.MaRS <leemars@gmail.com>
# Contributor: freedom

pkgname=freetype2-cleartype
pkgver=2.9.1
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
backup=('etc/profile.d/freetype2.sh')
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-infinality-subpixel-hinting.patch
        0003-Enable-long-PCF-family-names.patch
        0007-cleartype.patch
        freetype2.sh
)
sha1sums=('220c82062171c513e4017c523d196933c9de4a7d'
          'SKIP'
          'd9eb22e5c962923089b0c9fc5491cf28a19bd982'
          'd13503902e0404cf3558db76b477f23f9910d06e'
          'fc49742fb6c19fe0677e3552bb7c00aac8530265'
          '60f26c740ac53c684703ef401a481659a7364ff4'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  cd freetype-${pkgver}
  # Patches from [extra]
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch
  # Enable ClearType
  patch -Np1 -i ../0007-cleartype.patch
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
  install -Dm644 ../freetype2.sh -t "${pkgdir}"/etc/profile.d -m644
}
