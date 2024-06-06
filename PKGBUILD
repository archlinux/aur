# Use MAKEPKG_SPOTUBE_SPOTIFY_SECRETS, MAKEPKG_SPOTUBE_LASTFM_API_KEY and MAKEPKG_SPOTUBE_LASTFM_API_SECRET
# to provide required infomation. See https://github.com/KRTirtho/spotube/blob/master/.env.example for more info

# Get Spotify API secrets at https://developer.spotify.com/, set callback url to http://localhost:4304/auth/spotify/callback
# Get Last.fm API key and secret at https://www.last.fm/api/account/create

# See https://github.com/flutter/flutter/issues/65400
# for workarounds to `Insecure RPATH '<build path>' in opt/spotube/lib/lib*_plugin.so`

pkgname=spotube
pkgver=3.7.1
pkgrel=1
pkgdesc="Open source Spotify client that doesn't require Premium nor uses Electron! Available for both desktop & mobile!"
arch=("x86_64" "aarch64")
url="https://spotube.krtirtho.dev/"
license=("BSD-4-Clause")
depends=("mpv" "libappindicator-gtk3" "libsecret" "libnotify" "at-spi2-core" "libepoxy")
makedepends=(
    "flutter-tool>=3.16.0" "flutter-target-linux>=3.16.0" "clang" "cmake" "ninja"
    "pkgconf" "gtk3" "imagemagick" "jsoncpp"
)
source=(
    "spotube-$pkgver.tar.gz::https://github.com/KRTirtho/spotube/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('d528c7be9db77786a5646982597bf7e48ca595bbc0d9f4ead528d5e7677f28fc')

_release_date=2024-06-06

prepare() {
    cd "$srcdir/spotube-$pkgver"
    {
        echo "SPOTIFY_SECRETS=$MAKEPKG_SPOTUBE_SPOTIFY_SECRETS"
        echo "ENABLE_UPDATE_CHECK=0"
        echo "LASTFM_API_KEY=$MAKEPKG_SPOTUBE_LASTFM_API_KEY"
        echo "LASTFM_API_SECRET=$MAKEPKG_SPOTUBE_LASTFM_API_SECRET"
        echo "RELEASE_CHANNEL=stable"
    } > .env

    # workaround for l10n
    echo 'synthetic-package: false' >> l10n.yaml
    echo 'output-dir: lib/l10n/gen_l10n' >> l10n.yaml
    sed -i 's|package:flutter_gen|../l10n|' \
        lib/extensions/context.dart lib/main.dart lib/collections/side_bar_tiles.dart

    flutter config --no-analytics
    flutter config --enable-linux-desktop
    flutter pub get
}
build() {
    cd "$srcdir/spotube-$pkgver"
    FLUTTER_ROOT=/usr/lib/flutter dart run build_runner build --delete-conflicting-outputs
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
    cd "$srcdir/spotube-$pkgver"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt"
    cp -rdp --no-preserve=ownership "build/linux/$_arch/release/bundle" "$pkgdir/opt/spotube"
    ln -s ../../opt/spotube/spotube "$pkgdir/usr/bin/spotube"
    install -Dm644 linux/spotube.desktop "$pkgdir/usr/share/applications/com.github.KRTirtho.Spotube.desktop"
    sed -i '
            s@Exec=/usr/bin/spotube@Exec=spotube@;
            s@Icon=/usr/share/icons/spotube/spotube-logo.png@Icon=com.github.KRTirtho.Spotube@;
           ' "$pkgdir/usr/share/applications/com.github.KRTirtho.Spotube.desktop"
    install -Dm644 linux/com.github.KRTirtho.Spotube.appdata.xml \
        "$pkgdir/usr/share/metainfo/com.github.KRTirtho.Spotube.appdata.xml"
    sed -i "s|%{{APPDATA_RELEASE}}%|<release version=\"$pkgver\" date=\"$_release_date\"/>|" \
        "$pkgdir/usr/share/metainfo/com.github.KRTirtho.Spotube.appdata.xml"
    install -Dm644 assets/spotube-logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.KRTirtho.Spotube.svg"
    install -Dm644 spotube-logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/com.github.KRTirtho.Spotube.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/spotube/LICENSE"
}
