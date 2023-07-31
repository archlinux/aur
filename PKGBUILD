# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
#
# NOTE Please make sure you have at least 80Gb of free space.
pkgbase=ytsaurus
pkgname=('ytsaurus' 'python-ytsaurus-client' 'python-ytsaurus-local'
         'python-ytsaurus-native-driver' 'python-ytsaurus-proto'
         'python-ytsaurus-rpc-driver' 'python-ytsaurus-yson')
pkgver=0.0.0.r65813.5b46de9
pkgrel=2
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
    'protobuf'
    'python'
    'python-dacite'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
_commit=5b46de977a4d9298ab38ff332ae2bbb90d4d615b
source=("$pkgname-$pkgver.tar.gz::https://github.com/ytsaurus/ytsaurus/archive/$_commit.tar.gz"
        'clang.toolchain.diff')
sha256sums=('ef57ecf3c5dfe55c60fe26de9bff6e8b536cb9c5287636773fab33372ee44dc7'
            'SKIP')

prepare() {
    export YTSAURUS_COMMIT_HASH=$_commit
    patch -p 1 -d $srcdir/ytsaurus-$_commit -i ../clang.toolchain.diff
}

build() {
    cd $srcdir/ytsaurus-$_commit
    cmake -S . -B build/release -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
        -DCMAKE_TOOLCHAIN_FILE=clang.toolchain

    # Build statically-linked YT server.
    cmake --build build/release -t ytserver-all

    # Build native python extensions.
    cmake --build build/release/ -t yson_lib -t driver_lib -t driver_rpc_lib

    # Make python wheels.'
    rm -rf build/release/ytsaurus-python
    mkdir -p build/release/ytsaurus-python
    PYTHONPATH=$PWD/yt/python/packages:$PWD \
    python3 -m yt_setup.generate_python_proto \
        --source-root . \
        --output build/release/ytsaurus-python

    PYTHONPATH=$PWD/yt/python/packages:$PWD \
    python3 -m yt_setup.prepare_python_modules \
        --source-root . \
        --build-root build/release \
        --output-path build/release/ytsaurus-python \
        --prepare-bindings-libraries

    cd build/release/ytsaurus-python

    for package in 'ytsaurus-native-driver' 'ytsaurus-yson'; do
        cp "$srcdir/ytsaurus-$_commit/yt/python/packages/${package}/setup.py" .
        PYTHONPATH=$srcdir/ytsaurus-$_commit/yt/python/packages:$PWD \
        python3 setup.py bdist_wheel \
            --dist-dir $srcdir/ytsaurus-$_commit/dist \
            --py-limited-api cp34
    done

    for package in 'ytsaurus-client' 'ytsaurus-local' 'ytsaurus-rpc-driver' 'ytsaurus-proto'; do
        cp "$srcdir/ytsaurus-$_commit/yt/python/packages/${package}/setup.py" .
        PYTHONPATH=$srcdir/ytsaurus-$_commit/yt/python/packages:$PWD \
        python3 setup.py bdist_wheel \
            --dist-dir $srcdir/ytsaurus-$_commit/dist \
            --universal
    done
}

package_ytsaurus() {
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

package_python-ytsaurus-client() {
    pkgdesc='Python client for YTsaurus system and miscellaneous libraries'
    arch=('any')
    groups=('yandex' 'ytsaurus')
    depends=(
        'python-argcomplete'
        'python-charset-normalizer'
        'python-decorator'
        'python-simplejson'
        'python-six'
        'python-tqdm'
        'python-typing-extensions'
    )

    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $pkgbase-$_commit/dist/ytsaurus_client-*.whl
}

package_python-ytsaurus-local() {
    pkgdesc='Python libraries and CLI to manage local YTsaurus instances'
    arch=('any')
    groups=('yandex' 'ytsaurus')
    depends=(
        'python-ytsaurus-client'
        'python-attrs'
    )

    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $pkgbase-$_commit/dist/ytsaurus_local-*.whl
}

package_python-ytsaurus-native-driver() {
    pkgdesc='Python bindings to YTsaurus driver'
    arch=('x86_64')
    groups=('yandex' 'ytsaurus')
    depends=('python')

    python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $pkgbase-$_commit/dist/ytsaurus_native_driver-*.whl
}

package_python-ytsaurus-proto() {
    pkgdesc='Python proto files for YT system'
    arch=('any')
    groups=('yandex' 'ytsaurus')
    depends=('python-protobuf')

    python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $pkgbase-$_commit/dist/yandex_yt_proto-*.whl
}

package_python-ytsaurus-rpc-driver() {
    pkgdesc='Python bindings to RPC driver for YT system'
    arch=('any')
    groups=('yandex' 'ytsaurus')
    depends=('python')

    python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $pkgbase-$_commit/dist/ytsaurus_rpc_driver-*.whl
}

package_python-ytsaurus-yson() {
    pkgdesc='Python bindings to YSON for YT system'
    arch=('x86_64')
    groups=('yandex' 'ytsaurus')
    depends=('ytsaurus-client')

    python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $pkgbase-$_commit/dist/ytsaurus_yson-*.whl
}
