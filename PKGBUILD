pkgname=easyaudiosync
pkgver=1.1.1
pkgrel=1
epoch=0
pkgdesc="Audio library syncing and conversion utility"
arch=(x86_64)
url="https://github.com/complexlogic/EasyAudioSync"
license=(Unlicense)
depends=(qt6-base libavcodec.so libavformat.so libswresample.so libavfilter.so libavutil.so taglib spdlog fmt)
makedepends=(cmake qt6-tools)
provides=(easyaudiosync)
source=(
  https://github.com/complexlogic/EasyAudioSync/releases/download/v${pkgver}/easyaudiosync-${pkgver}-source.tar.xz
  001-fix-qt-translation.patch
)
sha256sums=(
  a70e346b592429c48b4580f9be2d32bb345ab85e3d63d0eacfb3eab2001e0a97
  cf5b19a0017f87b7d1443dfa8b813a3e379172a452aa43d09833e31cabe537c3
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 --input="${srcdir}/001-fix-qt-translation.patch"
}

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
        -DQT_VERSION=6
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
