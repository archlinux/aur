# Maintainer: taotieren <admin@taotieren.com>

pkgname=l8w8jwt-git
pkgver=2.1.7.r2.gd7f5b3b
pkgrel=1
pkgdesc="Minimal, OpenSSL-less and super lightweight JWT library written in C."
arch=('any')
url="https://github.com/GlitchedPolygons/l8w8jwt"
license=('Apache-2.0')
provides=(${pkgname%-git}
        ed25519
        mbedtls
        )
conflicts=(${pkgname%-git})
depends=()
makedepends=(git
            cmake
            ninja)
backup=()
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}/"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgname}/"
    cmake -DCMAKE_BUILD_TYPE=None \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -B build \
          -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}/"
    DESTDIR="${pkgdir}" ninja -C build install
}
