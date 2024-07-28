# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Maintainer: Peter Jung <admin@ptr1337.dev>

_srcname=virtme-ng
pkgname=$_srcname-git
pkgver=v1.25.r50.g599d8ba
pkgrel=1
pkgdesc="A tool that allows to easily and quickly recompile and test a Linux kernel, starting from the source code."
arch=('x86_64')
url="https://github.com/arighi/virtme-ng"
license=('GPL-2.0-only')
makedepends=('cargo' 'git')
depends=('bash' 'gcc-libs' 'glibc' 'python-argcomplete' 'python-importlib-metadata' 'python-requests' 'python-setuptools' 'python>=3.8' 'qemu>=1.6')
optdepends=('busybox: BusyBox support')
conflicts=('virtme-git' 'virtme-ng')
source=("git+${url}.git"
	"git+https://github.com/arighi/virtme-ng-init.git")
b2sums=('SKIP' 'SKIP')

prepare() {
    cd "$srcdir/${_srcname}"
    git submodule init
    git config submodule.virtme_ng_init.url "$srcdir/virtme-ng-init"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/${_srcname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    BUILD_VIRTME_NG_INIT=1 python setup.py build
}

package() {
    cd "$srcdir/$_srcname"
    python setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
    cd "$srcdir/${_srcname}"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
