# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=porto
pkgver=5.3.15
pkgrel=1
pkgdesc='Yet another Linux container management system'
arch=('x86_64')
url='https://github.com/yandex/porto'
license=('GPL')
provides=('porto' 'python-portopy')
depends=('protobuf' 'ncurses' 'libnl' 'python')
makedepends=('cmake' 'go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/yandex/porto/archive/refs/tags/v5.3.15.tar.gz"
        "$pkgname.install"
        "$pkgname.service"
        "$pkgname.sysusers"
        "CMakeLists.txt.patch"
        "src-CMakeLists.txt.patch"
        "src-api-python-CMakeLists.txt.patch"
        "src-filesystem.cpp.patch"
        "src-util-path.hpp.patch")
sha256sums=('b28e0e73d315f920a4aec248accc618782ce728441e6bc028954f76ffd26327a'
            'e3ff30f487e4e31dad6193ae4ef74fb2f38235bab98d75d1c0bfcb04d185724b'
            '5e54ae64ecfa767b340768ff51c87dbd4667780f4a5418a2792baf84b3244448'
            'f073606b50e1466f41483e08d1e01456e94795da207e9b82d1152609516a25d5'
            '0d60c7d201e6713c0d5ff23ecf91f9859d69656a57426913395ce04fcaae34c4'
            '5b7df360d866e336c7057bd8ce0432b1eca925ad0be0a223bd338e4345703d58'
            '78b57a0db1a3b0696e14f8c6c79fafb108f254c14ab9efa09c25915c60d33c86'
            '98ffb246cf5185c9b36c8c6a94cdc9d331c6344c4e86baa9f9ca19bd5b6d6a83'
            'cb54ba90cf65df32f11246fa0b6495c9d01f7d74d74d9ebbe3274c7391cdbd22')
install=porto.install

prepare() {
    cd $pkgname-$pkgver
    patch -Z -p0 < ../CMakeLists.txt.patch
    patch -Z -p0 < ../src-CMakeLists.txt.patch
    patch -Z -p0 < ../src-api-python-CMakeLists.txt.patch
    patch -Z -p0 < ../src-filesystem.cpp.patch
    patch -Z -p0 < ../src-util-path.hpp.patch
}

build() {
    cd $srcdir/$pkgname-$pkgver
    cmake -S . -B build/release -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
        -DENABLE_PORTODSHIM=OFF
    cmake --build build/release

    cd $srcdir/$pkgname-$pkgver/portodshim
    go build -o ../build/release/portodshim .

    cd $srcdir/$pkgname-$pkgver/src/api/python
    python -m build -n -w
}

package() {
    cd $pkgname-$pkgver
    cmake --install build/release --prefix=$pkgdir/usr

    # Install portodshim manually.
    install -Dm755 \
        "build/release/portodshim" \
        "$pkgdir/usr/sbin/portodshim"

    # Install Python package manually.
    rm -rf $pkgdir/usr/lib/python*
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $srcdir/$pkgname-$pkgver/src/api/python/dist/portopy-*.whl

    # Install bash completion
    install -Dm644 \
        "debian/bash-completion.portoctl" \
        "$pkgdir/usr/share/bash-completion/completions/portoctl"

    install -Dm644 \
        "debian/bash-completion.portod" \
        "$pkgdir/usr/share/bash-completion/completions/portod"

    # Add porto group
    install -Dm644 \
        "$srcdir/$pkgname.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

    # Install portod as systemd service.
    install -Dm644 \
        "$srcdir/$pkgname.service" \
        "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
