# Maintainer: Dan Elkouby <streetwalkermc@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop9
pkgver=1.9.3
pkgrel=1
pkgdesc='Official Telegram Desktop client (personal build)'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=(
    'enchant'
    'ffmpeg'
    'hicolor-icon-theme'
    'lz4'
    'minizip'
    'openal'
    'qt5-imageformats'
    'xxhash'
)
makedepends=(
    'cmake'
    'git'
    'libappindicator-gtk3'
    'ninja'
    'python'
    'quilt'
    'range-v3'
)
optdepends=(
    'ttf-opensans: default Open Sans font family'
    'libappindicator-gtk3: AppIndicator-based tray icon'
)
provides=('telegram-desktop')
conflicts=('telegram-desktop')
source=(
    "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
    "0001-Dynamic-linking-system-libs.patch"
    "0002-Dynamic-linking-system-qt.patch"
    "0004-gtk3.patch"
    "0005-Use-system-wide-fonts.patch"
    "0006-Revert-Disable-DemiBold-fallback-for-Semibold.patch"
    "series"

    "always_delete_for_everyone.patch"
    "always_clear_history_for_everyone.patch"
    "always_pin_without_notify.patch"
    "always_send_as_photo_or_album.patch"
    "clicky_sticker_panel.patch"
    "dont_pulse_mentions.patch"
    "no_circles.patch"
)
sha512sums=('af8e5d2c74d0b990958edd75a01f40b70bc21c0f69074acfb943f44fdb1f1e84465b461765a1a584513e54ab30045817b42b6839ad16cb4c1043fda89ea600f7'
            '69fc5b50d2663af0c0bb539a6ac4b3d8996282f1701f484b9d1e29ddbd6eec942c999ee2f77d7effed13d4ecdd62e03e6ff064be0948ff91124962cc17c57143'
            '5675787e849a811679b24e86b64e651c1aded56853e52c9455d8d914b85c153b63287a0d41aaa4c39c0e805ee1f411132431340d7aba99b11fcd1036e8d37680'
            '8c3f48536ff3878baa73949057960eb5c8fcf3f152141c42740a7c0f2fc96c1708511a5d4ffe45ae9e20a08f88a3c2c77163a0a2050d7fca4356e4d2a96dfaf1'
            'd5fa5290b7041cb972c78066ca60d1cbc2bb3de10bf571ca1a639bf05abfa029531ffc0facba0564d39e32f89301960f4879b35bb9ac362ae9264d0a8c5c835c'
            '41f22a8b63b1929288cca5638c2719ce9754aa4334deb9004370c44f780fb8ac57f2b4075d529c494f4eac49dde22885f0f9efc0911840f79cb5fcf8d737061d'
            '17d831ce49ef522bae3558c679dda3eb1d84d69be40d9942f1ec2dc9fe32960b1233b072b09c107e5fc704c4a9286010f2cdd5e9830a2bdad97d3cb24b502ebe'
            '83af5f5d18bc26d2de5318b97f31956f34ceb0c14efa8cf36c310a543c8c7d3a448c4c448f2fac1e552b40816273bb5139666ff2fa20e2762148ee69ac20d4cb'
            'd32c2e0544b858842317b704e58016e028555a3baad6b22226e826c11dac8a412c808ffe8a7ea0f3f23c00c591e1a6e652c2ba63d8369491e188560f8296d0cb'
            '91a0edab6408a223db77b75df5a913ffd36efa79340e8d78fa01ac2c3b6e09d5a5fc7fa214ccd40473093809f86b7aef199cebf56a1d5821c20083c4a3e5780b'
            '8b4560deaa06ee20eeaa0d6b855f7a8e922804698f9b274875ece8842231bcf688a31f588cb5c726152b3e7b8784c0b5f61eed0eb48e5392dfdfd72117ee8bb1'
            '4f5b61073b4bd28d2cf92cb6bddb91a50518c4ce801d178366b3760ee2cf1692164546e439049c9ba821e23bff2e3080a42bfabf6fa46d613fd56905b405f340'
            '128c139e2e7cd3b12a4a31af1cac1c326b5ed95763499c95a2484efe12cf5f448e3c8e83d73e90169651478e091abfbe505a9001bbb49e8f9fa139cca3aa5012'
            '048c6784fb0bb9182d07916fdfab9f9952cdcb1998b0f780ce74bf03b61ae62774611819db7de5fec5019b9158b42c3912ca28797aeca41a881493e5822afcd8')

prepare() {
    cd "$srcdir/tdesktop-$pkgver-full"

    QUILT_PATCHES=.. quilt --quiltrc=/dev/null push -a

    patch -Np1 -i "$srcdir/always_delete_for_everyone.patch"
    patch -Np1 -i "$srcdir/always_clear_history_for_everyone.patch"
    patch -Np1 -i "$srcdir/always_pin_without_notify.patch"
    patch -Np1 -i "$srcdir/always_send_as_photo_or_album.patch"
    patch -Np1 -i "$srcdir/clicky_sticker_panel.patch"
    patch -Np1 -i "$srcdir/dont_pulse_mentions.patch"
    patch -Np1 -i "$srcdir/no_circles.patch"
}

build() {
    cd "$srcdir/tdesktop-$pkgver-full"
    mkdir build
    export CXXFLAGS="$CXXFLAGS -ffile-prefix-map=$srcdir/tdesktop-$pkgver-full="
    cmake -B build -G Ninja . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=2040 \
        -DTDESKTOP_API_HASH=b18441a1ff607e10a989891a5462e627 \
        -DDESKTOP_APP_USE_GLIBC_WRAPS=OFF \
        -DDESKTOP_APP_USE_SYSTEM_LIBS=ON \
        -DDESKTOP_APP_DISABLE_CRASH_REPORTS=ON \
        -DTDESKTOP_DISABLE_AUTOUPDATE=ON \
        -DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME=ON \
        -DTDESKTOP_DISABLE_DESKTOP_FILE_GENERATION=ON \
        -DDESKTOP_APP_SPECIAL_TARGET="" \
        -DTDESKTOP_FORCE_GTK_FILE_DIALOG=ON
    ninja -C build
}

package() {
    cd "$srcdir/tdesktop-$pkgver-full/"
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "build/bin/Telegram" "$pkgdir/usr/bin/telegram-desktop"

    install -d "$pkgdir/usr/share/applications"
    install -m644 "lib/xdg/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"

    install -d "$pkgdir/usr/share/kservices5"
    install -m644 "lib/xdg/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

    install -d "$pkgdir/usr/share/metainfo/"
    install -m644 "lib/xdg/telegramdesktop.appdata.xml" "$pkgdir/usr/share/metainfo/telegramdesktop.appdata.xml"

    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -d "$icon_dir"
        install -m644 "Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegram.png"
    done
}
