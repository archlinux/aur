# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=linphone-desktop-git
_pkgname=linphone-desktop
pkgver=4.1.1.r663.g4a43f00e
pkgrel=1
pkgdesc="A Voice-over-IP phone"
arch=('x86_64')
url="http://www.linphone.org"
license=('GPL')
depends=('desktop-file-utils' 'linphone-git' 'minizip-git'
    'qt5-quickcontrols'
    'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg')
makedepends=('cmake' 'git' 'python-pystache' 'qt5-tools')
optdepends=('pulseaudio')
options=('!emptydirs')
provides=('linphone-desktop')
conflicts=('linphone-desktop')
source=('git+https://github.com/BelledonneCommunications/linphone-desktop.git'
    'cmake.patch'
    'deprecated.patch'
    'find_minizip2.patch')
sha256sums=('SKIP'
            'f251ef179dc6c3fb22449f2a0bd2014c082642747e201a992b3eaf2db6e50544'
            '93170eda1b55987c61171e18afb94182672302b03f34658b817fe8b46f1af545'
            'c2dbf6e11105c010fdcc2cc90b0087ded595c05ba9a3324e1f57cc04383e8180')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g' 
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -p1 < ../cmake.patch
    patch -p1 < ../deprecated.patch
    patch -p1 < ../find_minizip2.patch
}

build() {
  cd $_pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_PREFIX_PATH=/usr .
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
