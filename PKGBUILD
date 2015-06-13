# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=am335x-pru-git
pkgver=20140124
pkgrel=2
pkgdesc="The PASM assembler and prussdrv library for the BBB (beaglebone black) PRU."
arch=('i686' 'x86_64' 'armv7h')
url="http://processors.wiki.ti.com/index.php/Category:PRU"
license=('copyright')
depends=()
makedepends=('git')
optdepends=('python: for python prussdrv wrapper')
source=('git+https://github.com/beagleboard/am335x_pru_package.git')
md5sums=('SKIP')
_gitname=am335x_pru_package
_with_docs=false  # set to true to bundle various PDFs

# todo
# confirm http://hipstercircuits.com/prussdrv-bug/ is merged
# consider making a package for https://bitbucket.org/intelligentagent/pypruss

pkgver() {
    cd "$srcdir/$_gitname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
    cd "$srcdir/$_gitname"

    msg "Building PASM assembler..."
    pushd pru_sw/utils/pasm_source
    ./linuxbuild
    popd

    msg "Building prussdrv libraries..."
    pushd pru_sw/app_loader/interface
    sed -i '/CROSS_COMPILE/ d' Makefile
    make
    popd

    msg "Hacking python stuff..."
    pushd pru_sw/app_loader/python/prussdrv
    sed -i "2i import sys" __init__.py
    sed -i "3i sys.path.append('/usr/lib/python3.3/site-packages/prussdrv')" __init__.py
    #sed -i 's/^import /&prussdrv./' *.py
    #sed -i 's/^from /&prussdrv./' *.py
    #sed -i 's/prussdrv.ctypes/ctypes/' *.py
    #sed -i 's/prussdrv.subprocess/subprocess/' *.py
    #sed -i 's/prussdrv.multiprocessing/multiprocessing/' *.py
    popd

    pushd pru_sw
    find example_apps/ -type f -exec chmod -x '{}' \;
    find old_example/  -type f -exec chmod -x '{}' \;
    find app_loader/include/ -type f -exec chmod -x '{}' \;
    popd
}

package() {
    cd "$srcdir/$_gitname"

    pushd pru_sw/utils
    install -Dm644 LICENCE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENCE.txt"
    install -Dm755 pasm "$pkgdir/usr/bin/pasm"
    popd

    pushd pru_sw/app_loader/python/prussdrv
    install -d "$pkgdir/usr/lib/python3.3/site-packages/prussdrv"
    cp *.py    "$pkgdir/usr/lib/python3.3/site-packages/prussdrv"
    popd

    pushd pru_sw
    install -d "$pkgdir/usr/share/$pkgname"
    cp -r example_apps "$pkgdir/usr/share/$pkgname"
    cp -r old_example  "$pkgdir/usr/share/$pkgname"
    popd

    pushd pru_sw/app_loader/include
    install -d "$pkgdir/usr/include"
    cp *.h     "$pkgdir/usr/include"
    popd

    pushd pru_sw/app_loader/lib
    install -d "$pkgdir/usr/lib"
    cp lib*    "$pkgdir/usr/lib"
    popd

    # compatibility
    install -d "$pkgdir/etc/modprobe.d"
    echo "alias uio_pru uio_pruss" > "$pkgdir/etc/modprobe.d/pru.conf"

    if [[ "$_with_docs" == "false" ]]; then
        msg "Skipping PDF docs."
        return
    fi
    install -d "$pkgdir/usr/share/doc/$pkgname"
    cd "$srcdir/$_gitname"
    cp *.pdf "$pkgdir/usr/share/doc/$pkgname"
    cd Documentation
    cp *.pdf "$pkgdir/usr/share/doc/$pkgname"
}

