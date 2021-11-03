# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of FreeType package.
# https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/freetype2

# These links were helpful while creating this patch.
# * https://aur.archlinux.org/cgit/aur.git/tree/0007-cleartype.patch?h=freetype2-cleartype
# * https://wiki.archlinux.org/index.php/Font_configuration#Advanced_LCD_filter_specification
# * https://github.com/bohoomil/fontconfig-ultimate/blob/master/freetype/03-infinality-2.6.3-2016.04.16.patch#L2092
# * https://www.reddit.com/r/archlinux/comments/5qkvqb/best_way_to_approximate_infinalitys_ultimate5

__arch_pkg_commit="dc7f306d5507d0f2898a669b5d2d8fc6cd2a59a4"

pkgname=freetype2-ultimate5
pkgver=2.11.0
pkgrel=2
pkgdesc="FreeType patched for effect similar to Infinality's ultimate5 preset."
url="https://www.freetype.org/"
conflicts=(freetype2)
provides=(freetype2=$pkgver libfreetype.so)
install=freetype2-ultimate5.install
arch=(x86_64)
license=('GPL')
depends=(zlib bzip2 libpng harfbuzz)
makedepends=(libx11)
source=(
	# Patch file.
	"like-ultimate5.patch"
   "upstream_01.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0001-Enable-table-validation-modules.patch"
   "upstream_02.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0002-Enable-subpixel-rendering.patch"
   "upstream_03.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0003-Enable-infinality-subpixel-hinting.patch"
   "upstream_04.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0004-Enable-long-PCF-family-names.patch"
   "upstream_06.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0006-Return_FT_Err_Ok_while_trying_to_render_bitmap.patch"
   "upstream_07.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0007-Restore_quiet_no-op_rendering_of_bitmap_glyphs.patch"
   "upstream_08.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0008-sfnt-Add-API-for-retrieving-a-COLR-v1-ClipBox-table.patch"
   "upstream_09.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0009-src-sfnt-ttcolr.c-tt_face_get_color_glyph_clipbox-Mi.patch"
   "upstream_10.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/0010-sfnt-Add-missing-blend-mode-plus-to-COLR-v1.patch"

	# Arch Linux package files.

	# FreeType source code.
	https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.xz
)
sha256sums=('9554d3a23619a46cf48e512e5b6336afd0802f42fdaf9b2e47ba0c718143f1dd'
            'e606bdba5c0ee698902886140e4643551ffc8327b1b7d2b0c9129d1f93b1f36c'
            '17ab1609cdbcaba3c5975f5cf1ffd078e067d560f906d5507390d41997e6c468'
            '561d2f2503d180b796f868470612610f6d7fcb34efa0620ecab38fd39002e27a'
            '9c068a984e7b9a27ff9e709839d522b66815ac4e8c7a5bd4ea0224335f7f2ef6'
            '2b13b8cc9acc3e56be6b0f8102d648864227bf93637bc956d5052c77c8509782'
            '21a2d243bc6b44d1cdb88ef29af2bd5ceda8d0faaf928bdc2c078a474ddc61f1'
            '13aba5006db13522ff0f3ffc85f81058b6cfcc48671285b1a90ac041a6a51952'
            '09a01b99839fc864db7a2c0748b4703ac5b04897cbd35e0d8969024b4ba89649'
            'fbabfb745db32e1d90f9798e1018da26578f3bce9714dac8e64c15b691e76f69'
            '8bee39bd3968c4804b70614a0a3ad597299ad0e824bc8aad5ce8aaf48067bde7')

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
