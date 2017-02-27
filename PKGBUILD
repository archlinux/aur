# Maintainer: Sebastien Chassot (sinux) <seba.ptl@sinux.net>

pkgname=pothos-git
pkgver=r324.3587629
pkgrel=1
pkgdesc="Pothos SDR development environment"
arch=('any')
url="https://github.com/pothosware/Pothos"
license=('Boost Software License')
depends=('python' 'poco' 'soapysdr-git' 'portaudio')
makedepends=('git')
provides=('pothos-git')
source=(${pkgname}::"git+https://github.com/pothosware/Pothos.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/$pkgname
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgname}"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make -j4
}

package() {
    make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install
}
