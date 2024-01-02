# Maintainer: taotieren <admin@taotieren.com>

pkgbase=hvml-fpm-git
pkgname=hvml-fpm-git
pkgver=r22.f030336
pkgrel=1
pkgdesc="The HVML FastCGI Process Manager: an HVML FastCGI implementation."
arch=(x86_64
    aarch64
    riscv64
    mips64
    powerpc
    powerpc64le)
url="https://github.com/HVML/HVML-FPM"
license=('LGPL-3.0')
groups=(hvml-git
    hybridos2-git)
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(glib2
    glibc
    purc)
makedepends=(
    ccache
    cmake
#     fcgi
    git
    ninja
    python
    zlib)
checkdepends=()
optdepends=('xguipro: xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit.')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"

# see：https://wiki.archlinux.org/title/CMake_package_guidelines
#     cmake -DCMAKE_BUILD_TYPE=Release \
# gcc build
    cmake -DCMAKE_BUILD_TYPE=None \
        -DPORT=Linux \
        -DENABLE_API_TESTS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSYSEXEC_INSTALL_DIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -B build \
        -G Ninja

    ninja -C build
}


# check() {
#     cd "${srcdir}/${pkgname}/build/bin/"
#     bash ./testexecutor
# }

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}
