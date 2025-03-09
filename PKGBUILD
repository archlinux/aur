# Maintainer: taotieren <admin@taotieren.com>

pkgname=proj2cmake-git
pkgver=r19.22a7e6b
pkgrel=11
pkgdesc="Convert an entire Visual Studio solution and all contained projects to CMake."
arch=($CARCH)
url="https://github.com/mrpi/proj2cmake"
license=('BSL-1.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=('boost-libs'
    'glibc'
    'gcc-libs')
makedepends=('cmake' 'boost' 'git')
backup=()
options=()
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd ${srcdir}/${pkgname}/

    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build
    make -C build
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/build/${pkgname%-git}" -t "${pkgdir}/usr/bin/"
}
