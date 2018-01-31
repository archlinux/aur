# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of FreeType package.
# https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/freetype2

# These links were helpful while creating this patch.
# * https://aur.archlinux.org/cgit/aur.git/tree/0007-cleartype.patch?h=freetype2-cleartype
# * https://wiki.archlinux.org/index.php/Font_configuration#Advanced_LCD_filter_specification
# * https://github.com/bohoomil/fontconfig-ultimate/blob/master/freetype/03-infinality-2.6.3-2016.04.16.patch#L2092
# * https://www.reddit.com/r/archlinux/comments/5qkvqb/best_way_to_approximate_infinalitys_ultimate5

__arch_pkg_commit="514f0d40b6602a391f285465c05115deb2420823"

pkgname=freetype2-ultimate5
pkgver=2.9
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
	"upstream_4.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/0001-psaux-Correctly-handle-Flex-features-52846.patch?h=packages/freetype2&id=$__arch_pkg_commit"

	# FreeType source code.
	https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2
)
sha1sums=(
	"97253086dd201b7e368e8ee897a0c977b0908c4e"
	"b69531770c343d403be294b7e4d25ac45738c833"
	"3d26a569f0cb94c28a550577f5dcaadb4e193d91"
	"770f1981734a837bcf065564c91644b4cc5e256a"
	"21ad7dd31e16adb5b39adfa5671018a736626562"
	"94c4399b1a55c5892812e732843fcb4a7c2fe657"
)

prepare()
{
	cd freetype-$pkgver

	# Apply Arch Linux patches.
	for upstream_patch in $srcdir/upstream_*.patch; do
		patch -Np1 -i "$upstream_patch"
	done

	# Apply this patch.
	patch -p 0 -i "$srcdir/like-ultimate5.patch"
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
