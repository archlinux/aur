# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ruri-git
pkgname=ruri-git
pkgver=3.9.3.r45.g777e35f
pkgrel=1
pkgdesc="A zipped Linux container runtime that zips (Lightweight User-friendly Linux-container Implementation)"
arch=($CARCH)
url="https://github.com/RuriOSS/ruri"
license=('MIT')
groups=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    libcap
    libseccomp
)
makedepends=(
    cmake
    git
    ninja
)
checkdepends=(
)
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
    cd "${srcdir}/${pkgname}/"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -vDm644 ${srcdir}/${pkgname}/README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 ${srcdir}/${pkgname}/doc/* -t "${pkgdir}/usr/share/doc/${pkgname}/doc/"
    install -vDm0644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
