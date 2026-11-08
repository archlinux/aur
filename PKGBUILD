# Maintainer: DonutsDelivery <megusta52@proton.me>
pkgname=donutradio
pkgver=2.3.0
pkgrel=1
_ffmpegver=8.0.3
pkgdesc="Internet radio player with curated ad-free stations, plus a KDE Plasma 6 widget"
arch=('x86_64' 'aarch64')
url="https://github.com/DonutsDelivery/Free-Radio-NoAds-NoTalk"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=('qt6-base' 'qt6-declarative' 'kirigami' 'qqc2-desktop-style'
         'libpulse' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'extra-cmake-modules' 'nasm' 'patchelf')
optdepends=('plasma-workspace: DonutRadio widget for Plasma 6 panels and desktops')
provides=('plasma6-applet-freeradio')
conflicts=('plasma6-applet-freeradio')
replaces=('plasma6-applet-freeradio')
# The audio engine is built against FFmpeg 8.0.3 exactly, so the package carries
# its own LGPL build in /usr/lib/donutradio instead of using the system FFmpeg.
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "https://ffmpeg.org/releases/ffmpeg-$_ffmpegver.tar.xz")
sha256sums=('a1f44c68af5ca11212c115ad921698da7d539d346fcc60b4770c7bd61db537f8'
            '6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818')

_src="Free-Radio-NoAds-NoTalk-$pkgver"
_libdir=/usr/lib/donutradio

build() {
    "$srcdir/$_src/scripts/ffmpeg/build-native.sh" \
        --prefix "$srcdir/ffmpeg" \
        --source-dir "$srcdir/ffmpeg-$_ffmpegver" \
        --build-dir "$srcdir/ffmpeg-build"

    local ff="$srcdir/ffmpeg"
    cmake -B build -S "$srcdir/$_src/freeradio" -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_RPATH="$_libdir" \
        -DBUILD_TESTING=OFF \
        -DFREERADIO_FFMPEG_PROVIDER=EXPLICIT \
        -DFREERADIO_FFMPEG_INCLUDE_DIR="$ff/include" \
        -DFREERADIO_AVCODEC_LIBRARY="$ff/lib/libavcodec.so" \
        -DFREERADIO_AVFORMAT_LIBRARY="$ff/lib/libavformat.so" \
        -DFREERADIO_AVUTIL_LIBRARY="$ff/lib/libavutil.so" \
        -DFREERADIO_SWRESAMPLE_LIBRARY="$ff/lib/libswresample.so"
    cmake --build build
}

package() {
    # Installs the donutradio binary, the audio QML plugin, the desktop file, the
    # AppStream metainfo, the hicolor icons and the Plasma widget.
    DESTDIR="$pkgdir" cmake --install build

    # Private FFmpeg libraries. Each one finds its siblings through $ORIGIN.
    install -d "$pkgdir$_libdir"
    cp -a "$srcdir"/ffmpeg/lib/lib{avcodec,avformat,avutil,swresample}.so.* "$pkgdir$_libdir/"
    local lib
    for lib in "$pkgdir$_libdir"/*.so.*; do
        [[ -L "$lib" ]] || patchelf --set-rpath '$ORIGIN' "$lib"
    done
    install -Dm644 "$srcdir/ffmpeg-$_ffmpegver/COPYING.LGPLv2.1" \
        "$pkgdir/usr/share/licenses/$pkgname/FFmpeg-LGPL-2.1-or-later.txt"

    local plasmoid="$pkgdir/usr/share/plasma/plasmoids/online.donutsdelivery.donutradio"
    if [[ ! -f "$plasmoid/metadata.json" || ! -f "$plasmoid/contents/ui/main.qml" ]]; then
        error "Plasma widget was not installed"
        return 1
    fi
    if [[ ! -x "$pkgdir/usr/bin/donutradio" ]]; then
        error "donutradio binary was not installed"
        return 1
    fi
}
