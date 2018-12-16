# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Official package maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-dev
pkgver=1.5.2
pkgrel=1
pkgdesc='Official Telegram Desktop client - development release'
arch=('i686' 'x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=(desktop-file-utils ffmpeg hicolor-icon-theme minizip openal openssl
         qt5-base qt5-imageformats)
makedepends=(cmake git gyp libappindicator-gtk3 python range-v3)
optdepends=('libnotify: desktop notifications')
provides=('telegram-desktop')
conflicts=('telegram-desktop')
_commit="tag=v$pkgver"
#_commit="commit=46946c73236285649950071632beb3f3e855b2ea"
source=(
    # Git repositories; might be adjusted when a build issue arise.
    "tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#$_commit"
    "Catch::git+https://github.com/philsquared/Catch.git"
    "crl::git+https://github.com/telegramdesktop/crl.git"
    "GSL::git+https://github.com/Microsoft/GSL.git"
    "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip.git"
    "variant::git+https://github.com/mapbox/variant.git"
    "xxHash::git+https://github.com/Cyan4973/xxHash.git"
    # These files might require modifications to be up-to-date. If that is the
    # case, they will be updated in place and untracked temporarily.
    "CMakeLists.inj::https://git.archlinux.org/svntogit/community.git/plain/trunk/CMakeLists.inj?h=packages/telegram-desktop"
    "tdesktop.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/tdesktop.patch?h=packages/telegram-desktop"
    "libtgvoip.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/libtgvoip.patch?h=packages/telegram-desktop"
    "no-gtk2.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/no-gtk2.patch?h=packages/telegram-desktop"
    "demibold.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/demibold.patch?h=packages/telegram-desktop"
    "Use-system-wide-font.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/Use-system-wide-font.patch?h=packages/telegram-desktop"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'f37f7827e10557d1e74b58b81eb0d17102e1c0f193d129e6e8edbbf7284f5867'
            'bb04b1eea47370d5f1e45ac851bed81c728e4b52890efd94d511ed59847c9a61'
            '4dd2b1674b1a5bcfc5b640612278fe3a53b454192fbcc06b7476ff54ed6d2f6d'
            '95efc9cd84c2c26bddd832ef8c88637353ed9ba9d9068f183b7ee48ba25d1cc7'
            '3f23161f8239893e82d2a4f655cb80523a558a4e7869a6683802c2f434b68bbf'
            '2457746d9b963c77decd5d8b08498035dc1003fbcbc95d4dfdb11bf524954f13')

prepare() {
    cd "$srcdir/tdesktop"
    git submodule init
    git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch"
    git config submodule.Telegram/ThirdParty/crl.url "$srcdir/crl"
    git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
    git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
    git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
    git config submodule.Telegram/ThirdParty/xxHash.url "$srcdir/xxHash"
    git submodule update

    # Cheating! Linking fixed patches to their usual place
    for fixed in $srcdir/*_fixed*
    do
        ln -s $fixed ${fixed/_fixed/}
    done

    patch -Np1 -i "$srcdir/tdesktop.patch"
    patch -Np1 -i "$srcdir/no-gtk2.patch"
    patch -R -Np1 -i "$srcdir/demibold.patch"
    patch -Np1 -i "$srcdir/Use-system-wide-font.patch"

    cd "Telegram/ThirdParty/libtgvoip"
    patch -Np1 -i "$srcdir/libtgvoip.patch"
}

build() {
    cd "$srcdir/tdesktop"
    export LANG=en_US.UTF-8
    export GYP_DEFINES="TDESKTOP_DISABLE_CRASH_REPORTS,TDESKTOP_DISABLE_AUTOUPDATE,TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME,TDESKTOP_DISABLE_DESKTOP_FILE_GENERATION"
    export EXTRA_FLAGS="-Winvalid-pch"
    export CPPFLAGS="$CPPFLAGS $EXTRA_FLAGS"
    export CXXFLAGS="$CXXFLAGS $EXTRA_FLAGS"

    # Telegram requires us to set API_ID and API_HASH for some reason but they do not provide a way to receive a pair
    # See https://github.com/telegramdesktop/tdesktop/commit/65b2db216033aa08b7bc846df27843e566f08981 and
    # https://github.com/telegramdesktop/tdesktop/issues/4717
    # The official API_ID seems to be 2040 while the API_HASH is "b18441a1ff607e10a989891a5462e627".
    # We're going to use the defaults for now but might at some point use the official ones from the official binaries as noted above.
    export API_FLAGS="-Dapi_id=17349 -Dapi_hash=344583e45741c457fe1862106095a5eb"

    gyp \
        -Dbuild_defines=${GYP_DEFINES} \
        ${API_FLAGS} \
        -Gconfig=Release \
        --depth=Telegram/gyp --generator-output=../.. -Goutput_dir=out Telegram/gyp/Telegram.gyp --format=cmake
    NUM=$((`wc -l < out/Release/CMakeLists.txt` - 2))
    sed -i "$NUM r ../CMakeLists.inj" out/Release/CMakeLists.txt
    cd "$srcdir/tdesktop/out/Release"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/tdesktop/out/Release/Telegram" "$pkgdir/usr/bin/telegram-desktop"

    install -d "$pkgdir/usr/share/applications"
    install -m644 "$srcdir/tdesktop/lib/xdg/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegram-desktop.desktop"

    install -d "$pkgdir/usr/share/kservices5"
    install -m644 "$srcdir/tdesktop/lib/xdg/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -d "$icon_dir"
        install -m644 "$srcdir/tdesktop/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegram-desktop.png"
    done
}
