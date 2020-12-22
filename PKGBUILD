# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=clightd
_gitname=Clightd
pkgver=5.0
pkgrel=2
pkgdesc="Bus interface to change screen brightness and capture frames from webcam."
arch=('i686' 'x86_64')
url="https://github.com/FedeDP/${_gitname}"
license=('GPL')
depends=('systemd>=221' 'linux-api-headers' 'libx11' 'libxrandr' 'libxext' 'polkit' 'ddcutil>=0.9.5' 'libmodule>=5.0.0' 'libjpeg-turbo' 'libusb' 'libdrm' 'wayland')
makedepends=('git' 'cmake')
optdepends=('clight: user service to automagically change screen backlight matching ambient brightness.')
provides=('clightd')
conflicts=('clightd-git')
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("0f34cb0e5847239efb6e9d7034844d0b2a7595aad6c713f35db8afbc7539e2e8")

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
        -DCMAKE_INSTALL_LIBEXECDIR=lib/"$_gitname" \
        -DCMAKE_BUILD_TYPE="Release" \
        -DENABLE_DDC=1 -DENABLE_GAMMA=1 -DENABLE_DPMS=1 -DENABLE_SCREEN=1 -DENABLE_YOCTOLIGHT=1 \
        ..
    make
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}/build"
    make DESTDIR="$pkgdir" install
}
