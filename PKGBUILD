# Maintainer: Matt Taylor <64.delta@proton.me>
pkgname=mlibc
pkgver=4.0.0_rc1
pkgrel=2
pkgdesc="A portable C standard library"
arch=($CARCH)
url="https://github.com/managarm/mlibc"
license=('MIT')
groups=()
depends=()
makedepends=(
  binutils
  gcc
  git
  libisl
  libmpc
  libxcrypt
  meson
  ninja
  python
  zstd
)
checkdepends=('meson' 'ninja')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(staticlibs)
install=
changelog=
GCCVER=13.2.3
BINUTILSVER=2.40
LINUXVER=6.7.6
source=("${pkgname}-4.0.0.tar.gz::https://github.com/managarm/mlibc/archive/refs/tags/4.0.0-rc1.tar.gz"
        "gcc-managarm-$GCCVER.tar.gz::https://github.com/managarm/gcc/archive/refs/tags/managarm/gcc-$GCCVER.tar.gz"
        "binutils-managarm-$BINUTILSVER.tar.gz::https://github.com/managarm/binutils-gdb/archive/refs/tags/managarm/binutils-2_40_2.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$LINUXVER.tar.xz"
        "config.sub::https://git.savannah.gnu.org/cgit/config.git/plain/config.sub?id=948ae97ca5703224bd3eada06b7a69f40dd15a02")
noextract=()
md5sums=('3c41fea991ff084f2df7cad8ae0c5363'
         'b6d5828e1392c9e84fb86fb2735c5fd8'
         'd277da5a45da1e0323f1e4eb571f8f53'
         '8b4a23ce33184bcd4e9c4b9ff0e5ddb0'
         'e14e81807d4870d70f29ec131aed4ab2')
validpgpkeys=()

# We can't use the linux-headers package, because it installs to /usr/include (and including that during the
# mlibc build will include all other system headers). We'll install our own kernel headers instead.
sysroot_install_linux_headers() {
	make -C linux-$LINUXVER headers_install INSTALL_HDR_PATH=$SYSROOT/usr
}

sysroot_install_mlibc() {
	cd "$pkgname-4.0.0-rc1"

	# The default flags include -fexceptions which requires libgcc.
	CFLAGS=${CFLAGS//"-fexceptions"}
	CXXFLAGS=${CXXFLAGS//"-fexceptions"}

	# The default LDFLAGS includes -z,now which we don't support.
	LDFLAGS=${LDFLAGS//",-z,now"}

	# Install mlibc into sysroot
	meson --prefix=/usr -Dlinux_kernel_headers=$SYSROOT/usr/include -Dbuildtype=release -Ddefault_library=both build
	DESTDIR="$SYSROOT" ninja -C build install

	# This mlibc-gcc uses a specs file to wrap the host's one. It's a hack, we don't use it.
	rm $SYSROOT/usr/bin/mlibc-gcc $SYSROOT/usr/lib/mlibc-gcc.specs

	cd ../
}

build_gcc_and_binutils() {
	# Combined tree build!
	# https://gcc.gnu.org/wiki/Building_Cross_Toolchains_with_gcc
	# Unpacking binutils over gcc works but not the other way around...
	SRCDIR="binutils-gdb-managarm-binutils-2_40_2"
	# cp -R "binutils-gdb-managarm-binutils-2_40_2"/* "gcc-managarm-gcc-$GCCVER/"
	cp -R "gcc-managarm-gcc-$GCCVER/"* $SRCDIR

	# Copy a newer config.sub that knows about mlibc
	cp ../config.sub "$SRCDIR"

	mkdir -p build-mlibc
	cd build-mlibc

	# Copied from gcc-git AUR package
	CFLAGS=${CFLAGS/-Werror=format-security/}
	CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

	# TODO: relative paths in --with-build-sysroot do not work, this causes warnings since the absolute path references $srcdir.
	# --with-build-sysroot=$(realpath --relative-to . $SYSROOT)
	../$SRCDIR/configure \
		--target=$CARCH-linux-mlibc \
		--prefix=/usr \
		--with-sysroot=/usr/share/mlibc-sysroot \
		--with-build-sysroot=$SYSROOT \
		--enable-languages=c,c++,lto \
		--enable-initfini-array \
		--disable-multilib \
		--disable-shared \
		--disable-nls \
		--disable-libstdcxx-hosted \
		--disable-libstdcxx-backtrace \
		--disable-wchar_t \
		--disable-{libssp,libsanitizer,libquadmath,gdb,gold,gprof,gprofng} \
		--disable-{libdecnmumber,readline,sim,libctf,libgomp,libatomic} \
		--disable-{libffi,libitm,libvtv} \
		--disable-werror
	make
	DESTDIR="$SYSROOT" make install

	cd ../
}

build() {
	mkdir -p mlibc-sysroot/usr
	SYSROOT=$(realpath mlibc-sysroot)

	sysroot_install_linux_headers
	sysroot_install_mlibc
	build_gcc_and_binutils
}

check() {
	important_binaries=("ld" "gcc" "g++")
	for bin in "${important_binaries[@]}"; do
		file="$SYSROOT/usr/bin/$CARCH-linux-mlibc-$bin"
		echo "Checking that $file exists..."
		test -f $file
	done
}

package() {
	SYSROOT=$(realpath mlibc-sysroot)
	PREFIX=/usr/share/mlibc-sysroot/usr

	mkdir -p "$pkgdir/usr/share"
	cp -R "$SYSROOT" "$pkgdir/usr/share/"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "$PREFIX/bin/$CARCH-linux-mlibc-gcc" "$pkgdir/usr/bin/mlibc-gcc"
	ln -s "$PREFIX/bin/$CARCH-linux-mlibc-g++" "$pkgdir/usr/bin/mlibc-g++"

	install -Dm644 "./$pkgname-4.0.0-rc1/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
