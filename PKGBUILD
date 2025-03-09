# Maintainer: taotieren <admin@taotieren.com>

pkgname=sherpa-ncnn
pkgver=2.1.10
pkgrel=4
epoch=
pkgdesc="Real-time speech recognition and voice activity detection (VAD) using next-gen Kaldi with ncnn without Internet connection. "
arch=($CARCH)
url="https://github.com/k2-fsa/sherpa-ncnn"
license=('Apache-2.0')
groups=()
depends=(
    alsa-lib
    glibc
    gcc-libs
    #     python
    #     pybind11
    #     ncnn
)
makedepends=(
    alsa-utils
    ccache
    cmake
    ninja
    pkgconf)
checkdepends=()
optdepends=()
provides=(${pkgname} ncnn)
conflicts=(${pkgname} ncnn)
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('31327d2feba89e5c5796b1bccdb6513bbf059c8ae22defd7646530cc82cfee91')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DSHERPA_NCNN_ENABLE_FFMPEG_EXAMPLES=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -Wno-dev \
        -B build \
        -G Ninja
    #    -Wno-deprecated-declarations \

    ninja -C build

}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}-${pkgver}/build install
    install -dm755 ${pkgdir}/usr/lib/pkgconfig
    mv ${pkgdir}/usr/sherpa-ncnn.pc ${pkgdir}/usr/lib/pkgconfig
}
