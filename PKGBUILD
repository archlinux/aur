# Maintainer: John Eivind Helset <private@jehelset.no>

pkgname=libassert
pkgver=2.2.1
pkgrel=2
pkgdesc="The most over-engineered C++ assertion library"
arch=(x86_64)
url="https://github.com/jeremy-rifkin/$pkgname"
license=(MIT)
depends=(cpptrace libcpptrace.so
         glibc
         libgcc libgcc_s.so
         libstdc++ libstdc++.so)
makedepends=(cmake
             git)
optdepends=('fmt: libfmt integration')
provides=(libassert.so)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('cba32ed0a8906d80d1fc4836b9afb2515a367d94d8364a1f513acb74cb4fd81f')

build() {
    local cmake_flags=(
        BUILD_SHARED_LIBS=On
        CMAKE_INSTALL_PREFIX="/usr"
        LIBASSERT_USE_EXTERNAL_CPPTRACE=On
    )
    cmake -B build -S "$pkgname" -W no-dev "${cmake_flags[@]/#/-D }"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$pkgname/LICENSE"
}
