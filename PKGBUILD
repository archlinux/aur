# Maintainer: Dani Rodríguez <dani@danirod.es>
# Contributor: c0repwn3r <core@coredoes.dev>
pkgname=i386-elf-binutils
pkgver=2.47
pkgrel=1
epoch=
pkgdesc="GNU binutils for the i386- toolchain"
arch=(x86_64)
url="https://www.gnu.org/software/binutils"
license=('GPL')
groups=(i386-elf-toolchain)
makedepends=(gcc)
depends=(xz)
source=("http://ftpmirror.gnu.org/binutils/binutils-$pkgver.tar.xz")
sha512sums=("3126a1064374d8da40d4d70630c204ed1e75d542c447d53fca9778c7ceff095c28e9b445e15a313fef9729082d7966471ee6b5b715d479aa6d568528743e1d98")

build() {
    # Create temporary build dir
    mkdir -p "i386-binutils-$pkgver-build"
    cd "i386-binutils-$pkgver-build"

    # Configure, we are building in seperate directory to cleanly seperate the binaries from the source
    ../binutils-$pkgver/configure --prefix=/usr --target=i386-elf --disable-nls --disable-werror --disable-multilib --enable-interwork

    # Build
    make
}

check() {
    cd "i386-binutils-$pkgver-build"

    # unset LDFLAGS as testsuite makes assumptions about which ones are active
    # ignore failures in gold testsuite...
    make -k LDFLAGS="" check
}

package() {
    cd "i386-binutils-$pkgver-build"
    make install DESTDIR=$pkgdir
    # Remove conflicting files
    rm -rf $pkgdir/usr/share/info
    rm -rf $pkgdir/usr/lib/bfd-plugins
}
