# Maintainer: Lucas Gabriel <g at 11xx dot org>
pkgname=muzaiten-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Native music player for local libraries, with ratings and scrobbling (VCS build)"
arch=('x86_64')
url="https://codeberg.org/11xx/muzaiten"
license=('Unlicense')
depends=('qt6-base' 'qt6-multimedia' 'taglib' 'chromaprint' 'gstreamer' 'gst-plugins-base-libs' 'glib2' 'zstd' 'python')
makedepends=('git' 'cmake' 'ninja' 'pkgconf')
optdepends=('gst-plugins-good: extra audio decoders and sinks'
            'gst-plugin-pipewire: PipeWire audio output'
            'gst-plugins-bad: additional codecs and native DSF DSD playback'
            'gst-libav: DSD demux and DSD-to-PCM decode'
            'mpd: browse an MPD library alongside local sources'
            'yt-dlp: enrich YouTube playlist imports with metadata'
            'muzaiten-features-clap: optional semantic audio analysis and search provider')
provides=('muzaiten')
conflicts=('muzaiten' 'muzaiten-bin')
source=("$pkgname::git+https://codeberg.org/11xx/muzaiten.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # UTC timestamp plus a commit count so successive -git builds always compare
    # as newer, even when multiple commits land in the same second.
    printf '%s.r%s.g%s' \
        "$(TZ=UTC0 git show -s --format=%cd --date=format-local:%Y.%m.%d.%H%M%S HEAD)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    # No default Last.fm credentials are baked into source builds; users add
    # their own key in Scrobblers > Last.fm API settings.
    cmake -S "$pkgname" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/UNLICENSE" "$pkgdir/usr/share/licenses/$pkgname/UNLICENSE"
}
