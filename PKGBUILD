# Maintainer: HMTheBoy154 <buingoc67@gmail.com>
# from: git

pkgname="fcitx5-bamboo-git"
pkgver=1.0.0.0211584
pkgrel=1
pkgdesc="Bamboo (Vietnamese Input Method) engine support for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-bamboo"
license=('LGPLv2.1+')
makedepends=('cmake' 'go' 'git' 'extra-cmake-modules')
depends=('fcitx5')
conflicts=('fcitx5-bamboo')
provides=('fcitx5-bamboo')
source=("$pkgname"::git+https://github.com/fcitx/fcitx5-bamboo)
sha256sums=('SKIP')

pkgver()
{
    cd "$srcdir/$pkgname"
    printf "1.0.0.%s" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
	git submodule update --init
}

build() {
    cd "${srcdir}/$pkgname"
    mkdir -p build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/$pkgname/build"
    make DESTDIR="${pkgdir}" install

    # install licence files
    install -dm755 "${pkgdir}/usr/share/licenses/${provides}/"
    install -Dm644 "${srcdir}/${pkgname}/LICENSES/LGPL-2.1-or-later.txt" "${pkgdir}/usr/share/licenses/${provides}/"
}
