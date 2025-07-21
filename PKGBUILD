# Maintainer: Aleksandar Trifunovic <akstrfn@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=osmium-tool
pkgver=1.18.0
pkgrel=2
pkgdesc="Command line tool for working with OpenStreetMap data based on the Osmium library"
arch=('i686' 'x86_64')
depends=('boost-libs' 'expat' 'nlohmann-json')
makedepends=('cmake' 'libosmium>=2.20.0' 'protozero')
optdepends=('pandoc: building documentation')
url="https://osmcode.org/osmium-tool/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/osmcode/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5438f57043c9df05137ca4bd1b1e4a5fb1c9c8c49cb4bec43a5f1ef30ed68fb5')

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
