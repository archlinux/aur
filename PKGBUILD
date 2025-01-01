# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
pkgname=lith-git
pkgver=1.7.29.r0.g53841b6
pkgrel=1
pkgdesc='A multiplatform WeeChat relay client'
arch=('x86_64')
url='https://github.com/LithApp/Lith'
license=('GPL')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-websockets' 'qcoro-qt6' 'qtkeychain-qt6')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# The project name is "Lith", but I want a lowercase l.
source=('lith::git+https://github.com/LithApp/Lith.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake \
        -S "$srcdir/${pkgname%-git}" \
        -B "$srcdir/build" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DLITH_FORCE_LOCAL_PACKAGES_ONLY=ON \
        -DLITH_VERSION="$(pkgver)"

    cmake --build "$srcdir/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"
    # The executable has an uppercase L, I think it is sensible to change that to a lowercase l.
    mv "$pkgdir/usr/bin/Lith" "$pkgdir/usr/bin/lith"
    sed -i s/Exec=Lith/Exec=lith/ "$pkgdir/usr/share/applications/app.lith.Lith.desktop"
}
