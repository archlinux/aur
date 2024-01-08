# Maintainer: balaraz <balaraz@tuta.io>

_pkgname=licenser
pkgname=licenser-gcc
pkgver=0.50
pkgrel=1
pkgdesc='A License management tool for your Open Source projects'
arch=(x86_64)
url="https://github.com/coder3101/$_pkgname"
license=(GPL3)
depends=()
makedepends=(cmake git gcc)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('c9cb280bcb5fadab1803ee9b42e46e4bb1ae0c62b955e5894358b75915eb9359')

prepare() {
		cd $_pkgname-$pkgver

		# Remove the .git if already exists in the tarball or user has already build it
		# This step makes sure that the submodule we clone in future does not errors out
		# saying " <submodule> index already exists "

		if [ -d "./.git" ]; then
				rm -rf .git
		fi

		git init
		rm -rf third_party/clipp
		git submodule add https://github.com/muellan/clipp.git third_party/clipp
}

build() {
		cmake -S $_pkgname-$pkgver -Bbuild \
				-DCMAKE_CXX_COMPILER=g++ \
				-DCMAKE_C_COMPILER=gcc \
				-DENABLE_TESTS=off
		cmake --build build
}

package() {
		DESTDIR="$pkgdir" cmake --install ./build --prefix /usr
}
