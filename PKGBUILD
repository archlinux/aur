# Maintainer: taotieren <admin@taotieren.com>

pkgname=systemrdl-toolkit
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="A pure C++ toolkit for parsing and elaborating SystemRDL files"
arch=($CARCH)
url="https://github.com/vowstar/systemrdl-toolkit"
license=('MIT')
groups=()
depends=(
    antlr4-runtime
    glibc
    libgcc
    libstdc++
)
makedepends=(
    cmake
    ninja
    git
    nlohmann-json
    inja
    pkgconf
)
optdepends=(

)
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('baf5dc6d7566750f3c05944f09ba281eb6d1ff43ae5262910878cfcf351da38b')
validpgpkeys=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D SYSTEMRDL_MAIN_PROJECT=ON \
        -D USE_SYSTEM_ANTLR4=ON \
        -D USE_SYSTEM_NLOHMANN_JSON=ON \
        -D USE_SYSTEM_INJA=ON \
        -D SYSTEMRDL_BUILD_STATIC=OFF \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
