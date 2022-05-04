# current freetype package header:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# previous freetype2-ultimate5 maintainer
# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of FreeType package.
# https://github.com/archlinux/svntogit-packages/tree/packages/freetype2/trunk

# These links were helpful while creating this patch.
# * https://aur.archlinux.org/cgit/aur.git/tree/0007-cleartype.patch?h=freetype2-cleartype
# * https://wiki.archlinux.org/index.php/Font_configuration#Advanced_LCD_filter_specification
# * https://github.com/bohoomil/fontconfig-ultimate/blob/master/freetype/03-infinality-2.6.3-2016.04.16.patch#L2092
# * https://www.reddit.com/r/archlinux/comments/5qkvqb/best_way_to_approximate_infinalitys_ultimate5

__arch_pkg_commit="943d7dcb1d33b6d05dfa4d10c1b7286c0d1753e0"

pkgname=freetype2-ultimate5
pkgver=2.12.1
pkgrel=1
pkgdesc="FreeType patched for effect similar to Infinality's ultimate5 preset."
url="https://www.freetype.org/"
conflicts=(freetype2)
provides=(freetype2=$pkgver libfreetype.so)
install=freetype2-ultimate5.install
arch=(x86_64)
license=('GPL')
makedepends=(libx11 qt5-base meson librsvg)
options=(debug)
source=(
	# Patch file.
	"like-ultimate5.patch"
   "upstream_01.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0001-Enable-table-validation-modules.patch"
   "upstream_02.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0002-Enable-subpixel-rendering.patch"
   "upstream_03.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0003-Enable-infinality-subpixel-hinting.patch"
   "upstream_04.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0004-Enable-long-PCF-family-names.patch"

	# Arch Linux package files.

	# FreeType source code.
	https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.xz
)
sha256sums=('9554d3a23619a46cf48e512e5b6336afd0802f42fdaf9b2e47ba0c718143f1dd'
            '12c869eeba212c74d07d3d7815848b047ecb5282d5463dffb3bb6d219315d4da'
            '2497dcb3650271db9bb7ad4f3379b5b3c6a19f5ca5388dd9ba7d42b5c15c8c4f'
            'caa0bc7d3dfa3b4c6b9beecda6141405dafe540f99a655dc83d1704fa232ac20'
            '8bf978cd1abd73f54c53f7d214c368b1fd8921cd9800d2cc84427c662ffbbdcb'
            '4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f')

prepare()
{
	cd freetype-$pkgver

	# Apply Arch Linux patches.
	for upstream_patch in $srcdir/upstream_*.patch; do
		patch -Np1 -i "$upstream_patch"
	done

	# Apply this patch.
	patch -p 1 -i "$srcdir/like-ultimate5.patch"
}

build()
{
	cd freetype-$pkgver

	./configure --prefix=/usr --disable-static
	make
}

package()
{
	cd freetype-$pkgver

	make DESTDIR="${pkgdir}" install
}
