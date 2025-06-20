# Maintainer: taotieren <admin@taotieren.com>

pkgname=flashmq-git
pkgver=1.22.0.r1.g001fe26
pkgrel=1
pkgdesc="FlashMQ is a light-weight MQTT broker/server, designed to take good advantage of multi-CPU environments"
arch=($CARCH)
url="https://github.com/halfgaar/FlashMQ"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    gcc-libs
    glibc
    openssl
)
makedepends=(
    git
    cmake
    ninja
    sed
    docbook2x
    libxslt)
backup=()
options=('!strip' '!emptydirs')
install=
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname%-git}/"
    sed --in-place 's#DESTINATION "/lib#DESTINATION "/usr/lib#' CMakeLists.txt
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -G Ninja

    ninja -C build

    cd man
    sed -i 's#docbook2x-man#db2x_docbook2man#g' Makefile
    make -j
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
    install -Dm0644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
