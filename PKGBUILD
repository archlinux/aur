# Maintainer: Joshua Barrett <jjbarr.public@gmail.com>
pkgname=bpf-unknown-none-binutils
pkgver=2.43
pkgrel=1
pkgdesc="binutils for Linux eBPF"
arch=('x86_64')
url="http://www.gnu.org/software/binutils"
license=(GPL-2.0-or-later GPL-3.0-or-later LGPL-2.0-or-later LGPL-3.0-or-later GFDL-1.3-only FSFAP)
groups=()
depends=(
  glibc
  zlib
  zstd
)
options=('!libtool' '!emptydirs')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F')  # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.gz"{,.sig})
sha512sums=('27a19e23b2e8be9994f13687a6e0d6fd6db58f2013d4fd7b1c7f098069fbbee59e6500de4ea16b2218df5f23861f7925472081c3baec7a98533431c2d522c7b1'
            'SKIP')

_target="bpf-unknown-none"

prepare() {
  cd "$srcdir"/binutils-${pkgver}
  #do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in
}

build() {
  echo "Building ${_target} cross binutils"
  mkdir -p "$srcdir"/binutils-${_target} && cd "${srcdir}/binutils-${_target}"
  "$srcdir"/binutils-${pkgver}/configure --prefix=/usr \
      --target=${_target} \
      --infodir=/usr/share/info/${_target} \
      --enable-lto --enable-plugins \
      --enable-deterministic-archives \
      --disable-multilib --disable-nls \
      --disable-werror
  make -O
}

package() {
  echo "Installing ${_target} cross binutils"
  cd "$srcdir"/binutils-${_target}
  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so
}
