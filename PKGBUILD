pkgname=ring-kde
pkgver=3.0.0
pkgrel=1
pkgdesc="KDE client for Ring (ring.cx)"
arch=('i686' 'x86_64')
url="https://commits.kde.org/${pkgname}"
license=('GPL3')
groups=('ring')
depends=('ring-daemon' 'knotifyconfig' 'kdeclarative' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'python' 'glu' 'kinit' 'qt5-tools')
source=("ring-kde-$pkgver.tar.gz"::"https://github.com/KDE/ring-kde/archive/$pkgver.tar.gz"
        "libringqt-kde-$pkgver.tar.gz"::"https://github.com/Elv13/libringqt/archive/ring-kde-$pkgver.tar.gz"
        https://github.com/KDE/ring-kde/commit/9256bdd24f03d232ee0a92d02636dd78b08786ad.patch
        https://github.com/KDE/ring-kde/commit/7e5a94377a004139608458e677656fa8333e59d8.patch
        https://github.com/KDE/ring-kde/commit/3a81b0589299bfe32b209b19c2f71a60720efbc1.patch)
sha256sums=('abbe1947b66c4910fa5033661dcea2f0cb43e2d6a68dd4d6a175ec7f9b40acc5'
            'b4c30d6452d289c12f05915a63aebea556cac3d221f1c1e1fb18b1af8fa94ff5'
            '677fa64d61bfb8bf2862637b7788ebffcb673796ce03e22df7f964f8fa90b08a'
            '755796286f94164ea98e0c445c384555a9a770f6dd29eac47271f0480d7ee30e'
            'eb08e9c409e0b94004a57861fcd628c41029441e26f4807fde7506b7ade836ce')

prepare() {
    mkdir -p build
    mv "libringqt-ring-kde-${pkgver}" "${pkgname}-${pkgver}/libringqt"
    cd $pkgname-$pkgver
    patch -Np1 -i ../9256bdd24f03d232ee0a92d02636dd78b08786ad.patch
    patch -Np1 -i ../7e5a94377a004139608458e677656fa8333e59d8.patch
    patch -Np1 -i ../3a81b0589299bfe32b209b19c2f71a60720efbc1.patch
}

build() {
    cd build

    cmake ../${pkgname}-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF
    make
}

package() {
    cd build

    make DESTDIR="${pkgdir}" install
}
