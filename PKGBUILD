# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Maintainer: Peter Jung <admin@ptr1337.dev>

_srcname=virtme-ng
pkgname=$_srcname-git
pkgver=1.27.r16.g4290a32
pkgrel=1
pkgdesc="A tool that allows to easily and quickly recompile and test a Linux kernel, starting from the source code."
arch=('x86_64')
url="https://github.com/arighi/virtme-ng"
license=('GPL-2.0-only')
depends=(
  busybox
  coreutils
  gcc-libs
  glibc
  python
  python-requests
  qemu
  virtiofsd
)
makedepends=(
  cargo
  git
  python-argcomplete
  python-argparse-manpage
  python-setuptools
)
provides=('virtme=$pkgver')
conflicts=('virtme-ng')
source=("git+${url}.git"
        "git+https://github.com/arighi/virtme-ng-init.git")
b2sums=('SKIP'
        'SKIP')

pkgver() {
    cd "$srcdir/${_srcname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${_srcname}"
    git submodule update --init --filter=tree:0 --recursive
}

build() {
    cd "$srcdir/${_srcname}"
    export RUSTUP_TOOLCHAIN=stable
    BUILD_VIRTME_NG_INIT=1 python setup.py build
}

package() {
    cd "$srcdir/$_srcname"
    python setup.py install --root="$pkgdir/" --optimize=1
}
