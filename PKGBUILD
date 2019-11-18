# Maintainer: Auteiy <dmitry@auteiy.me>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=kotatogram-desktop
pkgver=1.1.1
pkgrel=1
pkgdesc="Experimental Telegram Desktop fork with option to select custom fonts."
arch=(x86_64)
url="https://github.com/kotatogram/kotatogram-desktop"
license=(GPL3)
depends=(
        ffmpeg
        hicolor-icon-theme
        minizip
        openal
        qt5-base
        qt5-imageformats
        openssl
        )
makedepends=(
        cmake
        git
        gyp
        range-v3
        python
        libappindicator-gtk3
        )
optdepends=(
        'libnotify: desktop notifications'
        )
conflicts=('kotatogram-desktop-bin' 'telegram-desktop' 'telegram-desktop-bin')
provides=('kotatogram-desktop')
source=(
        "$pkgname-$pkgver-$pkgrel::git+$url.git#tag=k$pkgver"
        "Catch2::git+https://github.com/catchorg/Catch2.git"
        "crl::git+https://github.com/telegramdesktop/crl.git"
        "GSL::git+https://github.com/Microsoft/GSL.git"
        "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
        "lz4::git+https://github.com/lz4/lz4.git"
        "rlottie::git+https://github.com/desktop-app/rlottie.git"
        "variant::git+https://github.com/mapbox/variant"
        "xxHash::git+https://github.com/Cyan4973/xxHash.git"
        "codegen::git+https://github.com/desktop-app/codegen.git"
        "lib_base::git+https://github.com/desktop-app/lib_base.git"
        "lib_crl::git+https://github.com/desktop-app/lib_crl"
        "lib_lottie::git+https://github.com/desktop-app/lib_lottie"
        "lib_rlottie::git+https://github.com/desktop-app/lib_rlottie"
        "lib_rpl::git+https://github.com/desktop-app/lib_rpl"
        "lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck"
        "lib_tl::git+https://github.com/desktop-app/lib_tl"
        "lib_ui::git+https://github.com/kotatogram/lib_ui.git"

        "CMakeLists.inj"
        "no-gtk2.patch"
        "tdesktop.patch"
        "https://raw.githubusercontent.com/kotatogram/kotatogram-desktop/k$pkgver/lib/xdg/tg.protocol"

       )
# Checksums automatically set in CI, see: /.gitlab-ci.yml
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
            '98236f7f161c8bad1152a77505f9c3eebae06ffc0420ed476e101359a92d01438dd6ce6062e0b110b76f2d6d09f59accf4b1969699b8af5a3650ecb0c31929c5'
            '117b0c2bae3d3d3aa94d41382621be4e05c3314a2831dba59e1bcfb443e7b8ff4bcd0403544fa0cb6def85b444146bf59eef9da25f96b041d3ce8f5429b4a867'
            'f667b00f4c2e02799d3a130f1370bbe13866294329164c9fee901fa54655e4ebfaaae4e0f15327b660b10248c6a087dd2fa53d9f72714ba099ea2cbf4d07ca32'
            'e54c2f5a4cdeff5850828072890679e07da07cfa3663cf9bfb1e6b8f5bca0dc15e6b4b9a2a6c111b796a0440035beea419cda9bf4ec5d476d4fbb54c1b4ad7fd')
        

prepare() {
    cd "$srcdir/$pkgname-$pkgver-$pkgrel"
        git submodule init
        
        git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch2"
        git config submodule.Telegram/ThirdParty/crl.url "$srcdir/crl"
        git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
        git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
        git config submodule.Telegram/ThirdParty/lz4.url "$srcdir/lz4"
        git config submodule.Telegram/ThirdParty/minizip.url "$srcdir/minizip"
        git config submodule.Telegram/ThirdParty/rlottie.url "$srcdir/rlottie"
        git config submodule.Telegram/ThirdParty/SPMediaKeyTap.url "$srcdir/SPMediaKeyTap"
        git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
        git config submodule.Telegram/ThirdParty/xxHash.url "$srcdir/xxHash"
        
        git config submodule.Telegram/codegen.url "$srcdir/codegen"
        git config submodule.Telegram/lib_base.url "$srcdir/lib_base"
        git config submodule.Telegram/lib_crl.url "$srcdir/lib_crl"
        git config submodule.Telegram/lib_lottie.url "$srcdir/lib_lottie"
        git config submodule.Telegram/lib_rlottie.url "$srcdir/lib_rlottie"
        git config submodule.Telegram/lib_rpl.url "$srcdir/lib_rpl"
        git config submodule.Telegram/lib_spellcheck.url "$srcdir/lib_spellcheck"
        git config submodule.Telegram/lib_tl.url "$srcdir/lib_tl"
        git config submodule.Telegram/lib_ui.url "$srcdir/lib_ui"

        git submodule update

        patch -Np1 -i "$srcdir/no-gtk2.patch"
        patch -Np1 -i "$srcdir/tdesktop.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver-$pkgrel"
        export LANG=en_US.UTF-8
        export GYP_DEFINES="DESKTOP_APP_DISABLE_CRASH_REPORTS,TDESKTOP_DISABLE_AUTOUPDATE,TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME,TDESKTOP_DISABLE_DESKTOP_FILE_GENERATION"
        export EXTRA_FLAGS="-Winvalid-pch"
        export CPPFLAGS="$CPPFLAGS $EXTRA_FLAGS"
        export CXXFLAGS="$CXXFLAGS $EXTRA_FLAGS"

# Telegram requires us to set API_ID and API_HASH for some reason but they do not provide a way to receive a pair
# See https://github.com/telegramdesktop/tdesktop/commit/65b2db216033aa08b7bc846df27843e566f08981 and
# https://github.com/telegramdesktop/tdesktop/issues/4717
# The official API_ID seems to be 2040 while the API_HASH is "b18441a1ff607e10a989891a5462e627".
# We're going to use the defaults for now but might at some point use the official ones from the official binaries as noted above.

        gyp \
        -Dapi_id=17349 \
        -Dapi_hash=344583e45741c457fe1862106095a5eb \
        -Dbuild_defines=${GYP_DEFINES} \
        -Gconfig=Release \
        --depth=Telegram/gyp --generator-output=../.. -Goutput_dir=out Telegram/gyp/Telegram.gyp --format=cmake
        NUM=$((`wc -l < out/Release/CMakeLists.txt` - 2))
        sed -i "$NUM r ../CMakeLists.inj" out/Release/CMakeLists.txt
        cd "$srcdir/$pkgname-$pkgver-$pkgrel/out/Release"
        cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -UTDESKTOP_OFFICIAL_TARGET
        make
}

package() {
    install -dm755 "$pkgdir/usr/bin"
        install -m755 "$srcdir/$pkgname-$pkgver-$pkgrel/out/Release/Telegram" "$pkgdir/usr/bin/kotatogram-desktop"

        install -d "$pkgdir/usr/share/applications"
        install -m644 "$srcdir/$pkgname-$pkgver-$pkgrel/lib/xdg/kotatogramdesktop.desktop" "$pkgdir/usr/share/applications/kotatogramdesktop.desktop"

        install -d "$pkgdir/usr/share/kservices5"
        install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

        local icon_size icon_dir
        for icon_size in 16 32 48 64 128 256 512; do
            icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

                install -d "$icon_dir"
                install -m644 "$srcdir/$pkgname-$pkgver-$pkgrel/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/kotatogram.png"
                done
}
