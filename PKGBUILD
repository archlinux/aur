# Use MAKEPKG_SPOTUBE_LASTFM_API_KEY and MAKEPKG_SPOTUBE_LASTFM_API_SECRET
# to provide required infomation. See https://github.com/KRTirtho/spotube/blob/master/.env.example for more info

# Get Last.fm API key and secret at https://www.last.fm/api/account/create

# See https://github.com/flutter/flutter/issues/65400
# for workarounds to `Insecure RPATH '<build path>' in usr/lib/spotube/lib/lib*_plugin.so`

_system_flutter=false # build_system part seems missing in aur/flutter
_flutter_version=3.35.2

pkgname=spotube
pkgver=5.1.0
pkgrel=1
pkgdesc="Open source music client! Available for both desktop & mobile!"
arch=("x86_64" "aarch64")
url="https://spotube.krtirtho.dev/"
license=("BSD-4-Clause")
depends=("gcc-libs" "glibc" "fontconfig" "mpv" "libappindicator-gtk3" "libepoxy" "libsecret" "libnotify"
         "webkit2gtk-4.1" "libsoup3" "libayatana-appindicator" "gtk3" "cairo" "glib2" "pango"
         "at-spi2-core")
makedepends=("clang" "cmake" "ninja" "pkgconf" "rustup" "imagemagick" "jsoncpp" "patchelf")
optdepends=("avahi: required if using remote controlling"
            "nss-mdns: required if using remote controlling"
            "mdns-scan: required if using remote controlling"
            "yt-dlp: Alternative YouTube engine support")
options=("!lto") # undefined symbol: Dart_NewPersistentHandle_DL
source=("$pkgname-$pkgver.tar.gz::https://github.com/KRTirtho/spotube/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23d94fbf89d3483ea483bb199f3204c4cbc0fe0008455f2f195f7f01acd14752'
            'f0131080b47bfaa1fcc698e7e8f5814fa741b835eb8b3bbc70fde9a9380828b4')

_release_date=2025-11-14

if $_system_flutter
then
    makedepends+=("flutter-tool=$_flutter_version" 
                  "flutter-target-linux=$_flutter_version")
else
    source+=("flutter-$_flutter_version.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$_flutter_version-stable.tar.xz")
    makedepends+=("curl" "git" "unzip" "xz" "zip" "libglvnd")
fi

prepare() {
    cd "$srcdir/spotube-$pkgver"
    {
        echo "ENABLE_UPDATE_CHECK=0"
        echo "LASTFM_API_KEY=$MAKEPKG_SPOTUBE_LASTFM_API_KEY"
        echo "LASTFM_API_SECRET=$MAKEPKG_SPOTUBE_LASTFM_API_SECRET"
        echo "RELEASE_CHANNEL=stable"
    } > .env

    if $_system_flutter
    then
        export FLUTTER_ROOT=/usr/lib/flutter
    else
        export FLUTTER_ROOT="$srcdir/flutter"
        export PATH="$PATH:$FLUTTER_ROOT/bin"
    fi
    export PATH="$PATH:$HOME/.pub-cache/bin"

    flutter config --no-analytics
    flutter config --enable-linux-desktop
    flutter pub get
    dart pub global activate flutter_gen
    rustup default stable
}
build() {
    cd "$srcdir/spotube-$pkgver"
    if $_system_flutter
    then
        export FLUTTER_ROOT=/usr/lib/flutter
    else
        export FLUTTER_ROOT="$srcdir/flutter"
        export PATH="$PATH:$FLUTTER_ROOT/bin"
    fi
    export PATH="$PATH:$HOME/.pub-cache/bin"
     
    dart run build_runner build --delete-conflicting-outputs
    flutter build linux --release
}
package() {
    depends+=("hicolor-icon-theme")

    local _arch appid="com.github.KRTirtho.Spotube"
    case "$CARCH" in
        x86_64)
            _arch=x64
            ;;
        aarch64)
            _arch=arm64
            ;;
        *)
            # Cannot deploy to other platforms on Linux, but still keep this as a fallback
            # https://docs.flutter.dev/reference/supported-platforms
            _arch="$CARCH"
            ;;
    esac

    cd "$srcdir/spotube-$pkgver"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    cp -a --no-preserve=ownership "build/linux/$_arch/release/bundle" "$pkgdir/usr/lib/spotube"
    ln -srf "$pkgdir/usr/lib/spotube/spotube" "$pkgdir/usr/bin/spotube"
    sed "s@Icon=/usr/share/icons/spotube/spotube-logo.png@Icon=$appid@;s@/usr/bin/spotube@/usr/bin/spotube %u@" \
        linux/spotube.desktop | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$appid.desktop"
    sed "s|%{{APPDATA_RELEASE}}%|<release version=\"$pkgver\" date=\"$_release_date\"/>|" \
        linux/$appid.appdata.xml | install -Dm644 /dev/stdin "$pkgdir/usr/share/metainfo/$appid.appdata.xml"
    # This file is 509x509...
    magick assets/branding/spotube-logo.png -resize 512x512 "$pkgdir/usr/share/icons/hicolor/512x512/apps/$appid.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/spotube/LICENSE"

    echo "Removing RPATH for usr/lib/spotube/lib/lib*_plugin.so..."
    patchelf --shrink-rpath --allowed-rpath-prefixes "\$ORIGIN" \
        "$pkgdir"/usr/lib/spotube/lib/lib*_plugin.so
}
