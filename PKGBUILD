# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=TermOx
pkgname=cppurses
pkgver=0.4
pkgrel=1
pkgdesc="C++14 Terminal User Interface framework with NCurses."
arch=('x86_64')
url="https://github.com/a-n-t-h-o-n-y/CPPurses"
license=('custom:MIT')
depends=()
makedepends=('ncurses' 'cmake' 'git')
source=("${url}/archive/v$pkgver.tar.gz" "patch")
sha256sums=('b22e30079407226f0e99c20e17e64f98a3d5853726162440035c3703184a2b5b'
            '1455912434b271fe685a5174efd773845a7aec9ff72ed552eb7fb3262c4fc9d5')

prepare() {
    cd "$_pkgname-$pkgver"
    git clone https://github.com/a-n-t-h-o-n-y/signals-light external/signals-light
    # just delete tests
    sed -i '27,31d' external/signals-light/CMakeLists.txt
    patch -Np1 < ../patch

    cmake -H. -Bbuild \
      -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
      -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
    cd "$_pkgname-$pkgver"
    cmake --build build
}

check() {
    cd "$_pkgname-$pkgver"
    # no tests atm
    # cmake --build build -- check
}

package() {
    cd "$_pkgname-$pkgver"
    # install is broken so quick and dirty copy
    cmake --build build -- DESTDIR="$pkgdir/" install
    mkdir -p "$pkgdir/usr/include/termox"
    cp -r include/termox "$pkgdir/usr/include/"
    install -Dm755 build/src/libTermOx.a  -t "$pkgdir/usr/lib"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set softtabstop=4 shiftwidth=4 expandtab:
