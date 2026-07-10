# Maintainer: umceko <support@stockimg.ai>
pkgname=hush-mic
pkgver=1.0.0
pkgrel=1
pkgdesc="NVIDIA Maxine AI noise-suppression virtual microphone (built from source)"
arch=('x86_64')
url="https://github.com/UMCEKO/hush"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'glib-networking' 'pipewire' 'libpulse' 'dbus' 'gcc-libs')
makedepends=('rust>=1.88' 'cargo' 'pkgconf' 'clang')
optdepends=('nvidia-utils: nvidia-smi GPU detection (required at runtime)')
provides=('hush-mic')
# 'hush'/'hush-bin' (an unrelated Lua shell) also install /usr/bin/hush
conflicts=('hush-mic-bin' 'hush' 'hush-bin')
_sdkver=2.1.0
source=("hush-$pkgver.tar.gz::https://github.com/UMCEKO/hush/archive/refs/tags/v$pkgver.tar.gz"
        "afx-link-${_sdkver}.tar.zst::https://cdn.hush.umceko.com/sdk/${_sdkver}/afx-link-x86_64.tar.zst")
sha256sums=('SKIP'
            'eb381134dcfae78a35b85f06c6d2c87103efbb7e736e0dcbcd3daa4fc359eba5')

prepare() {
    cd "hush-$pkgver"
    # Fetch the git-pinned dioxus/blitz deps up front (network is allowed here).
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
    # Unpack the link libs (libnv_audiofx + libcudart) into a flat NVAFX_LINK_DIR.
    mkdir -p "$srcdir/linklibs"
    bsdtar -xf "$srcdir/afx-link-${_sdkver}.tar.zst" -C "$srcdir/linklibs"
}

build() {
    cd "hush-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export NVAFX_LINK_DIR="$srcdir/linklibs"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release -p hush-app -p hush-engine --bin hush --bin hushd
}

package() {
    cd "hush-$pkgver"
    install -Dm755 target/release/hush  "$pkgdir/usr/bin/hush"
    install -Dm755 target/release/hushd "$pkgdir/usr/bin/hushd"
    install -Dm644 dist/io.github.umceko.hush.desktop "$pkgdir/usr/share/applications/io.github.umceko.hush.desktop"
    install -Dm644 dist/hush.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/hush.svg"
    install -Dm644 dist/NVIDIA_NOTICE.txt "$pkgdir/usr/share/licenses/$pkgname/NVIDIA_NOTICE.txt"
    install -Dm644 dist/FONT_LICENSES.txt "$pkgdir/usr/share/licenses/$pkgname/FONT_LICENSES.txt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
