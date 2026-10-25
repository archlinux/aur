# Maintainer: taotieren <admin@taotieren.com>

pkgbase=sv-lang
pkgname=(sv-lang python-pysvlang)
pkgver=12.1
pkgrel=1
epoch=
pkgdesc="SystemVerilog compiler and language services"
arch=($CARCH)
url="https://github.com/MikePopoloski/slang"
license=('MIT')
groups=()
depends=(
    glibc
    libgcc
    libstdc++
)
makedepends=(
    cmake
    boost
    ninja
    fmt
    git
    mimalloc
    pkgconf
    vulkan-headers

    catch2
    pybind11
    nanobind
    python-scikit-build-core
    python-build
    python-installer
    python-wheel
    python-setuptools
    # AUR
    python-nanobind-backend
    python-pybind11-stubgen
)
optdepends=()
checkdepends=()
optdepends=()
options=()
install=
changelog=
source=("${pkgbase}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('12a68c35932f43120b58495271ab79ed2f4b3cff48e306a3fcf5e5eae2c5d825')
validpgpkeys=()

prepare() {
    git -C "${srcdir}/${pkgbase}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgbase}"

    cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D BUILD_SHARED_LIBS=ON \
        -D SLANG_USE_MIMALLOC=OFF \
        -B build \
        -G Ninja

    ninja -C build

    python -m build --wheel --no-isolation
}

package_sv-lang() {
    provides=(${pkgname})
    conflicts=(${pkgname})
    replaces=()
    backup=()
    cd "${srcdir}/${pkgbase}"
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase}/build install
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
    install -Dm644 LICENSES/* -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSES
}

package_python-pysvlang() {
    pkgdesc="Python bindings for slang, a library for compiling SystemVerilog"
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends+=(
        python
    )
    cd "${srcdir}/${pkgbase}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
    install -Dm644 LICENSES/* -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSES
}
