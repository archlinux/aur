# Maintainer: evilichi <evilichi@disroot.org>

pkgname="opensd-git"
pkgver="git"
pkgrel=1
pkgdesc="An open-source Linux userspace driver for Valve's Steam Deck hardware."
arch=("x86_64")
url="https://codeberg.org/opensd/opensd"
license=("GPL3")
depends=("glibc" "gcc-libs" "linux-headers")
makedepends=("cmake" "git" "gcc")
source=("${pkgname}::git+https://codeberg.org/opensd/opensd.git")
sha256sums=("SKIP")
provides=("opensd=${pkgver}")
conflicts=("opensd")
install=opensd-git.install
options=()

pkgver() 
{
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build()
{
    cmake -S"${pkgname}" -Bbuild -DOPT_POSTINSTALL=FALSE -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check()
{
    cd "${srcdir}/build"
    ./opensdd --version
}

package()
{
    cd "${srcdir}/build"
    DESTDIR="${pkgdir}" cmake --build . --target install
}

