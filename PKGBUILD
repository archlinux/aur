# Maintainer: Andrew Rabert <ar@nullsum.net>
pkgname=redumper-git
epoch=
pkgver=r514.493a4df
pkgrel=1
pkgdesc='Low level CD dumper utility'
arch=(x86_64)
url='https://github.com/superg/redumper'
license=('GPL-3.0-only')
provides=('redumper')
conflicts=('redumper')
depends=(
    gcc-libs
    glibc
    libc++
    libc++abi
)
makedepends=(
    base-devel
    cmake
    ninja
    llvm
    clang
    lld
)
source=(
    'git+https://github.com/superg/redumper.git'
)

pkgver() {
  cd redumper
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    unset CFLAGS CXXFLAGS LDFLAGS CC CXX
    CC=clang CXX=clang++ LDFLAGS=-fuse-ld=lld cmake \
        -G Ninja \
        -S redumper \
        -B $pkgname-dist \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
        -DCMAKE_BUILD_TYPE=None \
        -DREDUMPER_CLANG_LINK_OPTIONS=-lc++ \
        -DREDUMPER_VERSION_BUILD=$pkgver \
        ;
    ninja -C $pkgname-dist -v
}

package() {
    install -o root -g root -m 755 -d $pkgdir/usr/bin
    install -o root -g root -m 755 -t $pkgdir/usr/bin $pkgname-dist/redumper

    install -o root -g root -m 755 -d $pkgdir/usr/share/doc/redumper
    install -o root -g root -m 644 -t $pkgdir/usr/share/doc/redumper redumper/README.md

    install -o root -g root -m 755 -d $pkgdir/usr/share/licenses
    install -o root -g root -m 644 -t $pkgdir/usr/share/licenses redumper/LICENSE
}

sha256sums=('SKIP')
