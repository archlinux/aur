# Maintainer: taotieren <admin@taotieren.com>

pkgname=qschematic
pkgver=3.0.2
pkgrel=1
epoch=
pkgdesc="A library that allows creating diagrams such as flowcharts or even proper engineering schematics within a Qt application"
arch=($CARCH)
url="https://github.com/simulton/QSchematic"
license=('MIT')
_qt=qt6
groups=()
depends=(
    glibc
    libgcc
    libstdc++
    $_qt-base
    # AUR
    gpds
)
makedepends=(
    cmake
    ninja
    git
    $_qt-tools
    pkgconf
    vulkan-headers 
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
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
noextract=()
sha256sums=('a9e8860b9c026d8e6715c4b127e334f4fe5404df17b45beece20140830b3699c')
validpgpkeys=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D QSCHEMATIC_BUILD_STATIC=OFF \
        -D QSCHEMATIC_BUILD_DEMO=OFF \
        -D QSCHEMATIC_DEPENDENCY_GPDS_TARGET:STRING="gpds::gpds-shared" \
        -D QSCHEMATIC_DEPENDENCY_GPDS_DOWNLOAD=OFF \
        -D QSCHEMATIC_BUILD_SHARED=ON \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm644 license.txt -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
