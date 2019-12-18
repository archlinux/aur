# Maintainer: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Jaden Peterson <jadenpeterson150@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: jeckhack <jeckhack/gmail/com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: frames <markkuehn at outlook dot com>
# Contributor: Estevao Valadao <estevao@archlinux-br.org>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Lee.MaRS <leemars@gmail.com>
# Contributor: freedom

pkgname=freetype2-cleartype
pkgver=2.10.1
pkgrel=1
pkgdesc="Font rasterization library with ClearType patch"
arch=('x86_64')
license=('GPL')
url="https://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11')
conflicts=('freetype2')
provides=('freetype2' 'libfreetype.so')
backup=('etc/profile.d/freetype2.sh')
install=freetype2.install
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.xz{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-infinality-subpixel-hinting.patch
        0003-Enable-long-PCF-family-names.patch
        0007-cleartype.patch
        freetype2.sh)
sha1sums=('79874ef4eaa52025126b71d836453b8279bdd331'
          'SKIP'
          '46fd67e6a594f6c2c473b9321ba64913984ba42f'
          '4bf0c0749db09878b918cc404300f0d3e9091607'
          'af76172be8135e74391b7ad1b82c2124ae0ad86c'
          '769ee34c98e78d1e6182476704ddec85f92da394'
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
  install -Dt "${pkgdir}/etc/profile.d" -m644 ../freetype2.sh
}
