# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=cpp-taskflow-git
_pkgname="${pkgname%-git}"
pkgver=r410.666d897
pkgrel=1
pkgdesc="Fast C++ Parallel Programming with Task Dependencies"
arch=('any')
url="https://github.com/cpp-taskflow/cpp-taskflow"
license=('MIT')
makedepends=('cmake' 'git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"
    echo "install(FILES taskflow/taskflow.hpp DESTINATION include)" >> CMakeLists.txt

    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
}

build() {
    cd "${_pkgname}"
    cmake --build build
}

check() {
    cd "${_pkgname}"
    cmake --build build -- test
}

package() {
    cd "${_pkgname}"
    cmake --build build -- DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
