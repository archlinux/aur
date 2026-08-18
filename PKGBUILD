pkgname=vidmetric-git
pkgver=10e4a68
pkgrel=1
pkgdesc="A high-performance Qt-based GUI for visual comparison and technical metric analysis of video files, powered by FFmpeg and ab-av1"
arch=('x86_64')
url="https://github.com/j-convey/VidMetric"
license=('custom')  # no license file in repo
depends=('ffmpeg' 'ab-av1')
makedepends=('git' 'cmake' 'make' 'qt6-base' 'qt6-tools')
optdepends=('oxipng: optimizing the icons')
provides=('vidmetric')
source=("git+https://github.com/j-convey/VidMetric.git")
sha256sums=('SKIP')

pkgver() {
    cd VidMetric
    git describe --tags --always | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare(){
    cd VidMetric
    if command -v oxipng >/dev/null 2>&1; then
        oxipng -o max -r -p -s -v -t $(nproc) -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 resources
    else
        echo "WARNING: oxipng not found. Skipping icon optimization."
    fi
}

build() {
    cd VidMetric

    ld_extra_flags=""

    if command -v clang >/dev/null 2>&1; then
        export CC=clang
        export CXX=clang++
        export LD=ld.lld
        ld_extra_flags="-fuse-ld=lld"
    else
        export CC=gcc
        export CXX=g++
        if command -v mold >/dev/null 2>&1; then
            export LD=mold
            ld_extra_flags="-fuse-ld=mold"
        elif command -v ld.lld >/dev/null 2>&1; then
            export LD=ld.lld
            ld_extra_flags="-fuse-ld=lld"
        fi
    fi

    export CFLAGS="-O3 -march=native -mtune=native \
                    -falign-functions=32 -falign-loops=32 \
                    -fno-math-errno -fno-trapping-math \
                    -fno-semantic-interposition \
                    -fomit-frame-pointer -fno-plt \
                    -pipe -flto -Wall -Wno-unused \
                    -fstrict-aliasing -fno-rtti -fno-exceptions \
                    -fstrict-vtable-pointers -fno-asynchronous-unwind-tables \
                    -fmerge-all-constants -ffunction-sections \
                    -fdata-sections"

    export CXXFLAGS="$CFLAGS"
    export LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt $ld_extra_flags"

    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_COMPILER="$CC" \
        -DCMAKE_CXX_COMPILER="$CXX" \
        -DCMAKE_LINKER="${LD:-}" \
        -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
        -DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS"

    cmake --build build --target VidMetric --parallel $(nproc)
}

package() {
    cd VidMetric

    install -Dm755 build/bin/VidMetric "$pkgdir/usr/bin/vidmetric"

    # Icon
    install -d "$pkgdir/usr/share/icons/hicolor/32x32/apps"
    if [[ -f resources/ffmpeg-icon.png ]]; then
        ffmpeg -y -hide_banner -loglevel error -i resources/ffmpeg-icon.png -vf scale=32:32 -update 1 \
            "$pkgdir/usr/share/icons/hicolor/32x32/apps/vidmetric.png"
    else
        ffmpeg -y -hide_banner -loglevel error -i resources/ffmpeg-icon.ico -vf scale=32:32 -update 1 \
            "$pkgdir/usr/share/icons/hicolor/32x32/apps/vidmetric.png"
    fi

    # Desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/vidmetric.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=VidMetric
Comment=Visual comparison and metric analysis of video files
Exec=vidmetric
Icon=vidmetric
Terminal=false
StartupNotify=true
Categories=AudioVideo;Video;Utility;
EOF
}
