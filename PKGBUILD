# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Thanks to Peter Cai <peter at typeblog dot net> for helping in creating emoji's
# Thanks to hexchain <i at hexchain dot org> for the systemqt package
# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-systemqt-emojione
pkgver=1.1.15
pkgrel=1
pkgdesc='Experimental build of Telegram Desktop (using system Qt, emojis replaced with those from EmojiOne)'
arch=('i686' 'x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'minizip' 'openal' 'qt5-base' 'qt5-imageformats')
makedepends=('cmake' 'libappindicator-gtk2' 'dee' 'git' 'gtk3' 'gyp-git' 'libexif' 'libva' 'libwebp' 'mtdev' 'python' 'python2')
optdepends=(
    'libappindicator-gtk3: AppIndicator tray icon'
    'libappindicator-gtk2: AppIndicator tray icon'
)
conflicts=('telegram-desktop')
provides=('telegram-desktop')
install="telegram-desktop.install"
_variant_ver="1.1.3"
_GSL_commit="16a6a41690325433976d843e13ec676d6f9ab091"
_libtgvoip_commit="757a5d8ec31aadcf387ac3cb135256152c18de1c"
source=(
    "tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#tag=v$pkgver"
    "GSL::git+https://github.com/Microsoft/GSL.git#commit=${_GSL_commit}"
    "variant::git+https://github.com/mapbox/variant#tag=v${_variant_ver}"
    "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip.git#commit=${_libtgvoip_commit}"
    "telegramdesktop.desktop"
    "tg.protocol"
    "CMakeLists.inj"
    "tdesktop.patch"
    "libtgvoip.patch"
    "https://github.com/morealaz/tdesktop/blob/master/Telegram/Resources/art/emoji.webp"
    "https://github.com/morealaz/tdesktop/blob/master/Telegram/Resources/art/emoji_125x.webp"
    "https://github.com/morealaz/tdesktop/blob/master/Telegram/Resources/art/emoji_150x.webp"
    "https://github.com/morealaz/tdesktop/blob/master/Telegram/Resources/art/emoji_200x.webp"
    "https://github.com/morealaz/tdesktop/blob/master/Telegram/Resources/art/emoji_250x.webp"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '41c22fae6ae757936741e63aec3d0f17cafe86b2d6153cdd1d01a5581e871f17'
            'd4cdad0d091c7e47811d8a26d55bbee492e7845e968c522e86f120815477e9eb'
            '7a06af83609168a8eaec59a65252caa41dcd0ecc805225886435eb65073e9c82'
            '6d54c8b51b2224c75c15d1e147855a6f22b96848ca3413330882ca6243dd05cb'
            '640ef297f5977de78dab17789390e628b8f7a8a495529c24da8a43693f3fae23'
            '41a30e53812d0da4a32a872193c3a53c05e455a4dfeed794944bc251edcae72d'
            '8e3c254fcf4b57dcaf27f93dba0a59a5ff69382b018da424d9416a5c0577357c'
            '558bb3082ba33d2547e4c5fb5f74639f0c10871648c7335a3cb652ac1fc08885'
            'cc040fa7d681bfc877dd0a32d4ce0df32bbcd80d78a7a8ae5721ddad71d79007'
            'c5fff9c7255c89b047bc6e9ba6e00b1f5788d895e564b80939165c333ce3ab68')

prepare() {
    cd "$srcdir/tdesktop"
    git submodule init
    git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
    git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
    git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
    git submodule update
    patch -Np1 -i "$srcdir/tdesktop.patch"
    pushd "Telegram/ThirdParty/libtgvoip"
    patch -Np1 -i "$srcdir/libtgvoip.patch"
    popd
    for x in "" "_125x" "_150x" "_200x" "_250x"; do
        cp "$srcdir/emoji$x.webp" "$srcdir/tdesktop/Telegram/Resources/art/emoji$x.webp"
    done
}

build() {
    export LANG=en_US.UTF-8
    export GYP_DEFINES="TDESKTOP_DISABLE_CRASH_REPORTS,TDESKTOP_DISABLE_AUTOUPDATE,TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME"
    cd "$srcdir/tdesktop"
    export EXTRA_CPPFLAGS="-DTDESKTOP_DISABLE_AUTOUPDATE -DTDESKTOP_DISABLE_CRASH_REPORTS -DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME"
    export CPPFLAGS="$CPPFLAGS $EXTRA_CPPFLAGS"
    export CXXFLAGS="$CXXFLAGS $EXTRA_CPPFLAGS"
    gyp \
        -Dbuild_defines=${GYP_DEFINES:1} \
        -Gconfig=Release \
        --depth=Telegram/gyp --generator-output=../.. -Goutput_dir=out Telegram/gyp/Telegram.gyp --format=cmake
    NUM=$((`wc -l < out/Release/CMakeLists.txt` - 2))
    sed -i "$NUM r ../CMakeLists.inj" out/Release/CMakeLists.txt
    cd "$srcdir/tdesktop/out/Release"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_BUILD_TYPE=None
    make
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/tdesktop/out/Release/Telegram" "$pkgdir/usr/bin/telegram-desktop"

    install -d "$pkgdir/usr/share/applications"
    install -m644 "$srcdir/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"

    install -d "$pkgdir/usr/share/kservices5"
    install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -d "$icon_dir"
        install -m644 "$srcdir/tdesktop/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegram-desktop.png"
    done
}
