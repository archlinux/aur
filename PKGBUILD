# Maintainer: HMTheBoy154 <buingoc67@gmail.com>
# from: git

_pkgname="fcitx5-bamboo"
pkgbase="fcitx5-bamboo-git"
pkgname=(
    "$pkgbase"
)
pkgver=1.0.0.ad7bf38
pkgrel=1
pkgdesc="Bamboo (Vietnamese Input Method) engine support for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-bamboo"
license=('LGPLv2.1+')
makedepends=('cmake' 'go' 'git' 'extra-cmake-modules' 'fcitx5')
conflicts=('fcitx5-bamboo')
provides=('fcitx5-bamboo')
source=(
    "${pkgbase%*-git}::git+https://github.com/fcitx/fcitx5-bamboo"
)
sha256sums=('SKIP')

pkgver()
{
    cd "$srcdir/${pkgbase%*-git}"
    printf "1.0.0.%s" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgbase%*-git}"
	git submodule update --init
}

build() {
    cd "${srcdir}/${pkgbase%*-git}"
    mkdir -p build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgbase%*-git}/build"
    make DESTDIR="${pkgdir}" install

    # install licence files
    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}/"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSES/LGPL-2.1-or-later.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
