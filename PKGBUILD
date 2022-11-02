# Maintainer: Laurenz <lldb-mi-git@laure.nz>
pkgname=lldb-mi-git
pkgver=r83.2388bd7
pkgrel=1
pkgdesc="LLDB's machine interface driver"
arch=('any')
url="https://github.com/lldb-tools/lldb-mi"
license=('Apache')
depends=('lldb' 'llvm')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lldb-tools/lldb-mi.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake \
        -B build \
        -S "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        ..
    make \
        -j \
        -C build
}

package() {
    make \
        -C build \
        DESTDIR="$pkgdir" \
        install
}
