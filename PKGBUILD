# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: MedzikUser <nivua1fn@duck.com>

pkgname=forkgram
_pkgname=frk
pkgver=4.0.2
pkgrel=2
pkgdesc='Fork of Telegram Desktop messaging app.'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/Forkgram/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg4.4' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland' 'libdbusmenu-qt5' 'xxhash' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=("telegram-desktop")
conflicts=("telegram-desktop" "tdesktop-x64")
replaces=("tdesktop-x64")
source=("https://github.com/Forkgram/tdesktop/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-full.tar.gz"
        "fix-tgcalls-cstdint.patch"
        "0001-kde-theme-injection-fix.patch"
        "0002-qt5-wayland-generator.patch")
sha512sums=('cef91009724533c1775f52693570b39cad9417c6c825310cfa38d40d8c5f327f9940e116b8955d257ed872d5b36482ff49a893a0d9402c7f039c82546b707afc'
            'ba24a2f1524010b4891764aacee2e27a5ebae44cf7626ab2aaf9e6c48b0f8088bf920886ceeb497b3c463fa0c3b885dd63db273d4c29cab6c96c8193c0c5c888'
            'ceb8135301abbb39dd1e88bb283f83e83c52ec6236f13b527ed25a138f1d870d35ecd9f1c4e080164320f0b34c30d882b1167e0ef4ded7f886f9ba0966570e4d'
            '12a646b0c31c67019c061aae7924031057583a4ff0df98e4ddb5132395321ecd5fce2ba90d3463d0c4da9fe6ab6f4c091287cf8ca8d9d90c279bc9d6c48ab28b')

prepare() {
    cd $_pkgname-v$pkgver-full

    patch -Np1 -i "$srcdir"/fix-tgcalls-cstdint.patch -d Telegram/ThirdParty/tgcalls
    patch -Np1 -i "$srcdir"/0001-kde-theme-injection-fix.patch
    patch -Np1 -i "$srcdir"/0002-qt5-wayland-generator.patch -d Telegram/lib_base
}

build() {
    cd $_pkgname-v$pkgver-full

    # Fix https://bugs.archlinux.org/task/73220
    export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"

    export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
    #Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake \
        -B build \
        -G Ninja \
        -DDESKTOP_APP_QT6=off \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    # Use Qt5 for the time being until mouse is not so broken (QTBUG-98720).
    sed -i "s|/usr/lib/libav|/usr/lib/ffmpeg4.4/libav|g" build/build.ninja
    sed -i "s|/usr/lib/libsw|/usr/lib/ffmpeg4.4/libsw|g" build/build.ninja
    sed -i "s|-lavcodec|/usr/lib/ffmpeg4.4/libavcodec.so|g" build/build.ninja
    sed -i "s|-lavformat|/usr/lib/ffmpeg4.4/libavformat.so|g" build/build.ninja
    sed -i "s|-lavutil|/usr/lib/ffmpeg4.4/libavutil.so|g" build/build.ninja
    sed -i "s|-lswscale|/usr/lib/ffmpeg4.4/libswscale.so|g" build/build.ninja
    sed -i "s|-lswresample|/usr/lib/ffmpeg4.4/libswresample.so|g" build/build.ninja
    ninja -C build
}

package() {
    cd $_pkgname-v$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
    # They botched the release and put a lot of stuff here.
    rm -rf "$pkgdir/build"
}
