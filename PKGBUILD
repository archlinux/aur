# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>
pkgname=kotatogram-desktop
pkgver=1.4.5
pkgrel=1
pkgdesc='Kotatogram – experimental Telegram Desktop fork'
arch=('x86_64')
url="https://kotatogram.github.io"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland' 'libdbusmenu-qt5' 'xxhash' 'kwayland' 'glibmm'
         'rnnoise' 'jemalloc' 'libtg_owt')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
            'extra-cmake-modules' 'webkit2gtk')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
conflicts=('kotatogram-desktop-bin' 'kotatogram-desktop-dynamic-bin')
source=("${pkgname}::git+https://github.com/kotatogram/${pkgname}.git#tag=k${pkgver}"
        "${pkgname}-libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
        "${pkgname}-rlottie::git+https://github.com/desktop-app/rlottie.git"
        "${pkgname}-lib_crl::git+https://github.com/desktop-app/lib_crl.git"
        "${pkgname}-lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
        "${pkgname}-lib_base::git+https://github.com/desktop-app/lib_base.git"
        "${pkgname}-codegen::git+https://github.com/desktop-app/codegen.git"
        "${pkgname}-lib_ui::git+https://github.com/kotatogram/lib_ui.git"
        "${pkgname}-lib_rlottie::git+https://github.com/desktop-app/lib_rlottie.git"
        "${pkgname}-lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
        "${pkgname}-lib_tl::git+https://github.com/desktop-app/lib_tl.git"
        "${pkgname}-lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck"
        "${pkgname}-lib_storage::git+https://github.com/desktop-app/lib_storage.git"
        "${pkgname}-cmake_helpers::git+https://github.com/kotatogram/cmake_helpers.git"
        "${pkgname}-QR-Code-generator::git+https://github.com/nayuki/QR-Code-generator"
        "${pkgname}-lib_qr::git+https://github.com/desktop-app/lib_qr.git"
        "${pkgname}-lib_webrtc::git+https://github.com/desktop-app/lib_webrtc.git"
        "${pkgname}-tgcalls::git+https://github.com/TelegramMessenger/tgcalls.git"
        "${pkgname}-lib_webview::git+https://github.com/desktop-app/lib_webview.git"
        "${pkgname}-lib_waylandshells::git+https://github.com/desktop-app/lib_waylandshells.git"
        "0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6d230d9b4ec64911635f3cb4b301b94ef101722480e0a890704a66f3ed8d610fab985dcb890f006cc774665ba2f3b9546e17ba8342560b11c06d3c6b0b9a96ad')

prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.Telegram/ThirdParty/libtgvoip.url "${srcdir}/${pkgname}-libtgvoip"
    git config submodule.Telegram/ThirdParty/rlottie.url "${srcdir}/${pkgname}-rlottie"
    git config submodule.Telegram/lib_crl.url "${srcdir}/${pkgname}-lib_crl"
    git config submodule.Telegram/lib_rpl.url "${srcdir}/${pkgname}-lib_rpl"
    git config submodule.Telegram/lib_base.url "${srcdir}/${pkgname}-lib_base"
    git config submodule.Telegram/codegen.url "${srcdir}/${pkgname}-codegen"
    git config submodule.Telegram/lib_ui.url "${srcdir}/${pkgname}-lib_ui"
    git config submodule.Telegram/lib_rlottie.url "${srcdir}/${pkgname}-lib_rlottie"
    git config submodule.Telegram/lib_lottie.url "${srcdir}/${pkgname}-lib_lottie"
    git config submodule.Telegram/lib_tl.url "${srcdir}/${pkgname}-lib_tl"
    git config submodule.Telegram/lib_spellcheck.url "${srcdir}/${pkgname}-lib_spellcheck"
    git config submodule.Telegram/lib_storage.url "${srcdir}/${pkgname}-lib_storage"
    git config submodule.cmake.url "${srcdir}/${pkgname}-cmake_helpers"
    git config submodule.Telegram/ThirdParty/QR.url "${srcdir}/${pkgname}-QR-Code-generator"
    git config submodule.Telegram/lib_qr.url "${srcdir}/${pkgname}-lib_qr"
    git config submodule.Telegram/lib_webrtc.url "${srcdir}/${pkgname}-lib_webrtc"
    git config submodule.Telegram/ThirdParty/tgcalls.url "${srcdir}/${pkgname}-tgcalls"
    git config submodule.Telegram/lib_webview.url "${srcdir}/${pkgname}-lib_webview"
    git config submodule.Telegram/lib_waylandshells.url "${srcdir}/${pkgname}-lib_waylandshells"
    git submodule update

    patch -p1 < ${srcdir}/0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -B build -G Ninja . \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_TEST=ON

    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="$pkgdir" cmake --install build
}
