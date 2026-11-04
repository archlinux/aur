# Maintainer: 4ng3l1c <4ng3l1c@proton.me>
pkgname=boquilahub
pkgver=0.6.0
pkgrel=1
_commit=9cd9cd7600119162b875540c420a4a3dafdf7791
pkgdesc='Local AI-powered nature monitoring tool with CLI, TUI and GUI'
arch=('x86_64')
url='https://github.com/boquila/boquilahub'
license=('AGPL-3.0-only')
options=('!debug' '!lto')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'gtk3' 'libglvnd' 'vulkan-icd-loader' 'wayland')
makedepends=('clang' 'git' 'pkgconf' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/boquila/boquilahub/archive/$_commit.tar.gz")
sha256sums=('e002d2b74880ae38c9a0cbfae266ef23a1cd86ba9069f203659f8bbdbc833ff4')

prepare() {
    cd "$pkgname-$_commit"

    # The upstream build script expects this directory and copies its shared
    # libraries into target/. Arch supplies the libraries from ffmpeg.
    mkdir -p deps
    rm -f deps/ffmpeg
    ln -s /usr deps/ffmpeg
}

build() {
    cd "$pkgname-$_commit"

    cargo build --release --locked

    # Do not ship copies of Arch's FFmpeg libraries in /usr/bin. The binary
    # keeps its $ORIGIN rpath for the ORT runtime bundled below.
    rm -f target/release/libav*.so* target/release/libsw*.so*
}

package() {
    cd "$pkgname-$_commit"

    install -Dm755 target/release/boquilahub "$pkgdir/usr/bin/boquilahub"
    while IFS= read -r library; do
        install -Dm755 "$library" "$pkgdir/usr/bin/$(basename "$library")"
    done < <(find target/release \( -type f -o -type l \) \( \
        -name 'libonnxruntime*.so*' -o -name 'libwebgpu_dawn.so*' \
    \))
    install -Dm644 assets/icon-256.png \
        "$pkgdir/usr/share/icons/hicolor/192x192/apps/boquilahub.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/boquilahub.desktop" <<'EOF'
[Desktop Entry]
Name=BoquilaHUB
Comment=Local AI-powered nature monitoring
Exec=boquilahub
Icon=boquilahub
Terminal=false
Type=Application
Categories=Science;Education;
EOF
}
