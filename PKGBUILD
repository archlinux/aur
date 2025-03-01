# Maintainer: taotieren <admin@taotieren.com>

pkgbase=canopenlinux-git
pkgname=canopenlinux-git
pkgver=4.0.r23.g52ffe7a
pkgrel=1
groups=()
pkgdesc="CANopenNode on Linux devices"
arch=($CARCH)
url="https://github.com/CANopenNode/CANopenLinux"
license=('Apache-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(glibc)
makedepends=(
    git
    doxygen)
optdepends=(
    "can-utils: Linux-CAN / SocketCAN user space applications"
    "can-doc: Linux-CAN / SocketCAN documentation"
    "iproute2: IP Routing Utilities")
source=("${pkgname}::git+${url}.git"
    "git+https://github.com/CANopenNode/CANopenNode.git")
sha256sums=('SKIP'
    'SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.CANopenNode.url "$srcdir/CANopenNode"
    git -c protocol.file.allow=always submodule update
}

build() {
    make -C $pkgname PREFIX=/usr
    make -C $pkgname/cocomm PREFIX=/usr
    cd "${srcdir}/${pkgname}"
    doxygen
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm0755 canopend -t "$pkgdir/usr/bin"
    install -Dm0755 cocomm/cocomm -t "$pkgdir/usr/bin"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/${pkgname%-git}.md"
    install -Dm0644 cocomm/README.md "$pkgdir/usr/share/doc/${pkgname%-git}/cocomm.md"
    cp -rva html "$pkgdir/usr/share/doc/${pkgname%-git}/"
}
