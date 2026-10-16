# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=dncdbg
pkgver=1.3.0
pkgrel=1
pkgdesc='Managed-code debugger for .NET applications with DAP support'
url='https://github.com/viewizard/dncdbg'
license=('MIT')
arch=('x86_64')
depends=(glibc gcc-libs)
makedepends=(cmake ninja clang llvm)

source=("$pkgname-$pkgver.tar.gz::https://github.com/viewizard/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('c4eb2fa30315c22f546876321d1821a5ce5aac15cbca75499663a23824d779c1')

build() {
    local cmake_options=(
        -G Ninja
        -DCMAKE_C_COMPILER=clang
        -DCMAKE_CXX_COMPILER=clang++
        -DCMAKE_BUILD_TYPE=None
        -DCMAKE_INSTALL_PREFIX=/opt/dncdbg
        -B build
        -S "$pkgname-$pkgver"
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -d "$pkgdir/usr/bin"
    ln -s /opt/dncdbg/dncdbg "$pkgdir/usr/bin"
    install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
