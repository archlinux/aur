# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='libdecaf'
pkgver='1.0.2'
pkgrel=5
pkgdesc="A 448-bit Edwards curve"
url="https://sourceforge.net/projects/ed448goldilocks/"
depends=('glibc')
makedepends=('cmake' 'git' 'python')
license=('MIT')
arch=('x86_64')
source=("${pkgname}::git://git.code.sf.net/p/ed448goldilocks/code#commit=e5cc62")
sha256sums=('9cb125750d64bc46fdbe75ff57993a36410d245a369b1ce76ae673c6df7efc51')

build() {
    cmake -B build -S "${pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_STATIC=OFF \
    -DENABLE_TESTS=ON \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_C_FLAGS="-Wno-sizeof-array-div -Wno-array-parameter" \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -Wno-dev
    make -C build
}

package() {
    make DESTDIR="${pkgdir}" -C build install
    install -D -m644 "${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}

check() {
    make -C build test
}
