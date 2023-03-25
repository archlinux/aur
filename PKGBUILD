# Maintainer: taotieren <admin@taotieren.com>

pkgname=nanomq-git
pkgver=0.16.5.r0.gaa188a4
pkgrel=1
pkgdesc="Nano MQTT Broker - An Ultra-light and Blazing-fast MQTT Broker for IoT Edge"
arch=('x86_64')
url="https://github.com/nanomq/nanomq"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
depends=()
makedepends=('git' 'cmake' 'ninja')
backup=()
options=('!strip')
source=("${pkgname%-git}::git+https://ghproxy.com/${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%-git}/"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgname%-git}/"
    cmake -DCMAKE_BUILD_TYPE=None \
          -DCMAKE_INSTALL_PREFIX=${pkgdir} \
          -B build \
          -G Ninja
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
}
