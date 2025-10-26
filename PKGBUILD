# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>

pkgname=x86_64-kuznix-elf-binutils
pkgver=2.45
pkgrel=1
pkgdesc="GNU Binutils for the x86_64-kuznix-elf cross toolchain"
arch=('x86_64')
url="https://www.gnu.org/software/binutils/"
license=('GPL3')
depends=('glibc' 'zlib')
makedepends=('gcc' 'make' 'texinfo')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://ftp.icm.edu.pl/pub/gnu/binutils/binutils-${pkgver}.tar.xz")
sha256sums=('SKIP')

_target=x86_64-kuznix-elf
_prefix=/opt/kuznix-tools

build() {
  cd "$srcdir"
  rm -rf build-binutils
  mkdir build-binutils && cd build-binutils

  ../binutils-${pkgver}/configure \
    --target=${_target} \
    --prefix=${_prefix} \
    --with-sysroot \
    --disable-nls \
    --disable-werror

  make
}

package() {
  cd "$srcdir/build-binutils"
  make DESTDIR="$pkgdir" install

  # Add environment setup for convenience
  install -Dm644 /dev/stdin "$pkgdir/etc/profile.d/${_target}.sh" <<EOF
export PATH=${_prefix}/bin:\$PATH
EOF
}
