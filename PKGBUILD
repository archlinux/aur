# maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=nthash-bcgsc
_pkgname=ntHash
pkgver=2.3.0
pkgrel=3
pkgdesc="Fast hash function for DNA/RNA sequences. https://doi.org/10.1093/bioinformatics/btac564"
arch=('x86_64')
url="https://bcgsc.github.io/ntHash/"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib' 'zstd')
makedepends=('cmake' 'btllib' 'argparse')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bcgsc/ntHash/archive/refs/tags/v${pkgver}.tar.gz"
        "cmake.patch")
sha256sums=('3115e140b50c9153c373e3a718d8e538e96724655caea7ed1bd2af1ef46f93da'
            'dc38bef6af5497c79bec273539d511f49eba69e3dec72a299def3d5d9d530f7d')

prepare(){
    cd "$_pkgname-$pkgver"
    patch -p1 < "${srcdir}"/cmake.patch
}
build() {
    cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    MAKEFLAGS=-j1 cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    install -Dm644 "$_pkgname-$pkgver"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 ${srcdir}/build/nthash "${pkgdir}"/usr/bin/nthash
    install -Dm644 ${srcdir}/build/libnthash.a "${pkgdir}"/usr/lib/libnthash.a

    for file in "${_pkgname}-${pkgver}"/include/nthash/*.hpp ; do
        install -Dm644 "${file}" "${pkgdir}"/usr/include/${pkgname}/"${file}"
    done
}
  
