# Maintainer: Sebastian Wilzbach <seb wilzba ch>
# Contributor: Mihails Strasunse <public@dicebot.lv>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anders Bergh <anders1@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=('dmd-beta' 'libphobos-devel-beta' 'libphobos-beta')
pkgdesc="D programming language compiler and standard library"
groups=('dlang' 'dlang-dmd')
pkgbase=dmd-beta
pkgver=2.075.0
pkgrel=1
epoch=1
arch=('i686' 'x86_64')
url="http://www.dlang.org"
conflicts=('dmd')
makedepends=('git' 'gcc' 'make')
source=("git+https://github.com/dlang/dmd.git#tag=v$pkgver"
        "git+https://github.com/dlang/druntime.git#tag=v$pkgver"
        "git+https://github.com/dlang/phobos.git#tag=v$pkgver"
        "dmd.conf")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '3d639e89528fed1da90006f4dfb2b0fdc41308da5a96d953381ff4ccf257c035')

[[ $CARCH == "x86_64" ]] && _archbits="64"
[[ $CARCH == "i686" ]] && _archbits="32"

build() {
    cd $srcdir/dmd/src
    make -f posix.mak MODEL=$_archbits RELEASE=1 AUTO_BOOTSTRAP=1

    cd $srcdir/druntime
    make -f posix.mak MODEL=$_archbits DMD=$srcdir/dmd/src/dmd RELEASE=1 PIC=1

    cd $srcdir/phobos
    make -f posix.mak MODEL=$_archbits DMD=$srcdir/dmd/src/dmd RELEASE=1 PIC=1
}

package_dmd-beta() {
    pkgdesc="The D programming language reference compiler"
    backup=('etc/dmd.conf')
    depends=('gcc' 'libphobos-devel-beta')
    optdepends=(
        'dtools: collection of useful utilities for development in D'
        'libphobos-beta: standard D library, Phobos; shared library'
        'gcc-multilib: to cross-compile 32-bit applications'
    )
    provides=("d-compiler=$pkgver")
    conflicts=('dmd')
    license=('custom')

    install -Dm755 $srcdir/dmd/src/dmd $pkgdir/usr/bin/dmd

    mkdir -p $pkgdir/etc
    install -Dm644 $srcdir/dmd.conf $pkgdir/etc/dmd.conf

    mkdir -p $pkgdir/usr/share/man/man1
    mkdir -p $pkgdir/usr/share/man/man5
    cp -r $srcdir/dmd/docs/man/man1/* $pkgdir/usr/share/man/man1/
    cp -r $srcdir/dmd/docs/man/man5/* $pkgdir/usr/share/man/man5/

    install -Dm644 $srcdir/dmd/src/ddmd/boostlicense.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

    mkdir -p $pkgdir/usr/share/d/samples/
    cp -r $srcdir/dmd/samples/* $pkgdir/usr/share/d/samples/

    find $pkgdir/usr -type f | xargs chmod 0644
    chmod 755 $pkgdir/usr/bin/*
}

package_libphobos-devel-beta() {
    pkgdesc="The Phobos standard library for D programming language. Modules and static library."
    options=("staticlibs")
    provides=("d-runtime=$pkgver" "d-stdlib=$pkgver")
    conflicts=('libphobos-devel')
    license=("custom")

    install -Dm644 $srcdir/phobos/generated/linux/release/$_archbits/libphobos2.a $pkgdir/usr/lib/libphobos2.a
    install -Dm644 $srcdir/phobos/LICENSE_1_0.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

    mkdir -p $pkgdir/usr/include/dlang/dmd
    cp -r $srcdir/phobos/{*.d,etc,std} $pkgdir/usr/include/dlang/dmd
    cp -r $srcdir/druntime/import/* $pkgdir/usr/include/dlang/dmd/

    find $pkgdir/usr -type f | xargs chmod 0644

    install -Dm644 $srcdir/druntime/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE-druntime
    install -Dm644 $srcdir/phobos/LICENSE_1_0.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE-phobos
}

package_libphobos-beta() {
    pkgdesc="The Phobos standard library for D programming language."
    depends=("curl")
    conflicts=('libphobos')
    license=("custom")

    install -Dm644 $srcdir/phobos/generated/linux/release/$_archbits/libphobos2.so $pkgdir/usr/lib/libphobos2.so
    install -Dm644 $srcdir/phobos/LICENSE_1_0.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
