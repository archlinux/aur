# Maintainer: lubuoren <luboren123@outlook.com>

pkgname=wowtype
pkgver=0.7.14
pkgrel=1
_dataver=2026.11.11.8
_datafile="wowtype-data-rime-ice-$_dataver.tar.gz"
pkgdesc='WeType 风格的拼音输入法：fcitx5 插件 + Rust 引擎（长句、半成品输入、纠错、学习）'
arch=('x86_64')
url='https://github.com/Gloridust/WowType'
license=('MIT OR Apache-2.0' 'Apache-2.0' 'GPL-3.0-only' 'CC-BY-SA-4.0' 'Unicode-3.0' 'LGPL-3.0-only' 'LicenseRef-CC-BY-2.0-FR')
depends=('fcitx5' 'alsa-lib' 'glibc' 'gcc-libs' 'python')
makedepends=('cargo' 'cmake' 'extra-cmake-modules' 'pkgconf' 'git')
optdepends=(
  'fcitx5-gtk: GTK 应用输入法模块'
  'fcitx5-qt: Qt 应用输入法模块'
  'python-gobject: 设置界面 wowtype-config'
  'python-cairo: 打字统计图表'
  'gtk4: 设置界面'
  'libadwaita: 设置界面'
  'noto-fonts-emoji: 候选里的彩色 emoji'
  'curl: 互译模式、跨设备复制粘贴的自建中转，以及首次使用离线语音时下载模型'
  'unzip: 解压离线语音模型'
)
# Mixed Rust/C++ linking: do not pass GCC LTO objects to the Rust toolchain.
options=('!lto')
install="$pkgname.install"
source=(
  "$pkgname::git+$url.git#tag=v$pkgver"
  "$_datafile::$url/releases/download/v$pkgver/$_datafile"
  'wowtype-config-pacman.patch'
  'CC-BY-SA-4.0.txt::https://creativecommons.org/licenses/by-sa/4.0/legalcode.txt'
  'Unicode-3.0.txt::https://www.unicode.org/license.txt'
  'CC-BY-2.0-FR.html::https://raw.githubusercontent.com/creativecommons/cc-legal-tools-data/01b53042d4c6a13134d72c4d6138c30759f5cb17/docs/licenses/by/2.0/fr/legalcode.fr.html'
)
# The upstream data archive is flat, not a versioned top-level directory.
noextract=("$_datafile")
# creativecommons.org serves the BY 2.0 FR legal code with a rotating promo banner, so the
# licence is pinned to the exact commit of the official CC legal-tools-data repository.
sha256sums=(
  'SKIP'
  'b85d7c67de796d5f2d8dfacd75cea6e2d6d53c3352aa2e990b9aaa4a71055640'
  '20dc3a5c30e74fdc77aedc7de3b2e977610118f7abf3443e32c9deab4343daa6'
  '28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5'
  'e7a93b009565cfce55919a381437ac4db883e9da2126fa28b91d12732bc53d96'
  '597d4c64f6606c64da65ba6c079e5cc87e4cce2b5187eda908c939b538e7ab9b'
)

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "$srcdir/wowtype-config-pacman.patch"

  mkdir -p "$srcdir/data"
  tar -xzf "$srcdir/$_datafile" -C "$srcdir/data"

  # Arch Rust package guidelines explicitly recommend fetching in prepare().
  # Cargo verifies the registry packages against upstream Cargo.lock.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/$pkgname/target"
  # wowtype-sync is the pairing CLI for the cross-device clipboard; the fcitx5 plugin and
  # the settings app both shell out to it, so the source package has to ship it.
  cargo build --frozen --release -p wowtype-core \
    --lib --bin wowtype-check --bin wowtype-show --bin wowtype-sync

  cmake -S fcitx5-addon -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWOWTYPE_CORE_STATIC=ON \
    -DWOWTYPE_VOICE=ON \
    -DWOWTYPE_VERSION="$pkgver"
  cmake --build build
}

check() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/$pkgname/target"
  WOWTYPE_WUBI="$srcdir/data/wubi86.tsv" \
    cargo test --frozen --release -p wowtype-core --lib \
      --test combinations --test session --test session_keys
  cargo test --frozen --release -p wowtype-voice --lib --test pipeline
  # Cross-device clipboard core: the relay tests skip themselves when node/curl or the
  # Cloudflare Worker sources are missing, which is not a failure.
  cargo test --frozen --release -p wowtype-sync --lib
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" cmake --install build
  # The internal C ABI header is not a supported development package.
  rm -r "$pkgdir/usr/include/wowtype"
  rmdir "$pkgdir/usr/include"

  install -Dm755 target/release/wowtype-check "$pkgdir/usr/bin/wowtype-check"
  install -Dm755 target/release/wowtype-show "$pkgdir/usr/bin/wowtype-show"
  install -Dm755 target/release/wowtype-sync "$pkgdir/usr/bin/wowtype-sync"

  local data="$srcdir/data"
  install -Dm644 -t "$pkgdir/usr/share/wowtype" \
    "$data/lexicon.tsv" "$data/english.txt" "$data/words.lm" "$data/wubi86.tsv" \
    "$data/nnlm.bin" "$data/DATA-MANIFEST"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$data/SOURCE.txt" "$pkgdir/usr/share/doc/$pkgname/DATA-SOURCE.txt"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    "$data/WUBI-SOURCE.txt" "$data/WUBI-AUTHORS"
  printf '%s\n' "$_dataver" >"$pkgdir/usr/share/doc/$pkgname/DATA-VERSION"

  # Preserve upstream licensing/attribution, including the embedded CLDR data.
  install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/README.md"
  install -Dm644 voice/src/wtlocal/NOTICE.md "$pkgdir/usr/share/licenses/$pkgname/NOTICE.voicekey.md"
  install -Dm644 "$data/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rime-ice"
  install -Dm644 "$data/SOURCE.txt" "$pkgdir/usr/share/licenses/$pkgname/DATA-SOURCE.txt"
  install -Dm644 "$data/WUBI-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rime-wubi"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$data/WUBI-SOURCE.txt" "$data/WUBI-AUTHORS" core/data/OPENCC-LICENSE
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$srcdir/CC-BY-SA-4.0.txt" "$srcdir/Unicode-3.0.txt" "$srcdir/CC-BY-2.0-FR.html"
}
