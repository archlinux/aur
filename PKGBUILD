# Maintainer: Aleksandar Trifunovic <akstrfn@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=osmium-tool
pkgver=1.15.0
pkgrel=1
pkgdesc="Command line tool for working with OpenStreetMap data based on the Osmium library"
arch=('i686' 'x86_64')
depends=('boost-libs' 'expat')
makedepends=('cmake' 'libosmium>=2.17.0')
optdepends=('pandoc: building documentation')
url="https://osmcode.org/osmium-tool/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/osmcode/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0b3be2f07d60dfb93f65d6a9f1af1fc9cf6ef68e5a460997d841c93079c3377b')

prepare() {
    cd "$pkgname-$pkgver"
    cmake -S. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
}

build() {
	cd "$pkgname-$pkgver/build"
    make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
	install -Dm644 ../zsh_completion/_osmium "${pkgdir}/usr/share/zsh/site-functions/_osmium"
}

