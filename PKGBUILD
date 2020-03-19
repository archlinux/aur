# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Yoep Kortekaas <yoep dot kortekaas at gmail dot com>
pkgname=palisade-development-git
pkgver=1.9.1
pkgrel=2
pkgdesc="PALISADE is a general lattice cryptography library that currently includes efficient implementations of the following lattice cryptography capabilities"
arch=('i686' 'x86_64')
url="https://palisade-crypto.org"
license=('custom:NJIT')
groups=()
depends=('gperftools')
makedepends=('cmake>=3.5.1' 'make' 'gcc>=5.2.0' 'git')
provides=("palisade-development")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('palisade-development::git+https://gitlab.com/palisade/palisade-development.git')
noextract=()
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname%-git}"
	git checkout v${pkgver}
	
	git submodule sync --recursive
	git submodule update --init --recursive
	
	mkdir build
	cd build

	cmake -DWITH_TCM=Y ..
	make tcm -j4

	make allmodules -j4
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
	install -Dm644 ../License.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
