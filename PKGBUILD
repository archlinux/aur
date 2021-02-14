# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=abseil-cpp-git
_pkgname="${pkgname%-git}"
pkgver=r673.143a2780
pkgrel=2
pkgdesc='An open-source collection of C++ code to augment the C++ standard library'
arch=('x86_64' 'i686' 'arm' 'aarch64' 'ppc')
url='https://github.com/abseil/abseil-cpp'
license=('Apache')
makedepends=('cmake' 'git')
conflicts=(abseil-cpp)
provides=(abseil-cpp)
source=('git+https://github.com/abseil/abseil-cpp.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_STANDARD=17 \
        -DABSL_USE_GOOGLETEST_HEAD=OFF \
        -DABSL_RUN_TESTS=OFF \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}

build() {
    cd "$_pkgname"
    cmake --build build
}

# check() {
#     cd "$_pkgname"
#     cmake --build build -- test
# }

package() {
    cd "$_pkgname"
    cmake --build build -- DESTDIR="$pkgdir" install
}
