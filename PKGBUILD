# Maintainer: Aleksandar Trifunovic <akstrfn@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=osmium-tool
pkgver=1.16.0
pkgrel=3
pkgdesc="Command line tool for working with OpenStreetMap data based on the Osmium library"
arch=('i686' 'x86_64')
depends=('boost-libs' 'expat')
makedepends=('cmake' 'libosmium>=2.17.0' 'protozero')
optdepends=('pandoc: building documentation')
url="https://osmcode.org/osmium-tool/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/osmcode/$pkgname/archive/v$pkgver.tar.gz"
        "disable-copy.patch::https://github.com/Tencent/rapidjson/commit/862c39be371278a45a88d4d1d75164be57bb7e2d.patch"
        "remove-assignment.patch::https://github.com/Tencent/rapidjson/commit/3b2441b87f99ab65f37b141a7b548ebadb607b96.patch")
sha256sums=('f98454d9f901be42e0b6751aef40106d734887ee35190c224b174c2f27ef1c0f'
            'b990486e16e643f7f48f90de606c59cf7b96747312d50b73da739e0363d32bb5'
            'a8b1fe3ac541792ef9173eb5d7ee0ce61b73c7212dfb79016df6e5d2b6bd5a93')

prepare() {
    cd "$pkgname-$pkgver"

    patch -Np1 -i ../disable-copy.patch
    patch -Np1 -i ../remove-assignment.patch

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

