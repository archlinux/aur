# Maintainer: taotieren <admin@taotieren.com>

pkgname=flashmq
pkgver=1.27.1
pkgrel=1
pkgdesc="FlashMQ is a light-weight MQTT broker/server, designed to take good advantage of multi-CPU environments"
arch=($CARCH)
url="https://github.com/halfgaar/FlashMQ"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=(
    libgcc_s.so
    libstdc++.so
    openssl
)
makedepends=(
    git
    cmake
    ninja
    sed
    docbook2x
    libxslt
)
backup=('etc/flashmq/flashmq.conf')
options=('!strip' '!emptydirs')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('be42ce1e0a973a043415206cf539f40662056dece8ed0a21e7665d7eb3c4ebdb')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"
    sed --in-place 's#DESTINATION "/lib#DESTINATION "/usr/lib#' CMakeLists.txt
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -G Ninja
    ninja -C build

    cd man
    make -j
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
