# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
# Contributor: Sławomir Śpiewak <slawekwaga at gmail dot com>
pkgname=dynamorio
pkgdesc="A dynamic instrumentation tool platform"
pkgver=11.3.0_1
pkgrel=1
arch=('x86_64')
url="https://github.com/DynamoRIO/dynamorio"
license=('BSD' 'custom:libelftc' 'LGPL2.1')
groups=()
depends=('gcc-libs' 'zlib' 'libunwind' 'snappy' 'lz4' 'perl' 'qt5-base' 'python')
makedepends=('git' 'cmake' 'doxygen')
options=(!strip !lto)

source=(
    "${pkgname}::git+${url}.git#tag=release_${pkgver//_/-}"
    "git+https://github.com/intel/libipt.git"
    "git+https://github.com/madler/zlib.git"
    "gcc.patch"
)
sha256sums=('18e9f70ea76dbeee0b118d3d3e47228ca3529c9e031cfe3d01a1bb8f848a1736'
    'SKIP'
    'SKIP'
    '13a03a2e6d2d2bd79d261e778c276e2cd27a98815d0a8e41633ef207aa6860b1')

prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.third_party/libipt.url "$srcdir/libipt"
    git config submodule.third_party/zlib.url "$srcdir/zlib"
    git -c protocol.file.allow=always submodule update

    git config user.name "aur"
    git config user.email "aur@example.com"
    # i#1558: Use new behavior of CMP0043 in drgui (#7489)
    git cherry-pick d746e04
    # i#7514: Fix doxygen tags in aarch64_far.dox. (#7515)
    git cherry-pick c0c148c
    # i#7493 GCC-15: Specify language dialet when checking type existence
    git am "$srcdir/gcc.patch"
}

build() {
    cmake -B build-debug -S "${srcdir}/${pkgname}" \
        -DDEBUG=ON \
        -DCMAKE_INSTALL_PREFIX="/opt/${pkgname}"

    cmake --build build-debug

    cmake -B build-release -S "${srcdir}/${pkgname}" \
        -DCMAKE_INSTALL_PREFIX="/opt/${pkgname}"

    cmake --build build-release
}

package() {
    DESTDIR="$pkgdir" cmake --install build-debug
    DESTDIR="$pkgdir" cmake --install build-release
    install -Dm644 ${srcdir}/${pkgname}/License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
