# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>
pkgname=kotatogram-desktop
pkgver=1.4
pkgrel=1
pkgdesc='Kotatogram – experimental Telegram Desktop fork'
arch=('x86_64')
url="https://kotatogram.github.io"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'gtk3' 'glibmm')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'libtg_owt')
conflicts=('kotatogram-desktop-bin' 'kotatogram-desktop-dynamic-bin')
source=("${pkgname}::git+https://github.com/kotatogram/${pkgname}.git#tag=k${pkgver}"
        "${pkgname}-libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
        "${pkgname}-rlottie::git+https://github.com/desktop-app/rlottie.git"
        "${pkgname}-lib_crl::git+https://github.com/desktop-app/lib_crl.git"
        "${pkgname}-lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
        "${pkgname}-lib_base::git+https://github.com/kotatogram/lib_base.git"
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
            '13357d081fb658c735bb2575360f5d48214e1cf5002719ba410405a2fe05c7c3d2379588c2ca3c2ca6a5e6ff64e01e6d1ff3aecdaee8f3dd0519a64f6ee94182')

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
    git config sumbodule.Telegram/lib_webrtc.url "${srcdir}/${pkgname}-lib_webrtc"
    git config sumbodule.Telegram/ThirdParty/tgcalls.url "${srcdir}/${pkgname}-tgcalls"
    git submodule update

    pushd cmake
    # force webrtc link to libjpeg
    echo "target_link_libraries(external_webrtc INTERFACE jpeg)" | tee -a external/webrtc/CMakeLists.txt
    popd

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
