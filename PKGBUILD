# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Maintainer: Peter Jung <admin@ptr1337.dev>

_srcname=virtme-ng
pkgname=$_srcname-git
pkgver=1.39.r4.g9119b0f
pkgrel=1
pkgdesc="A tool that allows to easily and quickly recompile and test a Linux kernel, starting from the source code."
arch=('x86_64')
url="https://github.com/arighi/virtme-ng"
license=('GPL-2.0-only')
depends=(
  bash
  busybox
  coreutils
  gcc-libs
  glibc
  "python>=3.10"
  python-argcomplete
  python-argparse-manpage
  python-requests
  python-setuptools
  qemu
  virtiofsd
)
makedepends=(
  cargo
  git
  python-build
  python-installer
  python-wheel
)
optdepends=(
    "python-anyio: AnyIO support"
    "python-mcp: Model Context Protocol (MCP) server support"
)
provides=('virtme=$pkgver')
conflicts=('virtme-ng' 'virtme-git')
source=("git+${url}.git"
        "git+https://github.com/arighi/virtme-ng-init.git")
b2sums=('SKIP'
        'SKIP')

pkgver() {
    cd "$srcdir/${_srcname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "$srcdir/$_srcname" clean -dfx
    cd "$srcdir/${_srcname}"
    git submodule update --init --filter=tree:0 --recursive
}

build() {
    cd "$srcdir/${_srcname}"
    export RUSTUP_TOOLCHAIN=stable
    BUILD_VIRTME_NG_INIT=1 python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_srcname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
