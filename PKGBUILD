# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>
pkgname=telegram-desktop-userfonts
pkgver=4.8.3
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash' 'glibmm-2.68'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'glib2' 'boost' 'fmt')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        expected-lite-$pkgver.tar.gz::https://github.com/martinmoene/expected-lite/archive/refs/tags/v0.6.3.tar.gz
        https://gitlab.com/mnauw/cppgir/-/archive/960fe054ffaab7cf55722fea6094c56a8ee8f18e/cppgir-960fe054ffaab7cf55722fea6094c56a8ee8f18e.tar.gz
        https://github.com/desktop-app/cmake_helpers/commit/6b0eeb2c15aa278ffa577bcefebcff8f2c98aca9.patch)
sha512sums=('11fdd39319d1fdae07094d0ab2cb919355015bee14567d88daf98f9e5332bfee7a938415800397e6f24224e97f6425fe0a1d7549d7de14b63f84ab7cb7741872'
            'd6a4f30f90494dda002ad27d227f17ce0201752178418d7dfada26441e853590d46816c88922e7d458dda68ad4414ddfe6b7fa4ed2a5854e4e3b22675b13f92a'
            '8ed54513511ec8ce6d7c9c311924b6d662102ffec3af75ccc8c4ebc6d48aaf162fd004b9c5fd31e50b83bc5872e82674eeaa2766423d9dc7d2338eb941ae8d40'
            '6d69aae0b470ac4d6cc90cfc241b185c6c483065cae8ff94532950bec2b7047d95f0c5002f460e09d8143f723ad7e1b2c767c2725ac0d456a64b78702bf510ea')

prepare() {
    # I know this is ugly but I couldn't figure out how to make it eat the system cppgir :(
    mkdir tdesktop-$pkgver-full/cmake/external/glib/cppgir/expected-lite
    tar xf "$srcdir"/expected-lite-$pkgver.tar.gz -C tdesktop-$pkgver-full/cmake/external/glib/cppgir/expected-lite --strip-components 1
    tar xf "$srcdir"/cppgir-960fe054ffaab7cf55722fea6094c56a8ee8f18e.tar.gz -C tdesktop-$pkgver-full/cmake/external/glib/cppgir --strip-components 1
    patch -Np1 -d tdesktop-$pkgver-full/cmake -i "$srcdir"/6b0eeb2c15aa278ffa577bcefebcff8f2c98aca9.patch


    cd tdesktop-$pkgver-full

    for ttf in Telegram/lib_ui/fonts/*.ttf; do
        rm $ttf
        touch $ttf
    done
    sed -i 's/DemiBold/Bold/g' Telegram/lib_ui/ui/style/style_core_font.cpp
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'
    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake -B build -S tdesktop-$pkgver-full -G Ninja \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
