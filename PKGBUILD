# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
#
# NOTE Please make sure you have at least 80Gb of free space.
pkgname=ytsaurus
pkgver=0.0.0.r65813.5b46de9
pkgrel=1
pkgdesc='A scalable and fault-tolerant open-source big data platform.'
arch=('x86_64')
url='https://ytsaurus.tech/'
license=('Apache')
groups=('yandex')
depends=()
makedepends=(
    'clang14'
    'cmake'
    'conan1'
    'libidn'
    'lld'
    'llvm14'
    'llvm14-libs'
    'ninja'
    'python'
    'python-dacite'
    'python-pip'
)
_commit=5b46de977a4d9298ab38ff332ae2bbb90d4d615b
source=("$pkgname-$pkgver.tar.gz::https://github.com/ytsaurus/ytsaurus/archive/$_commit.tar.gz"
        'clang.toolchain.diff')
sha256sums=('ef57ecf3c5dfe55c60fe26de9bff6e8b536cb9c5287636773fab33372ee44dc7'
            'SKIP')

prepare() {
    patch -p 1 -d $srcdir/ytsaurus-$_commit -i ../clang.toolchain.diff
}

build() {
    cd $srcdir/ytsaurus-$_commit
    cmake -S . -B build/release -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
        -DCMAKE_TOOLCHAIN_FILE=clang.toolchain
    cmake --build build/release -t ytserver-all
}

package() {
    install -Dm777 -t $pkgdir/usr/bin \
        $srcdir/ytsaurus-$_commit/build/release/yt/yt/server/all/ytserver-all

    # Statically linked binary which depends on its name.
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-cell-balancer
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-clock
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-controller-agent
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-discovery
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-exec
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-http-proxy
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-job-proxy
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-master
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-master-cache
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-node
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-proxy
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-scheduler
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-tablet-balancer
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-timestamp-provider
    ln -fs ytserver-all $pkgdir/usr/bin/ytserver-tools
}
