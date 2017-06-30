# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgname=ring-kde
_commit=b1992bb2e0254f6dab69333d31a52f8b9842d619
_commitlrc=7eaaed91db929644674f8a12b28c4e8122a69b16
pkgver=2.3.0.r424.g${_commit:0:7}
pkgrel=1
pkgdesc="KDE client for Ring (ring.cx)"
arch=('i686' 'x86_64')
url="https://commits.kde.org/${pkgname}"
license=('GPL3')
groups=('ring')
depends=('ring-daemon' 'knotifyconfig' 'kdeclarative' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'python' 'glu' 'kinit' 'qt5-tools')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/KDE/${pkgname}/archive/${_commit}.tar.gz"
        lrc-${_commitlrc}.tar.gz::"https://github.com/elv13/ring-lrc/archive/${_commitlrc}.tar.gz")
sha256sums=('0b320c692f4bab0163da3209501fb24e46484cdc1747f096a2cba2e92dd7054b'
            'b855a27698d248e1557517b9fdc32bb71bda1c100889df7b5300ddf651b24f75')

prepare() {
    mkdir -p build
    mv ring-lrc-${_commitlrc} ${pkgname}-${_commit}/ring-lrc
}

build() {
    cd build
    cmake ../${pkgname}-${_commit} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    # Remove embedded
    rm -rf "${pkgdir}"/usr/{include,lib64}
}
