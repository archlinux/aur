# Maintainer: buj <buj351@outlook.com>
pkgname=voidsprite-git 
_pkgver=07.12.2025
pkgver=0.0.0+git
pkgrel=4
pkgdesc='Free pixelart editor made in SDL3 C++'
url='https://github.com/counter185/voidsprite'
source=('voidsprite::git+https://github.com/counter185/voidsprite.git')
arch=('i686' 'x86_64')
conflicts=('voidsprite')
provides=('voidsprite')
sha256sums=(SKIP)
depends=(pugixml xdg-utils libjxl)
makedepends=(git gcc ninja python mold
             # SDL3 deps
             alsa-lib cmake hidapi ibus jack libdecor libthai fribidi libgl libpulse libusb libx11
             libxcursor libxext libxfixes libxi libxinerama libxkbcommon libxrandr libxrender libxss
             libxtst mesa ninja pipewire sndio vulkan-driver vulkan-headers wayland wayland-protocols
             nasm)
license=(GPL-2.0-only)

pkgver() {
    cd "$srcdir/voidsprite"
    echo $(TZ=UTC0 git show -1 --no-patch --format=%ci --date=local | cut -f1 -d\ | tr - .)+git
}

build() {
    cd "$srcdir/voidsprite/cmake"
    ./setup_cmake.sh
    cmake -DVOIDSPRITE_ASSETS_PATH=/usr/share/voidsprite -G Ninja -B build \
        -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=mold" -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=mold" \
        -DVOIDSPRITE_UNITY_BUILD=OFF .
    cd build && ninja
}

package() {
    mkdir -p "$pkgdir/usr/share/voidsprite" "$pkgdir"/usr/{bin,share/{applications,licenses/voidsprite,metainfo,mime/packages,icons/hicolor,voidsprite,thumbnailers}}
    install -m755 "$srcdir/voidsprite/cmake/build/src/voidsprite" "$pkgdir/usr/bin/voidsprite"
    for x in appfont-MPLUSRounded1c-Medium.ttf appfontcyr-ZenKakuGothicNew-Medium.ttf appfontjp-NotoSansJP-Medium.ttf; do
        install -m644 "$srcdir/voidsprite/cmake/build/src/$x" "$pkgdir/usr/share/voidsprite/$x"
    done
    cp -r "$srcdir/voidsprite/cmake/build/src/assets" "$pkgdir/usr/share/voidsprite/assets"
    cat "$srcdir"/voidsprite/freesprite/linux/com.github.counter185.voidsprite.desktop | \
        sed 's/Exec=voidsprite/Exec=\/usr\/bin\/voidsprite/g' > "$pkgdir/usr/share/applications/voidsprite.desktop"
    install -m644 "$srcdir/voidsprite/LICENSE" "$pkgdir/usr/share/licenses/voidsprite/LICENSE"

    for x in $(ls "$srcdir/voidsprite/OPEN_SOURCE_LICENSES"); do
        install -m644 "$srcdir/voidsprite/OPEN_SOURCE_LICENSES/$x" "$pkgdir/usr/share/licenses/voidsprite/$(echo "$x" | sed 's/License/LICENSE/g')"
    done

    install -m644 "$srcdir/voidsprite/freesprite/linux/com.github.counter185.voidsprite.metainfo.xml" "$pkgdir/usr/share/metainfo/com.github.counter185.voidsprite.metainfo.xml"
    install -m644 "$srcdir/voidsprite/freesprite/linux/voidsn.xml" "$pkgdir/usr/share/mime/packages/voidsn.xml"

    for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
        mkdir -p "$pkgdir"/usr/share/icons/hicolor/"$size"/apps/
        install -m644 "$srcdir/voidsprite/freesprite/linux/icons/$size.png" "$pkgdir"/usr/share/icons/hicolor/"$size"/apps/com.github.counter185.voidsprite.png
    done

    install -m644 "$srcdir/voidsprite/freesprite/linux/voidsprite.thumbnailer" "$pkgdir/usr/share/thumbnailers/voidsprite.thumbnailer"
    install -m644 "$srcdir/voidsprite/freesprite/linux/voidsprite_thumbnailer" "$pkgdir/usr/share/voidsprite/thumbnailer"
}

