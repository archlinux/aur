# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of FreeType package.
# https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/freetype2

# These links were helpful while creating this patch.
# * https://aur.archlinux.org/cgit/aur.git/tree/0007-cleartype.patch?h=freetype2-cleartype
# * https://wiki.archlinux.org/index.php/Font_configuration#Advanced_LCD_filter_specification
# * https://github.com/bohoomil/fontconfig-ultimate/blob/master/freetype/03-infinality-2.6.3-2016.04.16.patch#L2092
# * https://www.reddit.com/r/archlinux/comments/5qkvqb/best_way_to_approximate_infinalitys_ultimate5

__arch_pkg_commit="a5a4ee489620cbb38b3a214feb6f3001a1a23449"

pkgname=freetype2-ultimate5
pkgver=2.10.4
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

	# Arch Linux package files.
	"upstream_1.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-Enable-table-validation-modules.patch?h=packages/freetype2&id=$__arch_pkg_commit"
	"upstream_2.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0002-Enable-subpixel-rendering.patch?h=packages/freetype2&id=$__arch_pkg_commit"
	"upstream_3.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0003-Enable-infinality-subpixel-hinting.patch?h=packages/freetype2&id=$__arch_pkg_commit"
	"upstream_4.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0004-Enable-long-PCF-family-names.patch?h=packages/freetype2&id=$__arch_pkg_commit"

	# FreeType source code.
	https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.xz
)
sha256sums=('9554d3a23619a46cf48e512e5b6336afd0802f42fdaf9b2e47ba0c718143f1dd'
            'f41df4f336d5e82e58733c7a4594476c9216cfc85c096327745a7e1b559e17e1'
            'dc77c1cfee4bf8e7e0690628c95d211df09e0d0750e4c8f075b78b5f105514f7'
            '21a62bc12b848320c686d602d8d4e3bcd51294a9def4dc9c301736e077b59f3f'
            '266384222f87a02fb02b2179828f6c26fe6d7b1fd09d1f7e3734e7fcb09cda2e'
            '86a854d8905b19698bbc8f23b860bc104246ce4854dcea8e3b0fb21284f75784')

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
