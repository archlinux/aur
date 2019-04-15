# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=sysrepo
pkgver=0.7.7
pkgrel=1
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
        '001-sysrepoctl-install-yang.patch')
sha256sums=('2bf8cb4d810d19231eba1e549f58f3a0ce068d170a5e7b212b927396098560e4'
            '6b8b4e6fb9b9ca1818720b01ebdcd291a7db8436a0a1f953ae360e6e1f6dbecd'
            'c5ff55779fb64e271dee2b873f304de18126717649d64b89681bc1cbe1e51aab')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver/build"
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < "$srcdir/000-disable-lua-bindings.patch"
    patch -p1 < "$srcdir/001-sysrepoctl-install-yang.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver/build"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DREPOSITORY_LOC=/etc/sysrepo \
        -Wno-dev \
        ..
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install
    mv "$pkgdir/usr/lib64/"* "$pkgdir/usr/lib/"
    rmdir "$pkgdir/usr/lib64"
    rm -rf "$pkgdir/var/run"
}

# vim: set sw=4 ts=4 et:
