# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=dncdbg-git
_name=${pkgname%-git}
pkgver=1.2.0.r262.gdf46c2c
pkgrel=1
pkgdesc='Managed-code debugger for .NET applications with DAP support'
url='https://github.com/viewizard/dncdbg'
license=('MIT')
arch=('x86_64')
provides=('dncdbg')
conflicts=('dncdbg')
depends=(glibc gcc-libs)
makedepends=(cmake ninja clang llvm)

source=("git+https://github.com/viewizard/$_name.git")

sha256sums=('SKIP')

pkgver() {
    cd "$_name"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    local cmake_options=(
        -G Ninja
        -DCMAKE_C_COMPILER=clang
        -DCMAKE_CXX_COMPILER=clang++
        -DCMAKE_BUILD_TYPE=None
        -DCMAKE_INSTALL_PREFIX=/opt/dncdbg
        -B build
        -S "$_name"
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -d "$pkgdir/usr/bin"
    ln -s /opt/dncdbg/dncdbg "$pkgdir/usr/bin"
    install -Dm644 "$_name/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
