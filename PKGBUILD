# Maintainer: Jacek Szafarkiewicz <szafar at linux dot pl>

pkgname=zlib-ng
pkgver=2.0.3
pkgrel=2
pkgdesc="zlib replacement with optimizations for \"next generation\" systems"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/zlib-ng/zlib-ng"
license=('zlib')
depends=( 'glibc' )
makedepends=('cmake')
provides=('zlib=1.2.11' 'zlib-ng')
conflicts=('zlib' 'zlib-ng' 'zlib-ng-git')
source=("https://github.com/zlib-ng/zlib-ng/archive/${pkgver//_/-}.zip")
sha256sums=("235232f622d17cb4070f67ebeb06b0df8cf0894f9045ea6c51782479318841d2")

build() {
    cmake \
         -S "zlib-ng-${pkgver//_/-}" \
         -B build \
         -Wno-dev \
         -DCMAKE_BUILD_TYPE=Release \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DZLIB_COMPAT=ON

    make -C build
}

check() {
    make -C build \
        test
}

package() {
    make -C build \
        install \
        DESTDIR="$pkgdir" \

    install -D -m644 "zlib-ng-${pkgver//_/-}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
