# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=clightd-git
_gitname=Clightd
pkgver=r210.0d1866b
pkgrel=1
pkgdesc="Bus interface to change screen brightness and capture frames from webcam. Devel version."
arch=('i686' 'x86_64')
url="https://github.com/FedeDP/${_gitname}"
license=('GPL')
depends=('systemd>=221' 'linux-api-headers' 'libx11' 'libxrandr' 'libxext' 'polkit' 'libxss' 'ddcutil' 'libmodule>=3.1.0')
makedepends=('git' 'cmake')
optdepends=('clight-git: user service to automagically change screen backlight matching ambient brightness.')
source=("git://github.com/FedeDP/${_gitname}.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_gitname}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${_gitname}/build"
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
    cd "${srcdir}/${_gitname}/build"
    make DESTDIR="$pkgdir" install
}
