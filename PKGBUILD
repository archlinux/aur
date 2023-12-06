# Maintainer: taotieren <admin@taotieren.com>

pkgname=yjson-git
pkgver=r73.a38e605
pkgrel=1
pkgdesc="YJson"
arch=('x86_64')
url="https://github.com/yjmthu/YJson"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=()
makedepends=(cmake
            git
            ninja
            qt6-tools)
backup=()
options=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
#     git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}/"

    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -Bbuild \
        -GNinja
#         \
#         -W no-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/$pkgname/build install
}
