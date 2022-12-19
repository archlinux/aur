# Maintainer: seek <seek@ntr0py.org>

pkgname="opensd-git"
pkgver="v0.47.r0.gc8fa41f"
pkgrel=1
pkgdesc="An open-source Linux userspace driver for Valve's Steam Deck hardware."
arch=("x86_64")
url="https://gitlab.com/open-sd/opensd"
license=("GPL3")
depends=("glibc" "gcc-libs" "linux-headers")
makedepends=("cmake" "git" "gcc")
source=("${pkgname}::git+https://gitlab.com/open-sd/opensd.git")
sha256sums=("SKIP")
provides=("opensd=${pkgver}")
conflicts=("opensd")
install=opensd-git.install
options=()

pkgver() 
{
    cd "${pkgname}"
    git describe --always --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

