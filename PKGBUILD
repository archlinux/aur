# Maintainer: Jim Chen <Jim@ChenJ.im>
# Contributor: Brian Le <brainicism@gmail.com>

pkgname=bgutil-ytdlp-pot-provider
pkgver=0.8.1
pkgrel=7
pkgdesc='High-performance YouTube POT token provider for yt-dlp (Rust implementation)'
arch=('x86_64')
url='https://github.com/jim60105/bgutil-ytdlp-pot-provider-rs'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'openssl')
optdepends=('yt-dlp>=2025.05.22: video downloading (for POT plugin integration)')
provides=("bgutil-pot=$pkgver")
install="$pkgname.install"
source=(
    "bgutil-ytdlp-pot-provider-rs-$pkgver.zip::$url/releases/download/v$pkgver/bgutil-ytdlp-pot-provider-rs.zip"
    "upstream-LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
)
b2sums=(
    '2ddd5983fbb653aa43383233f3cdff81658678554e8eff1398f61dc25942e75164d344edb7c807166d50bb9477acfdfbbd2149493fb83ff8276e77ec1ef83ea8'
    '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd'
)
source_x86_64=(
    "bgutil-pot-$pkgver-$CARCH::$url/releases/download/v$pkgver/bgutil-pot-linux-$CARCH"
    "libbgutil_ytdlp_pot_provider-$pkgver-$CARCH.so::$url/releases/download/v$pkgver/libbgutil_ytdlp_pot_provider-linux-$CARCH.so"
)
b2sums_x86_64=(
    '8fce8b825fdefda9cbcca1b1a6222c370f2c101097b8e12ceb1a423b7faee8ec19ef25169942895c73aa9f7ac59411c9e486e688bce7773c876b10ddeda91c8f'
    '6763af9be0619adfa0d125718a643b74fb22a16ebcdd6c804cfd3b6294cc4d724b57b59702e050048805d4691b7b0be4bf2d759f45e23010157a0fe3a5e0f312'
)

package() {
    # Binary
    install -Dm755 "bgutil-pot-$pkgver-$CARCH" \
        "$pkgdir/usr/bin/bgutil-pot"

    # cdylib for FFI (Python, Java, C#, Go via C API)
    install -Dm755 "libbgutil_ytdlp_pot_provider-$pkgver-$CARCH.so" \
        "$pkgdir/usr/lib/libbgutil_ytdlp_pot_provider.so"

    # yt-dlp plugins
    local plugindir="$pkgdir/usr/share/yt-dlp-plugins/$pkgname"
    install -dm755 "$plugindir/yt_dlp_plugins/extractor"
    bsdtar --no-same-owner -xf "bgutil-ytdlp-pot-provider-rs-$pkgver.zip" \
        -C "$plugindir"

    # License
    install -Dm644 "upstream-LICENSE-$pkgver" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
