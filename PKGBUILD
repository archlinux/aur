# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=clightd
_gitname=Clightd
pkgver=3.2
pkgrel=1
pkgdesc="Bus interface to change screen brightness and capture frames from webcam."
arch=('i686' 'x86_64')
url="https://github.com/FedeDP/${_gitname}"
license=('GPL')
depends=('systemd>=221' 'linux-api-headers' 'libx11' 'libxrandr' 'libxext' 'polkit' 'libxss' 'ddcutil' 'libmodule>=4.0.0')
makedepends=('git' 'cmake')
optdepends=('clight: user service to automagically change screen backlight matching ambient brightness.')
provides=('clightd')
conflicts=('clightd-git')
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("af64622a5c5f441f43956a64c94860bf32f81beef8885f92a90f4752433d632c")

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${_gitname}-${pkgver}/build"
     cmake \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        -DENABLE_DDC=1 -DENABLE_GAMMA=1 -DENABLE_IDLE=1 -DENABLE_DPMS=1 \
        ..
    make
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}/build"
    make DESTDIR="$pkgdir" install
}
