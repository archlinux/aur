# Maintainer: taotieren <admin@taotieren.com>

pkgbase=can-tests-git
pkgname=can-tests-git
pkgver=2023.05.0.r5.g3258274
pkgrel=2
groups=()
pkgdesc="Linux-CAN / SocketCAN testing applications"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/linux-can/can-tests"
license=('GPLv2')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(glibc)
makedepends=(git)
optdepends=(
    "can-utils: Linux-CAN / SocketCAN user space applications"
    "can-doc: Linux-CAN / SocketCAN documentation"
    "can-isotp-dkms: Kernel modules for isotp")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//g' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    make -C $pkgname PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr DESTDIR="$pkgdir/" install

    cd "$pkgdir/usr/bin"
    mv canfdtest tst-canfdtest
    mv cansniffer tst-cansniffer
}
