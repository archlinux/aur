# Maintainer: c0repwn3r <core@coredoes.dev>
pkgname=i386-elf-gcc
pkgver=11.2.0
pkgrel=2
epoch=
pkgdesc="GNU gcc for the i386- toolchain"
arch=(x86_64)
url="https://www.gnu.org/software/gcc"
license=('GPL')
groups=(i386-elf-toolchain)
makedepends=(gmp mpfr gcc)
depends=(xz libmpc i386-elf-binutils)
source=(
    "http://ftpmirror.gnu.org/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz"
    "gcc11-Wno-format-security.patch" # https://bugs.archlinux.org/task/70701
)
sha256sums=(
    d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b
    6f9a34812a07e49a568467df11d6ab19b9fd7d953e9ecd739c7a38d9df821b52
)

build() {
    # Patch gcc
    cd "gcc-$pkgver"
    patch --strip=1 --input="$srcdir/gcc11-Wno-format-security.patch"
    cd ..
    # Create temporary build dir
    mkdir -p "i386-gcc-$pkgver-build"
    cd "i386-gcc-$pkgver-build"
    # Configure, we are building in seperate directory to cleanly seperate the binaries from the source
    ../gcc-$pkgver/configure \
	--prefix=/usr \
	--target=i386-elf \
	--disable-nls \
	--disable-werror \
	--disable-multilib \
	--without-headers \
	--enable-languages=c,c++ \
	--disable-build-format-warnings # https://bugs.archlinux.org/task/70701

    # Build
    make all-gcc
    make all-target-libgcc
}

package() {
    cd "i386-gcc-$pkgver-build"
    make install-gcc DESTDIR=$pkgdir
    make install-target-libgcc DESTDIR=$pkgdir
    # Remove conflicting files
    rm -rf $pkgdir/usr/share/info
    rm -rf $pkgdir/usr/share/man/man7
}
