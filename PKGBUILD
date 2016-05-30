# Maintainer: zfo <zfoofz1@gmail.com>
# Contributor: Mihails Strasuns <public@dicebot.lv>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=('ldc-git' 'liblphobos-git')
_gitname=ldc
_pkgname=ldc-git
groups=('dlang' 'dlang-ldc')
pkgver=v1.0.0.beta1.146.ge058ab7
epoch=1
pkgrel=1
pkgdesc="A D Compiler based on the LLVM Compiler Infrastructure including D runtime and libphobos2"
arch=('i686' 'x86_64')
url="https://github.com/ldc-developers/ldc"
license=('BSD')
depends=('libconfig')
#conflicts=('ldc')
#provides=('ldc')
makedepends=('git' 'cmake' 'llvm' 'sed' 'dmd')
source=("git://github.com/ldc-developers/ldc.git"
        "git://github.com/ldc-developers/druntime.git"
        "git://github.com/ldc-developers/phobos.git"
        "git://github.com/ldc-developers/dmd-testsuite.git"
        "ldc2.conf"
       )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '3e3b275f8c04d427b67c989cee591bff96f6701b118f29bb928fc9e3794b1dd7')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --tags HEAD | sed 's/-/./g'
}

build() {
    mkdir -p $srcdir/tmp_install_dir
    cd $srcdir/ldc

    git submodule init
    git config submodule.druntime.url $srcdir/druntime
    git config submodule.phobos.url $srcdir/phobos
    git config "submodule.tests/d2/dmd-testsuite.url" $srcdir/tests/d2/dmd-testsuite
    git submodule update

    # only touch file if necessary
    if grep -q 'ldc[.]conf' driver/configfile.cpp ; then
        # patch the config file to be /etc/ldc2-git.conf
        sed 's/ldc2[.]conf/ldc2-git.conf/' -i driver/configfile.cpp
    fi

    # compilation with ldc links phobos and runtime as shared libraries
    # dmd does static linking to the rescue!
    sed 's/"ldmd2" "dmd"/"dmd"/' -i cmake/Modules/FindDCompiler.cmake

    mkdir -p build && cd build

    # don't use ArchLinux LDFLAGS (#1494)
    LDFLAGS="" cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_EXE_LINKER_FLAGS='-static-libstdc++ -Wl,-rpath,\$ORIGIN' \
    -DINCLUDE_INSTALL_DIR=/usr/include/dlang/ldc \
    -DBUILD_SHARED_LIBS=ON \
    ..

    #-DCMAKE_SKIP_RPATH=ON \
    make -j $(nproc)
    make install DESTDIR=$srcdir/tmp_install_dir
}

package_ldc-git() {
    depends=('liblphobos-git' 'libconfig')
    backup=("etc/ldc2-git.conf")
    provides=("d-compiler")

    cd $srcdir/tmp_install_dir

    # binaries
    install -D -m755 ./usr/bin/ldmd2 $pkgdir/usr/bin/ldmd-git
    install -D -m755 ./usr/bin/ldc2 $pkgdir/usr/bin/ldc-git

    # supplementaries
    install -D -m644 $srcdir/ldc/bash_completion.d/ldc2 $pkgdir/usr/share/bash-completion/completions/ldc-git

    # licenses
    install -D -m644 $srcdir/ldc/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    # default configuration files
    install -D -m644 $srcdir/ldc2.conf $pkgdir/etc/ldc2-git.conf
}

package_liblphobos-git() {
    provides=("d-runtime" "d-stdlib")
    #replaces=("liblphobos-devel" "liblphobos")
    #conflicts=("liblphobos-devel" "liblphobos" "ldc")
    depends=("curl")

    # licenses
    install -D -m644 $srcdir/ldc/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    cd $srcdir/tmp_install_dir

    # libraries
    install -D -m644 ./usr/lib/libphobos2-ldc.so $pkgdir/usr/lib/liblphobos2-git.so
    install -D -m644 ./usr/lib/libdruntime-ldc.so $pkgdir/usr/lib/libldruntime-git.so
    install -D -m644 ./usr/lib/libphobos2-ldc-debug.so $pkgdir/usr/lib/liblphobos2-debug-git.so
    install -D -m644 ./usr/lib/libdruntime-ldc-debug.so $pkgdir/usr/lib/libldruntime-debug-git.so

    # imports
    mkdir -p $pkgdir/usr/include/dlang
    cp -r ./usr/include/dlang/ldc $pkgdir/usr/include/dlang/ldc-git
}
