# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of FreeType package.
# https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/freetype2

# These links were helpful while creating this patch.
# * https://aur.archlinux.org/cgit/aur.git/tree/0007-cleartype.patch?h=freetype2-cleartype
# * https://wiki.archlinux.org/index.php/Font_configuration#Advanced_LCD_filter_specification
# * https://github.com/bohoomil/fontconfig-ultimate/blob/master/freetype/03-infinality-2.6.3-2016.04.16.patch#L2092
# * https://www.reddit.com/r/archlinux/comments/5qkvqb/best_way_to_approximate_infinalitys_ultimate5

__arch_pkg_commit="8a7ca92c21a9a84ec50f4eabf3c2300da1f3e407"

pkgname=freetype2-ultimate5
pkgver=2.10.0
pkgrel=2
pkgdesc="FreeType patched for effect similar to Infinality's ultimate5 preset."
url="https://www.freetype.org/"
conflicts=(freetype2)
provides=(freetype2=$pkgver libfreetype.so)
arch=(x86_64)
license=('GPL')
depends=(zlib bzip2 libpng harfbuzz)
makedepends=(libx11)
source=(
	# Patch file.
	"like-ultimate5.patch"

	# Arch Linux package files.
	"upstream_1.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-Enable-table-validation-modules.patch?h=packages/freetype2&id=$__arch_pkg_commit"
	"upstream_2.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0002-Enable-infinality-subpixel-hinting.patch?h=packages/freetype2&id=$__arch_pkg_commit"
	"upstream_3.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0003-Enable-long-PCF-family-names.patch?h=packages/freetype2&id=$__arch_pkg_commit"
	"upstream_4.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0004-pcf-Fix-handling-of-undefined-glyph-56067.patch?h=packages/freetype2&id=$__arch_pkg_commit"

	# FreeType source code.
	https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2
)
sha1sums=(
	"4d111cc93d9a7aca79b4a75ccd069df08aa2ad26"
	"46fd67e6a594f6c2c473b9321ba64913984ba42f"
	"4bf0c0749db09878b918cc404300f0d3e9091607"
	"af76172be8135e74391b7ad1b82c2124ae0ad86c"
	"74d0ae26620a22c03002ecfffd7bd4c8130d6f6c"
	"f6abf03e0e3189a0de883981c57d3861b5d314f5"
)

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
