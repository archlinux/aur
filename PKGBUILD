pkgname=easyaudiosync
pkgver=1.1.2
pkgrel=2
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
  001-support-ffmpeg8.patch
)
sha256sums=(
  134a53d8a46c09f9f4744bcbe6f15cf07a01fd4081091fe3bf8a280a871401f5
  a08e9c23cc83c4eca16ebb3e8895f1d5174966012aeb019fcea5ec376ed1b1b8
)

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -p1 -i ../001-support-ffmpeg8.patch
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
