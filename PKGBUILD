# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="liblogcpp"
pkgver=1.9.4
pkgrel=1
pkgdesc="An intuitive and highly customizable LGPL library for logging with C++."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://git.0ptr.de/nullptr_t/liblogcpp.git"
license=('LGPL3')
replaces=('liblogcpp-qt')
provides=('liblogcpp')
conflicts=('liglogcpp-git')
depends=()
makedepends=('cmake')
source=("liblogcpp-v${pkgver}.tar.gz::https://git.0ptr.de/nullptr_t/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('74152f35813444e3abd4d244f4bcdd10e432690a6d010ba01679d2c75734fa06')



prepare() {
    [[ -e "$srcdir/build" ]] && rm -r "$srcdir/build"
    mkdir "$srcdir/build"
    [[ -e "$srcdir/build-static" ]] && rm -r "$srcdir/build-static"
    mkdir "$srcdir/build-static"
}

build() {
    cd "$srcdir/build"

    cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
   	-DLOGCPP_SHARED=1 \
	-DLOGCPP_INSTALL_LIBS=ON \
	"../liblogcpp-v$pkgver"

    make

    cd "$srcdir/build-static"

    cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
	"../liblogcpp-v$pkgver"

    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="${pkgdir}" install

    cd "$srcdir/build-static"
    install "$srcdir/build-static/liblogcpp.a" "$pkgdir/usr/lib/liblogcpp.a"
}
