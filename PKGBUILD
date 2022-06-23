# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: MedzikUser <nivua1fn@duck.com>

pkgname=forkgram
_pkgname=frk
pkgver=4.0.0
pkgrel=1
pkgdesc='Fork of Telegram Desktop messaging app.'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/Forkgram/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg4.4' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat' 'xxhash' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt')
optdepends=('gtk3: GTK environment integration'
            'webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=("telegram-desktop")
conflicts=("telegram-desktop" "tdesktop-x64")
replaces=("tdesktop-x64")
source=("https://github.com/Forkgram/tdesktop/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-full.tar.gz"
		"fix-tgcalls-cstdint.patch")
sha512sums=('54f864171d46ba93cb0cd9137e91fe072a3795e82315825684d0e8a577ff1006378d716500d28b546fe52128ebaaf94a6966e528848b37ac03c058615f9be397'
            'ba24a2f1524010b4891764aacee2e27a5ebae44cf7626ab2aaf9e6c48b0f8088bf920886ceeb497b3c463fa0c3b885dd63db273d4c29cab6c96c8193c0c5c888')

prepare() {
    cd $_pkgname-v$pkgver-full

    patch -Np1 -i "$srcdir"/fix-tgcalls-cstdint.patch -d Telegram/ThirdParty/tgcalls
}

build() {
    cd $_pkgname-v$pkgver-full

    # Fix https://bugs.archlinux.org/task/73220
    export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"

    export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

    # Official API ID&Hash by default
    cmake . \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON

    # Hack to compile for ffmpeg4.4
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
}
