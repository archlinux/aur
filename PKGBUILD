# Maintainer: draxaris1010 <axel.dezittere[at]gmail[dot]com>
# Contributor: FirstAirBender <noblechuk5[at]gmail[dot]com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=librespot-avahi
_pkgname=librespot
pkgver=0.6.0
pkgrel=2
pkgdesc='Open source client library for Spotify'
arch=('x86_64')
url='https://github.com/librespot-org/librespot'
license=('MIT')
conflicts=('librespot')
provides=('librespot')
depends=(
    'alsa-lib'
)
makedepends=(
    'cargo'
)
optdepends=(
    'gst-plugins-base: Audio playback using GStreamer'
    'gst-plugins-good: Audio playback using GStreamer'
    'jack2: Audio playback using JACK'
    'libpulse: Audio playback using PulseAudio'
    'portaudio: Audio playback using PortAudio'
    'sdl2: Audio playback using SDL2'
    'avahi: Use system mDNS daemon for discovery'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9ec881edb11e37d31a2b41dd30d56a3413445eedb720e1b0d278567dccfca8fc')

_env() {
    export RUSTUP_TOOLCHAIN=stable
    export PKG_FEATURES=alsa-backend,with-libmdns
    declare -A PKG_FEATURE_MAP=(
        [jack2]='jackaudio-backend'
        [gst-plugins-good]='gstreamer-backend'
        [gst-plugins-base]='gstreamer-backend'
        [sdl2]='sdl-backend'
        [libpulse]='pulseaudio-backend'
        [portaudio]='portaudio-backend'
        [avahi]='with-avahi'
    )
    for pkg in "${!PKG_FEATURE_MAP[@]}"; do
        if [[ -n `pacman -Qsq "$pkg" | sed -E "/^$pkg\$/b; /.+/d"` ]]; then
            export PKG_FEATURES="$PKG_FEATURES,${PKG_FEATURE_MAP[$pkg]}"
        fi 2>/dev/null >&2
    done
    export CARGO_TARGET_DIR=target
    export CFLAGS="$CFLAGS -ffat-lto-objects"
    export CARGO_BUILD_JOBS="$(nproc --ignore $(($(nproc) / 2)))"
}

prepare() {
    cd "$_pkgname-$pkgver"
    _env
    echo >&2 "Preparing $pkgname-$pkgver with the following features: $PKG_FEATURES"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname-$pkgver"
    _env
    echo >&2 "Building $pkgname-$pkgver with the following features: $PKG_FEATURES"
    cargo build --release --frozen --no-default-features --features "$PKG_FEATURES"
}

# check() {
#   cd "$pkgname-$pkgver"
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --frozen --no-default-features --features "$PKG_FEATURES"
# }

package() {
    cd "$_pkgname-$pkgver"
    install -Dvm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dvm644 "contrib/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
    install -Dvm644 "contrib/$_pkgname.user.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
