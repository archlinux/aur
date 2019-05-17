# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=sysrepo
pkgver=0.7.7
pkgrel=3
pkgdesc='YANG-based configuration and operational state data store for Unix/Linux applications'
depends=('libyang' 'protobuf-c' 'libev' 'libredblack' 'libssh')
optdepends=('netopeer2: for remote management via NETCONF')
makedepends=('gcc' 'make' 'cmake' 'pkgconf' 'doxygen' 'swig')
arch=('any')
url='http://www.sysrepo.org/'
license=('Apache')
provides=('sysrepo')
conflicts=('sysrepo')
source=("https://github.com/sysrepo/sysrepo/archive/v$pkgver.tar.gz"
        '000-disable-lua-bindings.patch'
        '001-fix-default-permissions.patch'
        '002-disable-uid-check.patch'
        '003-build-python-3-bindings.patch')
sha256sums=('2bf8cb4d810d19231eba1e549f58f3a0ce068d170a5e7b212b927396098560e4'
            '6b8b4e6fb9b9ca1818720b01ebdcd291a7db8436a0a1f953ae360e6e1f6dbecd'
            '3ee0b97d0bc157f62a76eca67d6d4d72e804c800accf633198c517b56148a6f1'
            'e831980732a96a26d3056077ff12f3c9fad687a0f490e0345f4961f196c29ac9'
            '8ad938bdaebb0d54b24a1a42e14d61d05512562d752f8b4d08199f8b432c5142')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver/build-pkgtool"
    mkdir -p "$srcdir/$pkgname-$pkgver/build"
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < "$srcdir/000-disable-lua-bindings.patch"
    patch -p1 < "$srcdir/001-fix-default-permissions.patch"
    patch -p1 < "$srcdir/003-build-python-3-bindings.patch"
    sed -i -e 's,/var/run/,/run/,' \
        "$srcdir/$pkgname-$pkgver/deploy/systemd/"*.service
}

build() {
    ##
    ## Build tools (sysrepoctl and sysrepocfg) for packaging
    ##
    cd "$srcdir/$pkgname-$pkgver"
    cp CMakeLists.txt CMakeLists.txt.save
    sed -i -e "s,/var/run,$pkgdir/var/run," CMakeLists.txt
    cp src/connection_manager.c src/connection_manager.c.save
    patch -p1 < "$srcdir/002-disable-uid-check.patch"

    cd "$srcdir/$pkgname-$pkgver/build-pkgtool"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DREPOSITORY_LOC="$pkgdir/etc/sysrepo" \
        -Wno-dev \
        ..
    make

    ##
    ## Build the actual package contents
    ##
    cd "$srcdir/$pkgname-$pkgver"
    mv CMakeLists.txt.save CMakeLists.txt
    mv src/connection_manager.c.save src/connection_manager.c

    cd "$srcdir/$pkgname-$pkgver/build"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DREPOSITORY_LOC=/etc/sysrepo \
        -DCALL_SYSREPOCTL_BIN="$srcdir/$pkgname-$pkgver/build-pkgtool/src/sysrepoctl" \
        -DCALL_SYSREPOCFG_BIN="$srcdir/$pkgname-$pkgver/build-pkgtool/src/sysrepocfg" \
        -Wno-dev \
        ..
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system" \
        "$srcdir/$pkgname-$pkgver/deploy/systemd/"*.service
    mv "$pkgdir/usr/lib64/"* "$pkgdir/usr/lib/"
    rmdir "$pkgdir/usr/lib64"
    rm -rf "$pkgdir/var"
}

# vim: set sw=4 ts=4 et:
