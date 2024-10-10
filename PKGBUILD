# Use MAKEPKG_SPOTUBE_SPOTIFY_SECRETS, MAKEPKG_SPOTUBE_LASTFM_API_KEY and MAKEPKG_SPOTUBE_LASTFM_API_SECRET
# to provide required infomation. See https://github.com/KRTirtho/spotube/blob/master/.env.example for more info

# Get Spotify API secrets at https://developer.spotify.com/, set callback url to http://localhost:4304/auth/spotify/callback
# See https://github.com/KRTirtho/spotube/discussions/49#discussioncomment-2506035 for more info
# Get Last.fm API key and secret at https://www.last.fm/api/account/create

# See https://github.com/flutter/flutter/issues/65400
# for workarounds to `Insecure RPATH '<build path>' in usr/lib/spotube/lib/lib*_plugin.so`

_system_flutter=false # build_system part seems missing in aur/flutter
_flutter_version=3.24.3

pkgname=spotube
pkgver=3.8.3
pkgrel=1
pkgdesc="Open source Spotify client that doesn't require Premium nor uses Electron! Available for both desktop & mobile!"
arch=("x86_64" "aarch64")
url="https://spotube.krtirtho.dev/"
license=("BSD-4-Clause")
depends=("gcc-libs" "mpv" "libappindicator-gtk3" "libsecret" "libnotify" "webkit2gtk-4.1" "libsoup3" "libayatana-appindicator")
makedepends=(
    "clang" "cmake" "ninja" "pkgconf" "gtk3" "rustup" "imagemagick" "jsoncpp" "patchelf"
)
optdepends=(
    "avahi: required if using remote controlling"
    "nss-mdns: required if using remote controlling"
    "mdns-scan: required if using remote controlling"
)
options=("!lto") # undefined symbol: Dart_NewPersistentHandle_DL
source=(
    "spotube-$pkgver.tar.gz::https://github.com/KRTirtho/spotube/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('e4436f11e31bfbd79e76e0bae524e06ece095da548d3a5b8ccd1f7a28ce2b79a'
            'f4e2369afaf38a8e381c9243fad2ca04b8514194c40ec946825d1f4c5539a095')

_release_date=2024-10-09


if $_system_flutter
then
    makedepends+=(
        "flutter-tool=$_flutter_version" 
        "flutter-target-linux=$_flutter_version"
    )
else
    source+=("flutter-$_flutter_version.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$_flutter_version-stable.tar.xz")
    makedepends+=(
        "curl" "git" "unzip" "xz" "zip" "libglvnd"
    )
fi

prepare() {
    cd "$srcdir/spotube-$pkgver"
    {
        echo "SPOTIFY_SECRETS=$MAKEPKG_SPOTUBE_SPOTIFY_SECRETS"
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
    # This file is 509x509...
    magick assets/spotube-logo.png -resize 512x512 spotube-logo.png
}
package() {
    depends+=("hicolor-icon-theme")
    case "$CARCH" in
        x86_64)
            declare -r _arch=x64
            ;;
        aarch64)
            declare -r _arch=arm64
            ;;
        *)
            # Cannot deploy to other platforms on Linux, but still keep this as a fallback
            # https://docs.flutter.dev/reference/supported-platforms
            declare -r _arch=$CARCH
            ;;
    esac
    local appid="com.github.KRTirtho.Spotube"
    cd "$srcdir/spotube-$pkgver"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -rdp --no-preserve=ownership "build/linux/$_arch/release/bundle" "$pkgdir/usr/lib/spotube"
    ln -srfv "$pkgdir/usr/lib/spotube/spotube" "$pkgdir/usr/bin/spotube"
    sed "s@Icon=/usr/share/icons/spotube/spotube-logo.png@Icon=$appid@;s@/usr/bin/spotube@/usr/bin/spotube %u@" \
        linux/spotube.desktop | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$appid.desktop"
    sed "s|%{{APPDATA_RELEASE}}%|<release version=\"$pkgver\" date=\"$_release_date\"/>|" \
        linux/$appid.appdata.xml | install -Dm644 /dev/stdin "$pkgdir/usr/share/metainfo/$appid.appdata.xml"
    install -Dm644 assets/spotube-logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"
    install -Dm644 spotube-logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$appid.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/spotube/LICENSE"

    echo "Removing RPATH for usr/lib/spotube/lib/lib*_plugin.so..."
    patchelf --remove-rpath "$pkgdir"/usr/lib/spotube/lib/lib*_plugin.so
}
