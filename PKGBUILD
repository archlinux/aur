# Maintainer: malucart <malucart_at_outlook_dot_com>

# to some extent based on https://aur.archlinux.org/packages/mipsel-elf-gcc

target_="mipsel-none-elf"

pkgname=${target_}-gcc-git
pkgver=15.r6562.f5351b38a8
pkgrel=1
pkgdesc="up-to-date GCC (C, C++) for baremetal MIPS"
arch=('x86_64')
url="https://www.gnu.org/software/gcc/"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=()
depends=("${target_}-binutils-git")
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=()
noextract=()
sha256sums=()

# since binutils and gcc are such massive repos, letting PKGBUILD use its normal
# git functionality would take way too long, so this command fetches sources
# and history without downloading unnecessary/outdated data
# it is not possible to simply clone with --depth 1 because that would not
# fetch tags and commits, which is needed for pkgver()
fetch() {
	mkdir -p $srcdir
	if [[ ! -d "$srcdir/${pkgname%-git}" ]] || dir_is_empty "$srcdir/${pkgname%-git}" ; then
		git clone -j4 --filter=blob:none --filter=tree:0 --single-branch --branch master \
			--origin=origin git://gcc.gnu.org/git/gcc.git "$srcdir/${pkgname%-git}"
	fi
}

pkgver() {
	fetch
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')" | sed -E 's/(.+\/)?gcc.//'
}

prepare() {
	fetch
	cd "$srcdir/${pkgname%-git}"
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
}

build() {
	cd "$srcdir/${pkgname%-git}"
	CFLAGS=${CFLAGS/-Werror=format-security/}
	CXXFLAGS=${CXXFLAGS/-Werror=format-security/}
	rm -rf gcc-build
	mkdir -p gcc-build && cd gcc-build
	../configure \
		--prefix=/usr --libexecdir=/usr/lib \
		--target="${target_}" \
		--with-newlib \
		--enable-fixed-point \
		--with-gnu-as --with-gnu-ld --with-as="/usr/bin/${target_}-as"\
		--disable-nls \
		--disable-gcov \
		--disable-decimal-float \
		--disable-threads \
		--disable-libatomic \
		--disable-libgomp \
		--disable-libquadmath \
		--disable-libssp \
		--disable-libvtv \
		--disable-hosted-libstdcxx \
		--enable-languages=c,c++ \
		--disable-multilib --disable-libgcj \
		--enable-lto --disable-werror \
		--without-headers --disable-shared \
		--enable-initfini-array
	make -j$(nproc)
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cd gcc-build
	make DESTDIR="$pkgdir" install

	find "$pkgdir/usr/lib/gcc/$target_/" \
		-type f -and \( -name \*.a -or -name \*.o \) \
		-exec "${target_}"-strip '{}' \;

	find "$pkgdir/usr/lib/gcc/$target_/" \
		-type f -and \( -name \*.a \) \
		-exec "${target_}"-ranlib '{}' \;

	find "$pkgdir/usr/bin/" "$pkgdir/usr/lib/gcc/$target_/" \
		-type f -and \( -executable \) -exec strip '{}' \;

	# remove unnecessary files
	rm -rf "$pkgdir/usr/share"
	rm "$pkgdir"/usr/lib/libcc1.*
}
