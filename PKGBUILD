# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-dev
pkgver=1.9.8
pkgrel=1
pkgdesc='Official Telegram Desktop client - development release'
arch=('i686' 'x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('enchant' 'ffmpeg' 'hicolor-icon-theme' 'libappindicator-gtk3'
         'lz4' 'minizip' 'openal' 'qt5-imageformats' 'xxhash')
makedepends=('cmake' 'git' 'python' 'range-v3')
optdepends=('ttf-opensans: default Open Sans font family')

provides=('telegram-desktop')
conflicts=('telegram-desktop')
_commit="tag=v$pkgver"
#_commit="commit=COMMIT_SHA1"

source=(
    # Git repositories; might be adjusted when a build issue arise.
    "tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#$_commit"

    # All the submodules. I've generated them via:
    # git submodule foreach --quiet 'echo \"${name##*/}::git+`git remote get-url origin`\"' | sort
    "Catch::git+https://github.com/philsquared/Catch"
    "GSL::git+https://github.com/Microsoft/GSL.git"
    "QR::git+https://github.com/nayuki/QR-Code-generator"
    "cmake::git+https://github.com/desktop-app/cmake_helpers.git"
    "codegen::git+https://github.com/desktop-app/codegen.git"
    "expected::git+https://github.com/TartanLlama/expected"
    "helpers::git+https://github.com/desktop-app/gyp_helpers.git"
    "lib_base::git+https://github.com/desktop-app/lib_base.git"
    "lib_crl::git+https://github.com/desktop-app/lib_crl.git"
    "lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
    "lib_qr::git+https://github.com/desktop-app/lib_qr.git"
    "lib_rlottie::git+https://github.com/desktop-app/lib_rlottie.git"
    "lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
    "lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck"
    "lib_storage::git+https://github.com/desktop-app/lib_storage.git"
    "lib_tl::git+https://github.com/desktop-app/lib_tl.git"
    "lib_ui::git+https://github.com/desktop-app/lib_ui.git"
    "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
    "lz4::git+https://github.com/lz4/lz4.git"
    "rlottie::git+https://github.com/desktop-app/rlottie.git"
    "variant::git+https://github.com/mapbox/variant"
    "xxHash::git+https://github.com/Cyan4973/xxHash.git"

    # These files might require modifications to be up-to-date. If that is the
    # case, they will be updated in place and untracked temporarily.
    # No patch for now...!
)
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
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/tdesktop"
    git submodule init

    # Same magic as above.
    # git submodule foreach --quiet 'echo git config submodule.$name.url \"\$srcdir/${name##*/}\"' | sort
    git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch"
    git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
    git config submodule.Telegram/ThirdParty/QR.url "$srcdir/QR"
    git config submodule.Telegram/ThirdParty/expected.url "$srcdir/expected"
    git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
    git config submodule.Telegram/ThirdParty/lz4.url "$srcdir/lz4"
    git config submodule.Telegram/ThirdParty/rlottie.url "$srcdir/rlottie"
    git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
    git config submodule.Telegram/ThirdParty/xxHash.url "$srcdir/xxHash"
    git config submodule.Telegram/codegen.url "$srcdir/codegen"
    git config submodule.Telegram/gyp/helpers.url "$srcdir/helpers"
    git config submodule.Telegram/lib_base.url "$srcdir/lib_base"
    git config submodule.Telegram/lib_crl.url "$srcdir/lib_crl"
    git config submodule.Telegram/lib_lottie.url "$srcdir/lib_lottie"
    git config submodule.Telegram/lib_qr.url "$srcdir/lib_qr"
    git config submodule.Telegram/lib_rlottie.url "$srcdir/lib_rlottie"
    git config submodule.Telegram/lib_rpl.url "$srcdir/lib_rpl"
    git config submodule.Telegram/lib_spellcheck.url "$srcdir/lib_spellcheck"
    git config submodule.Telegram/lib_storage.url "$srcdir/lib_storage"
    git config submodule.Telegram/lib_tl.url "$srcdir/lib_tl"
    git config submodule.Telegram/lib_ui.url "$srcdir/lib_ui"
    git config submodule.cmake.url "$srcdir/cmake"

    # Magic is over!
    git submodule update

    # Cheating! Linking fixed patches to their usual place
    for fixed in $srcdir/*_fixed*
    do
        ln -s $fixed ${fixed/_fixed/}
    done

    # Patch here, if needed!
    # patch -Np1 -i "$srcdir/my_beautiful.patch"
}

build() {
    cd "$srcdir/tdesktop"

    export CXXFLAGS="$CXXFLAGS -ffile-prefix-map=$srcdir/tdesktop-$pkgver-full="

    # Before were used:
    # -DTDESKTOP_API_ID=17349
    # -DTDESKTOP_API_HASH=344583e45741c457fe1862106095a5eb

    cmake -B build -G "Unix Makefiles" . \
        -Ddisable_autoupdate=1 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_TEST=ON \
        -DDESKTOP_APP_USE_GLIBC_WRAPS=OFF \
        -DDESKTOP_APP_USE_PACKAGED=ON \
        -DDESKTOP_APP_USE_PACKAGED_RLOTTIE=OFF \
        -DDESKTOP_APP_DISABLE_CRASH_REPORTS=ON \
        -DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME=ON \
        -DTDESKTOP_DISABLE_DESKTOP_FILE_GENERATION=ON \
        -DTDESKTOP_USE_PACKAGED_TGVOIP=OFF \
        -DDESKTOP_APP_SPECIAL_TARGET="" \
        -DTDESKTOP_LAUNCHER_BASENAME="telegram-desktop"
    make -C build
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/tdesktop/build/bin/telegram-desktop" "$pkgdir/usr/bin/telegram-desktop"

    install -d "$pkgdir/usr/share/applications"
    install -m644 "$srcdir/tdesktop/lib/xdg/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegram-desktop.desktop"

    install -d "$pkgdir/usr/share/kservices5"
    install -m644 "$srcdir/tdesktop/lib/xdg/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"
    install -d "$pkgdir/usr/share/kde4/services"
    ln -s "/usr/share/kservices5/tg.protocol" "$pkgdir/usr/share/kde4/services"

    install -d "$pkgdir/usr/share/metainfo/"
    install -m644 "$srcdir/tdesktop/lib/xdg/telegramdesktop.appdata.xml" "$pkgdir/usr/share/metainfo/telegram-desktop.appdata.xml"

    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -d "$icon_dir"
        install -m644 "$srcdir/tdesktop/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegram-desktop.png"
    done
}
