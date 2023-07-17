# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
pkgname=lith-git
pkgver=1.3.45.r0.gf110ed6
pkgrel=1
pkgdesc='A multiplatform WeeChat relay client'
arch=('x86_64')
url='https://github.com/LithApp/Lith'
license=('GPL')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-websockets')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# The project name is "Lith", but I want a lowercase l.
source=('lith::git+https://github.com/LithApp/Lith.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake \
        -S "$srcdir/${pkgname%-git}" \
        -B "$srcdir/build" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build "$srcdir/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"
    # The executable has an uppercase L, I think it is sensible to change that to a lowercase l.
    mv "$pkgdir/usr/bin/Lith" "$pkgdir/usr/bin/lith"
}
