# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ok-gloox-git
pkgname=ok-gloox-git
pkgver=r253.2c09c3c
pkgrel=1
arch=($CARCH)
pkgdesc="OkStar - OkGloox 对Gloox的拓展，上游主页：https://camaya.net/gloox"
_url="https://github.com/okstar-org"
url="${_url}/ok-gloox"
groups=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
license=('GPL-2.0-or-later')
depends=()
makedepends=(
    cmake
    gcc
    git
    ninja
    zlib
)
checkdepends=()
optdepends=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=()

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
}

build() {
    cd "${srcdir}/${pkgname}"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=OFF \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}
