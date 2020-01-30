# Maintainer: Dan Elkouby <streetwalkermc@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop9
pkgver=1.9.9
pkgrel=1
pkgdesc='Official Telegram Desktop client (personal build)'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libappindicator-gtk3')
# for libappindicator-gtk3 see https://bugs.archlinux.org/task/65080

makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3')
optdepends=('ttf-opensans: default Open Sans font family')
provides=('telegram-desktop')
conflicts=('telegram-desktop')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        telegram-desktop.sh

        "always_delete_for_everyone.patch"
        "always_pin_without_notify.patch"
        "always_send_as_photo_or_album.patch"
        "clicky_sticker_panel.patch"
        "dont_pulse_mentions.patch"
        "no_circles.patch")
sha512sums=('ba6400e6f5eec5bda6e8a54b43846e695b2cce731cb6b39f17407cc39e3e9b8078d977253d29962671f30e33dbe012f8e40f340f781fd8ca73487e5f2d42e3de'
            '3c21c871e28bac365400f7bc439a16ad1a9a8d87590ad764ce262f1db968c10387caed372d4e064cb50f43da726cebaa9b24bcbcc7c6d5489515620f44dbf56b'
            'fdef3a430bdd60d88c9e9011ee878805e7803699204a2a7e22797d0f8729bf7dc0543851083ad700a4ece32bc768b6bfeb6f0135c8c039e035b22afb6df1171d'
            '91a0edab6408a223db77b75df5a913ffd36efa79340e8d78fa01ac2c3b6e09d5a5fc7fa214ccd40473093809f86b7aef199cebf56a1d5821c20083c4a3e5780b'
            '247ba6576166dead08289b145ca126b6498c0731f9e4a5763b80d4a4cc3f057dffc6d8b697ed4fa2129a5b86c568ec5130fda25df30661a4f4c147d358f3ae5b'
            '4f5b61073b4bd28d2cf92cb6bddb91a50518c4ce801d178366b3760ee2cf1692164546e439049c9ba821e23bff2e3080a42bfabf6fa46d613fd56905b405f340'
            '128c139e2e7cd3b12a4a31af1cac1c326b5ed95763499c95a2484efe12cf5f448e3c8e83d73e90169651478e091abfbe505a9001bbb49e8f9fa139cca3aa5012'
            '048c6784fb0bb9182d07916fdfab9f9952cdcb1998b0f780ce74bf03b61ae62774611819db7de5fec5019b9158b42c3912ca28797aeca41a881493e5822afcd8')

prepare() {
    cd "$srcdir/tdesktop-$pkgver-full"

    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        msg2 "Applying patch $src..."
        patch -Np1 < "../$src"
    done
}

build() {
    cd tdesktop-$pkgver-full

    export CXXFLAGS="$CXXFLAGS -ffile-prefix-map=$srcdir/tdesktop-$pkgver-full="
    # For some reason, this is needed when building without spellchecking
    export LDFLAGS="$LDFLAGS,--copy-dt-needed-entries"
    cmake -B build -G Ninja . \
        -Ddisable_autoupdate=1 \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=2040 \
        -DTDESKTOP_API_HASH=b18441a1ff607e10a989891a5462e627 \
        -DDESKTOP_APP_USE_GLIBC_WRAPS=OFF \
        -DDESKTOP_APP_USE_PACKAGED=ON \
        -DDESKTOP_APP_USE_PACKAGED_RLOTTIE=OFF \
        -DDESKTOP_APP_DISABLE_CRASH_REPORTS=ON \
        -DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME=ON \
        -DTDESKTOP_DISABLE_DESKTOP_FILE_GENERATION=ON \
        -DTDESKTOP_USE_PACKAGED_TGVOIP=OFF \
        -DDESKTOP_APP_SPECIAL_TARGET="" \
        -DTDESKTOP_LAUNCHER_BASENAME="telegramdesktop" \
        -DDESKTOP_APP_DISABLE_SPELLCHECK=ON \
        -DTDESKTOP_FORCE_GTK_FILE_DIALOG=ON
    ninja -C build
}

package() {
    cd tdesktop-$pkgver-full
    ninja -C build install

    mv "$pkgdir/usr/bin/telegram-desktop"{,-bin}
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/telegram-desktop.sh" "$pkgdir/usr/bin/telegram-desktop"
}
