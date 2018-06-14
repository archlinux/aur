# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>

_gitname=cpp-ethereum
pkgname=('cpp-ethereum-solidity-tester')
pkgdesc="Ethereum C++ client - version used to test solidity"
pkgver=20180405
pkgrel=1
arch=('x86' 'x86_64')
makedepends=('git' 'cmake>=3.4.3')
depends=('leveldb')
provides=('cpp-ethereum')
conflicts=('cpp-ethereum')
url="https://github.com/ethereum/cpp-ethereum/"
license=('GPL3')

source=("git://github.com/ethereum/${_gitname}/#commit=5ac09111bd0b6518365fe956e1bdb97a2db82af1" "catch-by-value-patch.diff")

sha512sums=('SKIP'
            'e2b87dcb7edd521e9aaca30a53f17374752a05808fc2ddd4cd7412367fd577c07edf9d09e005c43a8a85362bc3aa06712db339fbdb3d2f0193cf6c4b1d98425c')

prepare() {
	cd "${srcdir}/${_gitname}"
	git submodule update --init
	git apply "${srcdir}/catch-by-value-patch.diff"
}

build () {
	cd "${srcdir}/${_gitname}"
	rm -rf build
	mkdir -p build
	cd build/
	mkdir -p deps/lib64
	ln -s lib64 deps/lib

	cmake -DTESTS=OFF -DTOOLS=OFF ..
	cmake --build .
}

package () {
	cd "${srcdir}/${_gitname}"
	cd build/

	install -D eth/eth ${pkgdir}/usr/bin/eth
}
