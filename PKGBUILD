# Maintainer: malucart <malucart_at_outlook_dot_com>

# to some extent based on https://aur.archlinux.org/packages/mipsel-elf-binutils

target_="mipsel-none-elf"
sysroot_="/usr/lib/${target_}"

pkgname=${target_}-binutils-git
pkgver=15.branchpoint.r1664.5ca6fa33e
pkgrel=1
pkgdesc="Up-to-date binutils for baremetal MIPS"
arch=('x86_64')
url="https://www.gnu.org/software/binutils"
license=('GPL-3.0-or-later AND GFDL-1.3-no-invariants-or-later AND FSFAP')
groups=()
depends=(glibc zstd libelf bison flex)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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
			--origin=origin git://sourceware.org/git/binutils-gdb.git "$srcdir/${pkgname%-git}"
	fi
}

pkgver() {
	fetch
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')" | sed -E 's/(.+\/)?gdb.//'
}

prepare() {
	fetch
	cd "$srcdir/${pkgname%-git}"
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p binutils-build && cd binutils-build
	# Extract the FSF All Permissive License
	# <https://www.gnu.org/prep/maintain/html_node/License-Notices-for-Other-Files.html>
	# used for some linker scripts.
	tail -n 5 ../ld/scripttempl/README >FSFAP
	../configure \
		--prefix=${sysroot_} --infodir=/usr/share/info/${target_} --bindir=/usr/bin \
		--target="${target_}" --build="$CHOST" --host="$CHOST" \
		--disable-werror \
		--disable-nls \
		--with-gcc --with-gnu-as --with-gnu-ld \
		--without-included-gettext \
		--disable-win32-registry
	make -j$(nproc)
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cd binutils-build
	make DESTDIR="$pkgdir/" install
	# install FSF All Permissive License
	install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ FSFAP
}
