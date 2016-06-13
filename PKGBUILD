# Maintainer: Thomas Edvalson <machin3@gmail.com>

_pkgbase=cpp3ds
pkgname="$_pkgbase-git"
pkgver=v0.3.r12.gb36b425
pkgrel=1
pkgdesc="Basic C++ gaming framework and library for Nintendo 3DS."
arch=('x86_64')
url="http://cpp3ds.github.io/"
license=('MIT' 'ZLIB')
depends=('cmake' 'devkitarm' 'citro3d-git' 'ctrulib-git' 'libjpeg-turbo' 'openssl' 'zlib' 'freetype2' 'qt5-base' 'python' 'sfml')
makedepends=('git')
checkdepends=('gtest')
conflicts=('cpp3ds')
provides=('cpp3ds')
options=('!strip')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

source=("$pkgname::git+https://github.com/cpp3ds/cpp3ds"
        "https://github.com/cpp3ds/3ds_portlibs/releases/download/r3/portlibs-3ds-r3.tar.xz"
        "https://github.com/cpp3ds/3ds-tools/releases/download/r4/3ds-tools-linux-r4.tar.gz"
        "cpp3ds.sh")
sha256sums=('SKIP'
            '263ebbde3022d7dbc846b9cd289d01ba25f30534b6cd504b4380305f09b531b5'
            '35297910aa8b1c6e603d5b2c99440ba5c2a0292853a638804545adf3fc5bfe9c'
            'df7e57eececa343212a7eb8ec6e9bda4d37c0c39bc30de8b621b47c2f8880837')

prepare() {
    cd $pkgname
}

build() {
	cd $pkgname
	export PATH=$PATH:$srcdir/3ds-tools
	export PORTLIBS=$srcdir/portlibs
	source /etc/profile.d/devkitarm.sh
	cmake -DBUILD_TESTS=ON -DBUILD_EMULATOR=ON .
	make -j4
}

check() {
	cd $pkgname
	./bin/tests
}

package() {
    source /etc/profile.d/devkitarm.sh
    install -Dm755 $pkgname/LICENSE $pkgdir/usr/share/licenses/cpp3ds/LICENSE
    install -Dm755 cpp3ds.sh $pkgdir/etc/profile.d/cpp3ds.sh
	install -d $pkgdir$DEVKITPRO/portlibs/armv6k
	install -d $pkgdir/opt/cpp3ds/bin
	cp 3ds-tools/* $pkgdir/opt/cpp3ds/bin
	cp -r portlibs/3ds/lib $pkgdir$DEVKITPRO/portlibs/armv6k
	cp -r portlibs/3ds/include $pkgdir$DEVKITPRO/portlibs/armv6k
	cd $pkgname
	cp -r lib $pkgdir/opt/cpp3ds
	cp -r cmake $pkgdir/opt/cpp3ds
	cp -r include $pkgdir/opt/cpp3ds
	cp -r scripts $pkgdir/opt/cpp3ds
	rm $pkgdir/opt/cpp3ds/cmake/cmake_uninstall.cmake
}
