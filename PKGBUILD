# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor: N/A

pkgname=ridl
pkgver="r39.508d549"
pkgrel=1
pkgdesc="A tool to check whether your system is affected by Micro-architectural Data Sampling and other attacks"
arch=('i686' 'x86_64')
url="https://github.com/vusec/ridl"
license=('MPL2')
makedepends=('cmake')
source=(
    "git+https://github.com/vusec/ridl"
)
sha512sums=(
    'SKIP'
)

prepare() {
    cd "${pkgname}"
    git submodule init
    git submodule update
}

# Support repositories that start without a tag but get tagged later on (uses
# a bashism):
# src.: https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
pkgver() {
    cd "${pkgname}"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname}"
    mkdir build
    cd build
    cmake ..
    make
}

package() {
    cd "${pkgname}/build"
    install -Dm755 mdstool-cli "${pkgdir}/usr/bin/mdstool-cli"
}

