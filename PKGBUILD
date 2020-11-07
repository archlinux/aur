# Maintainer: Sameer Hoosen <tabhooked@gmail.com>
# Official package maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Based on telegram-desktop-dev by: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: hexchain <i@hexchain.org>

# Thanks to Dan Elkouby <streetwalrus@codewalr.us> for some of the custom patch ideas!
# https://github.com/Streetwalrus/dotfiles/blob/master/scripts/telegram-desktop

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-udf-patched
pkgver=2.4.7
pkgrel=1
pkgdesc='Telegram Desktop client with several personal patches'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=(
    'hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
    'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'qt5-wayland' 'gtk3'
)
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'libwebrtc')
optdepends=('ttf-opensans: default Open Sans font family')
provides=('telegram-desktop')
conflicts=('telegram-desktop')

source=(
    "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
    "Use-tg_owt-webrtc-fork.patch"
    "Update-webrtc-packaged-build-for-tg_owt.patch::https://github.com/desktop-app/cmake_helpers/commit/d955882cb4d4c94f61a9b1df62b7f93d3c5bff7d.patch"
    "Add_external_jpeg.patch::https://github.com/desktop-app/cmake_helpers/commit/ed9fa2e798a1f175840479417d760c51181959b8.patch"
    # Custom patches
    "always_delete_for_everyone.patch"
    "always_clear_history_for_everyone.patch"
    "always_pin_without_notify.patch"
    "always_send_as_photo_or_album.patch"
    "force_gtk_integration.patch"
)
sha512sums=(
    '712ab6896f89f7df0c7ac297039ee3b3532c159e17f66e4539b701a35d04d4709b558755d592d3cd91df541a2d2ca9f0485cf073c32f0b69a18848ab2ccd1993'
    '071591c6bb71435f8186dcaf570703718051f00366dbbe3f13c4df3706d3de1f168bff4bfa707ad1d6f09f5505c925f0b01d76fd65efe904f3ba7db693d63f43'
    'b3c44e76a3907f7acc197746b471564577e912bf0561e9576dc8459211c88f400716437bcaa10967376461c69c8a98a56477d26d3feb9ca34747d9208bf5f6c6'
    '3891f191f720e77d463365d1415ff8c20866d0d898909dcbe757d334c582c38975d47c33e82ae54e3cfbce7f46c257e9f2eb76b673a76c37446ecf1e9a9c681b'
    # Custom patches
    'e88fa96024efc6176c818d0a46684e0ee1fb3a7bdadb323ad3b29f736209c80b6c31b135cf84389e7e2bbd614e57b241e4437c94b6fd114e73cfc418bf130015'
    '4a7e9de924bbf32fb4cd24ffa2764bcf49e0540bba649829b180da20a62810d4a21ebf11529d4eca22c9ceaa93b434ca3fbfd0b636795f8109ea4e1eddbff8f3'
    'fb69ecf4de4c57f4f226be6e704ceb811916715c23a5908d8c2d21970676df64c86b58123429b55c43dafea89f92da33119fa71988df6912f8fcd07ba2c8579c'
    'fbf1c8311ead2a63471fcf5a17156ca4b5d1b582c7cd838fd97fafeca79146670d0a73805a144a9a0ab12a33ec5a0ec4c5cbeb07c6a9e3878fe293edd428b91c'
    '17faeff3ee56edd63be658c3730dbbed26437cb9bf0a9890d16cae26fd500aaab738b66de57b573903a5bd727dafe65105e151b08d7a6d8c426c148e754a7114'
)

prepare() {
    cd tdesktop-$pkgver-full/cmake
    patch -R -Np1 -i ${srcdir}/Add_external_jpeg.patch
    patch -R -Np1 -i ${srcdir}/Update-webrtc-packaged-build-for-tg_owt.patch
    patch -R -Np1 -i ${srcdir}/Use-tg_owt-webrtc-fork.patch
    sed 's|set(webrtc_build_loc ${webrtc_loc}/out/$<CONFIG>/obj)|set(webrtc_build_loc /usr/lib)|' -i external/webrtc/CMakeLists.txt

    cd "$srcdir/tdesktop-$pkgver-full"
    # custom patches
    patch -Np1 -i "$srcdir/always_delete_for_everyone.patch"
    patch -Np1 -i "$srcdir/always_clear_history_for_everyone.patch"
    patch -Np1 -i "$srcdir/always_pin_without_notify.patch"
    patch -Np1 -i "$srcdir/always_send_as_photo_or_album.patch"
    patch -Np1 -i "$srcdir/force_gtk_integration.patch"
}

build() {
    cd tdesktop-$pkgver-full

    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake . \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c \
        -DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME=ON \
        -DTDESKTOP_LAUNCHER_BASENAME="telegramdesktop" \
        -DDESKTOP_APP_SPECIAL_TARGET="" \
        -DDESKTOP_APP_WEBRTC_LOCATION=/usr/include/libwebrtc
    ninja -C build
}

package() {
    cd tdesktop-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
