# Maintainer: Levi Zim (kxxt) <rsworktech@outlook.com>
pkgname=bpftool
pkgver=7.4.0
pkgrel=1
pkgdesc="tool for inspection and simple manipulation of eBPF programs and maps"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/libbpf/bpftool"
conflicts=('bpftool-bin' 'bpftool-git')
license=('GPL-2.0-only OR BSD-2-Clause')
depends=('libelf' 'zlib' 'llvm-libs' 'libcap')
makedepends=(git python-docutils clang llvm binutils)
optdepends=(
  #'binutils: for dumping JIT-compiled program instructions' Not working
  'clang: idem'
)
source=(
    # Source
    "git+${url}#tag=v$pkgver"
    "git+https://github.com/libbpf/libbpf.git"
)
b2sums=('f405655488f68e432836f6443d3cba2e738f15b70673f97a9d521e853ef7401e63073b429a274b874c978d415c2502a42e3e92c81162ccd40a233b8bdb10fc1d'
        'SKIP')
validpgpkeys=(
    '4A4DFD51EB67B2C7FE9F6E52057DE720301C09B6' # Quentin Monnet (Isovalent) <quentin@isovalent.com>
)

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.libbpf.url "$srcdir/libbpf"
  git -c protocol.file.allow=always submodule update
  # No sbin, please
  sed -i 's|/sbin|/bin|g' src/Makefile*
}

build() {
  # https://github.com/mlpack/mlpack/issues/574
  # CFLAGS+=" -DPACKAGE -DPACKAGE_VERSION"

	cd "$pkgname/src"
  make V=1 prefix=/usr

  # docs
  cd "../docs"
  make V=1 prefix=/usr mandir=/usr/share/man
}

package() {
  cd "$pkgname/src"
  make V=1 prefix=/usr DESTDIR="$pkgdir" install

  # docs
  cd "../docs"
  make V=1 prefix=/usr mandir=/usr/share/man DESTDIR="$pkgdir" install
}
