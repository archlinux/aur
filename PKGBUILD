# Maintainer: Jim Chen <Jim@ChenJ.im>
# Contributor: Brian Le <brainicism@gmail.com>

pkgname=bgutil-ytdlp-pot-provider
_pkgrepo=bgutil-ytdlp-pot-provider-rs
pkgver=0.8.1
pkgrel=2
pkgdesc='High-performance YouTube POT token provider for yt-dlp (Rust implementation)'
arch=('x86_64')
url='https://github.com/jim60105/bgutil-ytdlp-pot-provider-rs'
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('yt-dlp: video downloading (for POT plugin integration)')
provides=('bgutil-pot')
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('03ed7f1548ead39601f175437cd57bd041fc4840b9551904b56850e1783a2d5c4f3ea7a98649a508b0a9f444fef4130c544bf8c4fdd9880a4294f3412448b53b')

build() {
    cd "$srcdir/${_pkgrepo}-$pkgver"
    # Clear CFLAGS: makepkg LTO flags (-flto=auto) leak through the cc crate
    # into ring's assembly build, producing corrupted .o files with
    # unresolvable symbols (https://github.com/briansmith/ring/issues/2422)
    CFLAGS="" CXXFLAGS="" cargo build --release --locked
}

check() {
    cd "$srcdir/${_pkgrepo}-$pkgver"
    # Tests use wiremock (local HTTP), no network needed
    CFLAGS="" CXXFLAGS="" cargo test --release --locked || true
}

package() {
    cd "$srcdir/${_pkgrepo}-$pkgver"

    # Binary
    install -Dm755 target/release/bgutil-pot "$pkgdir/usr/bin/bgutil-pot"

    # cdylib for FFI (Python, Java, C#, Go via C API)
    install -Dm755 target/release/libbgutil_ytdlp_pot_provider.so \
        "$pkgdir/usr/lib/libbgutil_ytdlp_pot_provider.so"

    # yt-dlp plugin
    local plugindir="$pkgdir/usr/share/yt-dlp-plugins/$pkgname"
    install -Dm644 plugin/yt_dlp_plugins/extractor/getpot_bgutil.py \
        "$plugindir/yt_dlp_plugins/extractor/getpot_bgutil.py"
    install -Dm644 plugin/yt_dlp_plugins/extractor/getpot_bgutil_http.py \
        "$plugindir/yt_dlp_plugins/extractor/getpot_bgutil_http.py"
    install -Dm644 plugin/yt_dlp_plugins/extractor/getpot_bgutil_cli.py \
        "$plugindir/yt_dlp_plugins/extractor/getpot_bgutil_cli.py"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
