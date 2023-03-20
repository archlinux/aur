# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=ytsaurus
pkgver=0.0.0
pkgrel=2
pkgdesc="A scalable and fault-tolerant open-source big data platform."
arch=('x86_64')
url='https://ytsaurus.tech/'
license=('Yandex')
groups=('yandex')
depends=()
makedepends=(
    'cmake'
    'clang'
    'lld'
    'lldb'
    'conan1'
    'python'
    'python-pip'
    'ninja'
    'libidn'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ytsaurus/ytsaurus/archive/refs/heads/main.tar.gz"
        'clang.toolchain.patch')
sha256sums=('dca3af5d65bee2c4cef10cc18094b6f82d95b2a528f26382f9bf77862ee3b849'
            'SKIP')

prepare() {
	cd "$pkgname-main"
    patch < ../clang.toolchain.patch
}

build() {
	cd "$pkgname-main"
    cmake -S . -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
        -DCMAKE_TOOLCHAIN_FILE=clang.toolchain \
        -DCMAKE_C_COMPILER=/usr/bin/clang \
        -DCMAKE_CXX_COMPILER=/usr/bin/clang++
    cmake --build build
}

package() {
	cd "$pkgname-main"
    cmake --build build --prefix $pkgdir/usr
}
