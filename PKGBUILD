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
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-cell-balancer
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-clock
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-controller-agent
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-discovery
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-exec
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-http-proxy
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-job-proxy
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-master
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-master-cache
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-node
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-proxy
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-scheduler
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-tablet-balancer
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-timestamp-provider
    ln -s $pkgdir/usr/bin/ytserver-all ytserver-tools
}
