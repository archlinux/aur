# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-systemqt-notoemoji
pkgver=1.2.6
pkgrel=5
pkgdesc='Official Telegram Desktop client'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'minizip' 'openal' 'qt5-base' 'qt5-imageformats' 'openssl-1.0')
makedepends=('cmake' 'git' 'gyp' 'range-v3' 'python' 'libappindicator-gtk3')
optdepends=('libnotify: desktop notifications')
conflicts=('telegram-desktop')
provides=('telegram-desktop')

_emoji_res_commit="db4c66e311a160b3f849d6c76890932c50701bf8"
source=(
    "tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#tag=v$pkgver"
    "GSL::git+https://github.com/Microsoft/GSL.git"
    "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip.git"
    "variant::git+https://github.com/mapbox/variant.git"
    "Catch::git+https://github.com/philsquared/Catch"
    "telegram-desktop.desktop"
    "tg.protocol"
    "CMakeLists.inj"
    "tdesktop.patch"
    "no-gtk2.patch"
    "libtgvoip.patch"
    "emoji.webp_${_emoji_res_commit}::https://github.com/PeterCxy/tdesktop/raw/${_emoji_res_commit}/Telegram/Resources/art/emoji.webp"
    "emoji_125x.webp_${_emoji_res_commit}::https://github.com/PeterCxy/tdesktop/raw/${_emoji_res_commit}/Telegram/Resources/art/emoji_125x.webp"
    "emoji_150x.webp_${_emoji_res_commit}::https://github.com/PeterCxy/tdesktop/raw/${_emoji_res_commit}/Telegram/Resources/art/emoji_150x.webp"
    "emoji_200x.webp_${_emoji_res_commit}::https://github.com/PeterCxy/tdesktop/raw/${_emoji_res_commit}/Telegram/Resources/art/emoji_200x.webp"
    "emoji_250x.webp_${_emoji_res_commit}::https://github.com/PeterCxy/tdesktop/raw/${_emoji_res_commit}/Telegram/Resources/art/emoji_250x.webp"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'b12b6d25fc2e6fb0a60a14bbab8b600ec71cf4651279180730c1a469afd1173c'
            'd4cdad0d091c7e47811d8a26d55bbee492e7845e968c522e86f120815477e9eb'
            '7a06af83609168a8eaec59a65252caa41dcd0ecc805225886435eb65073e9c82'
            'c0a71a540c6263d4e6cbba326a9b9d61cd57ef6db6054e87058dc49cbb707a23'
            '8d707debe027c7cb658825501dc30fb3beb57ab21b1b6df2f01c5f76ca39a0e6'
            '0e55b150b91aeeddcb813fb242a62fe4d1977bcac457eb9d65997faef643f075'
            'fccd084805b4621e3614d2a0584bb78a0ad44f502a79b4a4534e901881677555'
            '668a2371c3dae8e95187f0c9f8fec9b0e535157482747d2f9c6034c6b9eefa16'
            'd84537063ccf42904ab35ea2624263419f7d17671d24b17d02d02020d9af8be2'
            '876e085cee23f988b86398fb8bd104e3d7ad1aa45accd75e1d1d1653f2b32663'
            '37add3f2536dc027705c202446deb0c5351c3c7ade27336b2c054917acf4d15f')

prepare() {
    cd "$srcdir/tdesktop"
    git submodule init
    git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
    git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
    git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
    git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch"
    git submodule update
    patch -Np1 -i "$srcdir/tdesktop.patch"
    patch -Np1 -i "$srcdir/no-gtk2.patch"

    for x in "" "_125x" "_150x" "_200x" "_250x"; do
        cp -vf "$srcdir/emoji$x.webp_${_emoji_res_commit}" "$srcdir/tdesktop/Telegram/Resources/art/emoji$x.webp"
    done

    cd "Telegram/ThirdParty/libtgvoip"
    patch -Np1 -i "$srcdir/libtgvoip.patch"
}

build() {
    cd "$srcdir/tdesktop"
    export LANG=en_US.UTF-8
    export GYP_DEFINES="TDESKTOP_DISABLE_CRASH_REPORTS,TDESKTOP_DISABLE_AUTOUPDATE,TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME,TDESKTOP_DISABLE_UNITY_INTEGRATION"
    export EXTRA_FLAGS="-Winvalid-pch"
    export CPPFLAGS="$CPPFLAGS $EXTRA_FLAGS"
    export CXXFLAGS="$CXXFLAGS $EXTRA_FLAGS"
    gyp \
        -Dbuild_defines=${GYP_DEFINES} \
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
    install -m644 "$srcdir/telegram-desktop.desktop" "$pkgdir/usr/share/applications/telegram-desktop.desktop"

    install -d "$pkgdir/usr/share/kservices5"
    install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -d "$icon_dir"
        install -m644 "$srcdir/tdesktop/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegram-desktop.png"
    done
}
