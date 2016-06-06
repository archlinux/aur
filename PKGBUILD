# Maintainer: zfo <zfoofz1@gmail.com>
# Contributor: Mihails Strasuns <public@dicebot.lv>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=('ldc-git')
_gitname=ldc
_pkgname=ldc-git
groups=('dlang' 'dlang-ldc')
pkgver=v1.0.0.beta1.167.gd9b012b
epoch=1
pkgrel=1
pkgdesc="A D Compiler based on the LLVM Compiler Infrastructure including D runtime and libphobos2"
arch=('i686' 'x86_64')
url="https://github.com/ldc-developers/ldc"
license=('BSD')
depends=('libconfig' 'curl')
backup=("etc/ldc2-git.conf")
provides=("d-compiler d-runtime" "d-stdlib")
conflicts=('liblphobos-git')
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
    git config "submodule.tests/d2/dmd-testsuite.url" $srcdir/dmd-testsuite
    git submodule update

    # only touch file if necessary
    if grep -q 'ldc2[.]conf' driver/configfile.cpp ; then
        # patch the config file to be /etc/ldc2-git.conf
        sed 's/ldc2[.]conf/ldc2-git.conf/' -i driver/configfile.cpp
    fi

    # compilation with ldc links phobos and runtime as shared libraries
    # dmd does static linking to the rescue!
    sed 's/"ldmd2" "dmd"/"dmd"/' -i cmake/Modules/FindDCompiler.cmake

    # patch ldc to properly link to ldc-git (needed for ldmd)
    sed 's/LDC_EXE ldc2/LDC_EXE ldc-git/' -i CMakeLists.txt
    sed 's/LDMD_EXE ldmd2/LDMD_EXE ldmd-git/' -i CMakeLists.txt
    # it's faster just to rename the config files
    mv ldc2_phobos.conf.in ldc-git_phobos.conf.in
    mv ldc2_install.conf.in ldc-git_install.conf.in

    mkdir -p build && cd build

	# this is the git version - static linking by default
    # don't use ArchLinux LDFLAGS (#1494)
    LDFLAGS="-static-libstdc++ -Wl,-rpath,\$ORIGIN" cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DINCLUDE_INSTALL_DIR=/usr/include/dlang/ldc-git \
    -DBUILD_SHARED_LIBS=OFF \
    ..

    #-DCMAKE_SKIP_RPATH=ON \
    make -j $(nproc)
    make install DESTDIR=$srcdir/tmp_install_dir
}

package() {
    cd $srcdir/tmp_install_dir

    # binaries
    install -D -m755 ./usr/bin/ldmd-git $pkgdir/usr/bin/ldmd-git
    install -D -m755 ./usr/bin/ldc-git $pkgdir/usr/bin/ldc-git

    # supplementaries
    install -D -m644 $srcdir/ldc/bash_completion.d/ldc2 $pkgdir/usr/share/bash-completion/completions/ldc-git

    # licenses
    install -D -m644 $srcdir/ldc/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    # default configuration files
    install -D -m644 $srcdir/ldc2.conf $pkgdir/etc/ldc2-git.conf

    # libraries
    install -D -m644 ./usr/lib/libphobos2-ldc.a $pkgdir/usr/lib/liblphobos2-git.a
    install -D -m644 ./usr/lib/libdruntime-ldc.a $pkgdir/usr/lib/libldruntime-git.a
    install -D -m644 ./usr/lib/libphobos2-ldc-debug.a $pkgdir/usr/lib/liblphobos2-debug-git.a
    install -D -m644 ./usr/lib/libdruntime-ldc-debug.a $pkgdir/usr/lib/libldruntime-debug-git.a

    # imports
    mkdir -p $pkgdir/usr/include/dlang
    cp -r ./usr/include/dlang/ldc-git $pkgdir/usr/include/dlang/ldc-git
}
