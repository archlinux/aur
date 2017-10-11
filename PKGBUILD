# $Id$
# Maintainer: zvova7890 <zvova7890@gmail.com>

_pkgname=kio
pkgname=${_pkgname}-osync
pkgver=5.38.0
pkgrel=1
pkgdesc='Resource and network access abstraction with O_SYNC for removeable devices that fixes progressbar'
arch=('i686' 'x86_64')
url='https://community.kde.org/Frameworks'
license=('LGPL')
depends=('solid' 'kjobwidgets' 'kbookmarks' 'libxslt' 'kwallet' 'desktop-file-utils')
conflicts=('kio')
provides=('kio')
makedepends=('extra-cmake-modules' 'kdoctools' 'python' 'doxygen' 'qt5-tools')
optdepends=('kio-extras: extra protocols support (sftp, fish and more)' 'kdoctools: for the help kioslave'
            'knetattach: to add new kio-remote entries')
groups=('kf5')
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"
        "kio.patch")
sha256sums=('f43ab29c0ab51c78bd323e57fa6bba4aedf2d26d70df973b7ef7c80c9fc81597'
            '5d2e864822ed313b69d75ebf292641cb5879c2b3a316683a76ca614f1c2914e0')

prepare() {
  mkdir -p build
  
  cd "${_pkgname}-${pkgver}"
  patch -p1 -i ../kio.patch
}

build() {
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
