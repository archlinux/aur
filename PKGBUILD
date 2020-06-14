# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hexchain <i@hexchain.org>
# Maintainer: Jianqiu Zhang <void001@archlinuxcn.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegreat-git
pkgver=r3702.a045f216
pkgrel=1
pkgdesc='Unofficial Telegreat Messaging app'
arch=('x86_64')
url="https://telegre.at"
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'minizip' 'openal' 'qt5-base' 'qt5-imageformats' 'openssl')
makedepends=('cmake' 'git' 'gyp' 'range-v3' 'python' 'libappindicator-gtk3' 'openssl')
optdepends=('libnotify: desktop notifications')
source=(
    "tdesktop::git+https://github.com/Sea-n/tdesktop.git"
    "GSL::git+https://github.com/Microsoft/GSL.git"
    "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip.git"
    "variant::git+https://github.com/mapbox/variant.git"
    "Catch::git+https://github.com/philsquared/Catch"
    "CMakeLists.inj"
    "tdesktop.patch"
    "no-gtk2.patch"
    "change-api-id.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'd433d1570af350f003312ff66781c64d9d385d97ff3fd41421967ac5cd597279'
            'aea18527d47228dcdb42b8c1d74398fcf0fdcd7b3c2246e87198f8d9b2dfe0bc'
            '8d707debe027c7cb658825501dc30fb3beb57ab21b1b6df2f01c5f76ca39a0e6'
            '8cbe8e08731716b0f1a263b54abeae27a7ee9c119cea92fd6de0819121facb70')

pkgver() {
    cd "$srcdir/tdesktop"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/tdesktop"
    git submodule init
    git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
    git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
    git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
    git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch"
    git submodule update
    git checkout a045f2164792e768aa98f9631d4f3210f2d31b86
    # We need to move Telegreat.gyp to Telegram.gyp to allow patching, then move it back
    mv $srcdir/tdesktop/Telegram/gyp/Telegreat.gyp $srcdir/tdesktop/Telegram/gyp/Telegram.gyp
    echo "Patching tdesktop"
    patch -Np1 -i "$srcdir/tdesktop.patch"
    mv $srcdir/tdesktop/Telegram/gyp/Telegram.gyp $srcdir/tdesktop/Telegram/gyp/Telegreat.gyp
    git apply -p1 $srcdir/change-api-id.patch

    echo "Patching nogtk2"
    patch -Np1 -i "$srcdir/no-gtk2.patch"

    echo "Generating RSA private key"
    mkdir -p $srcdir/TelegramPrivate
    openssl genrsa -out $srcdir/TelegramPrivate/beta_private.h 2048
    sed -i 's/$/\\n\\/' $srcdir/TelegramPrivate/beta_private.h
    sed -i '1s/^/static const char *BetaPrivateKey = "\\\n/' $srcdir/TelegramPrivate/beta_private.h
    sed -i '$ s/\\n\\/\\/' $srcdir/TelegramPrivate/beta_private.h
    sed -i '$ a\";' $srcdir/TelegramPrivate/beta_private.h
    sed -i '1 s/^/#ifndef BETA_PRIVATE_H\n#define BETA_PRIVATE_H\n/' $srcdir/TelegramPrivate/beta_private.h
    sed -i '$ a#endif' $srcdir/TelegramPrivate/beta_private.h
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
        --depth=Telegram/gyp --generator-output=../.. -Goutput_dir=out Telegram/gyp/Telegreat.gyp --format=cmake
    NUM=$((`wc -l < out/Release/CMakeLists.txt` - 2))
    sed -i "$NUM r ../CMakeLists.inj" out/Release/CMakeLists.txt
    cd "$srcdir/tdesktop/out/Release"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/tdesktop/out/Release/Telegreat" "$pkgdir/usr/bin/telegreat"

    install -d "$pkgdir/usr/share/applications"
    install -m644 "$srcdir/tdesktop/lib/xdg/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegreat.desktop"

    install -d "$pkgdir/usr/share/kservices5"
    install -m644 "$srcdir/tdesktop/lib/xdg/tg.protocol" "$pkgdir/usr/share/kservices5/tgreat.protocol"

    # TODO: remove the dirty mkdir
    mkdir -p "$pkgdir/usr/bin/TelegramBeta_data"
    chmod a+rwx "$pkgdir/usr/bin/TelegramBeta_data"

    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -d "$icon_dir"
        install -m644 "$srcdir/tdesktop/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegreat.png"
    done
}
