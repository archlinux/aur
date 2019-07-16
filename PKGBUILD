# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
pkgname=libquotient-git
pkgver=0.5.0.1.r109.g74caea2
pkgrel=2
pkgdesc="A Qt5 library to write cross-platform clients for Matrix"
arch=(x86_64)
url="https://github.com/quotient-im/libQuotient"
license=("LGPL2")
depends=("qt5-base" "qt5-multimedia" "qt5-olm-git")
makedepends=("git" "cmake" "make" "gcc")
provides=("libquotient")
conflicts=("libquotient")
source=("${pkgname}::git+https://github.com/quotient-im/libQuotient.git")
sha512sums=("SKIP")


pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p "build"
}

build() {
    cd "build"
    cmake ../${pkgname} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DQMATRIXCLIENT_INSTALL_EXAMPLE=1

    make
}

package() {
    cd "build"
    make DESTDIR="${pkgdir}" install

    cd "../$pkgname"
    install -Dm 644 "examples/qmc-example.cpp" "${pkgdir}/usr/share/doc/${pkgname}/qmc-example.cpp"
    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
