# Maintainer: Jacob Burgess
pkgname=eddie
pkgver=0.3.1
pkgrel=1
# Commits on master at the tag, so Eddie can tell a newer build from this
# one. The release workflow sets it.
_build=201
pkgdesc="The editor that watches the footage for you: a native Rust video editor that AI agents can drive"
arch=('x86_64')
url="https://github.com/BurgessTG/eddie"
license=('MIT OR Apache-2.0' 'OFL-1.1')
depends=('ffmpeg' 'gtk3' 'glib2' 'alsa-lib' 'fontconfig' 'libgcc' 'libstdc++'
         'glibc' 'libxkbcommon' 'wayland' 'libx11' 'vulkan-icd-loader'
         'hicolor-icon-theme')
makedepends=('cargo' 'clang' 'cmake' 'pkgconf'
             'vulkan-headers' 'shaderc')
optdepends=('inter-font: the interface font Eddie is designed with'
            'libva-nvidia-driver: hardware decode on NVIDIA (Settings, off by default)'
            'xdg-utils: Open folder after an export')
conflicts=('eddie-git')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# v0.2.0 is not tagged yet. `updpkgsums` fills this in when it is
# (packaging/README.md).
sha256sums=('f6f98b77646fd8677782dc18f4a2e775dacf517b2e0c85530d9d3ba07231217a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Keep build paths out of the binary (makepkg flags this).
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
  # whisper.cpp and QuickJS embed __FILE__ paths.
  export CFLAGS="${CFLAGS:-} -ffile-prefix-map=$srcdir=/build"
  export CXXFLAGS="${CXXFLAGS:-} -ffile-prefix-map=$srcdir=/build"
  export EDDIE_BUILD="$_build"
  # Local transcription on any Vulkan GPU; it runs on the CPU where there
  # is none. whisper.cpp's shaders need glslc (shaderc) to build.
  cargo build --frozen --release -p openreel-app --bin eddie --features vulkan
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/eddie "$pkgdir/usr/bin/eddie"
  install -Dm644 packaging/eddie.desktop "$pkgdir/usr/share/applications/eddie.desktop"
  # Lets a file manager open a .eddie project in Eddie.
  install -Dm644 packaging/eddie.xml "$pkgdir/usr/share/mime/packages/eddie.xml"
  for size in 256 512; do
    install -Dm644 "packaging/eddie-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/eddie.png"
  done
  # `eddie help` and the README send agents to docs/agents.md.
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/agents.md "$pkgdir/usr/share/doc/$pkgname/agents.md"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  # The built-in stickers are Microsoft's Fluent Emoji (MIT).
  install -Dm644 crates/media/src/graphic/stickers/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-fluent-emoji"
  # The fonts titles are drawn in are under the SIL Open Font License.
  for font in crates/media/src/fonts/licenses/*.txt; do
    install -Dm644 "$font" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$font")"
  done
}
