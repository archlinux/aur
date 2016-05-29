# Maintainer: zfo <zfoofz1@gmail.com>
# Contributor: Mihails Strasuns <public@dicebot.lv>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=('ldc-git' 'liblphobos-git')
_gitname=ldc
groups=('dlang' 'dlang-ldc')
pkgver=v1.0.0.beta1.146.ge058ab7
epoch=1
pkgrel=1
pkgdesc="A D Compiler based on the LLVM Compiler Infrastructure including D runtime and libphobos2"
arch=('i686' 'x86_64')
url="https://github.com/ldc-developers/ldc"
license=('BSD')
depends=('libconfig')
conflicts=('ldc')
provides=('ldc')
makedepends=('git' 'cmake' 'llvm')
source=("git://github.com/ldc-developers/ldc.git"
        "ldc2.conf"
       )
sha256sums=('SKIP'
            'd7b1d3450801eb1603f682c0904f8377496c57f7ed6d94a6fecfac0b90ead11d')

pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --tags HEAD | sed 's/-/./g'
}

build() {
    mkdir -p $srcdir/tmp_install_dir
    cd $srcdir/ldc

    git submodule update --init --recursive

    mkdir -p build && cd build

    # don't use ArchLinux LDFLAGS
    LDFLAGS="" cmake \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_SKIP_RPATH=ON \
	-DINCLUDE_INSTALL_DIR=/usr/include/dlang/ldc \
	-DBUILD_SHARED_LIBS=ON \
    ..
	make -j $(nproc)
    make install DESTDIR=$srcdir/tmp_install_dir
}

package_ldc-git() {
    depends=('liblphobos-git' 'libconfig')
    backup=("etc/ldc2.conf")
    provides=("d-compiler")

    cd $srcdir/tmp_install_dir

    # binaries
    install -D -m755 ./usr/bin/ldmd2 $pkgdir/usr/bin/ldmd
    ln -s /usr/bin/ldmd $pkgdir/usr/bin/ldmd2
    install -D -m755 ./usr/bin/ldc2 $pkgdir/usr/bin/ldc
    ln -s /usr/bin/ldc $pkgdir/usr/bin/ldc2

    # supplementaries
    install -D -m644 $srcdir/ldc/bash_completion.d/ldc2 $pkgdir/usr/share/bash-completion/completions/ldc

    # licenses
    install -D -m644 $srcdir/ldc/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    # default configuration files
    install -D -m644 $srcdir/ldc2.conf $pkgdir/etc/ldc2.conf
}

package_liblphobos-git() {
    provides=("d-runtime" "d-stdlib")
    replaces=("liblphobos-devel" "liblphobos")
    conflicts=("liblphobos-devel" "liblphobos" "ldc")
    depends=("curl")

    # licenses
    install -D -m644 $srcdir/ldc/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    cd $srcdir/tmp_install_dir

    # libraries
    install -D -m644 ./usr/lib/libphobos2-ldc.so $pkgdir/usr/lib/liblphobos2.so
    install -D -m644 ./usr/lib/libdruntime-ldc.so $pkgdir/usr/lib/libldruntime.so
    install -D -m644 ./usr/lib/libphobos2-ldc-debug.so $pkgdir/usr/lib/liblphobos2-debug.so
    install -D -m644 ./usr/lib/libdruntime-ldc-debug.so $pkgdir/usr/lib/libldruntime-debug.so

    # imports
    mkdir -p $pkgdir/usr/include/dlang
    cp -r ./usr/include/dlang/ldc $pkgdir/usr/include/dlang/ldc
}
