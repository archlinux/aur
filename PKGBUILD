# Maintainer: lubuoren <luboren123@outlook.com>

pkgname=wowtype
pkgver=0.3.10
pkgrel=1
_dataver=2026.10.31.2
_datafile="wowtype-data-rime-ice-$_dataver.tar.gz"
pkgdesc='WeType 风格的拼音输入法：fcitx5 插件 + Rust 引擎（长句、半成品输入、纠错、学习）'
arch=('x86_64')
url='https://github.com/Gloridust/WowType'
license=('MIT OR Apache-2.0' 'Apache-2.0' 'GPL-3.0-only' 'CC-BY-SA-4.0' 'Unicode-3.0')
depends=('fcitx5' 'alsa-lib' 'glibc' 'gcc-libs' 'python')
makedepends=('cargo' 'cmake' 'extra-cmake-modules' 'pkgconf' 'git')
optdepends=(
  'python-gobject: 设置界面 wowtype-config'
  'gtk4: 设置界面'
  'libadwaita: 设置界面'
  'noto-fonts-emoji: 候选里的彩色 emoji'
  'curl: 互译模式与首次使用离线语音时下载模型'
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
)
# The upstream data archive is flat, not a versioned top-level directory.
noextract=("$_datafile")
sha256sums=(
  'SKIP'
  'e3c031eae278d49b5bfa83dc8c3509a1f367c04f8d11e5f24625483249a3b534'
  '29df09b0e3a67ef2131393cf8203ae28b272ba8ac4ea1ecd2cc2d57f0f0d7616'
  '28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5'
  'e7a93b009565cfce55919a381437ac4db883e9da2126fa28b91d12732bc53d96'
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
  cargo build --frozen --release -p wowtype-core \
    --lib --bin wowtype-check --bin wowtype-show

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
  cargo test --frozen -p wowtype-core --lib
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" cmake --install build
  # The internal C ABI header is not a supported development package.
  rm -r "$pkgdir/usr/include/wowtype"
  rmdir "$pkgdir/usr/include"

  install -Dm755 target/release/wowtype-check "$pkgdir/usr/bin/wowtype-check"
  install -Dm755 target/release/wowtype-show "$pkgdir/usr/bin/wowtype-show"

  local data="$srcdir/data"
  install -Dm644 -t "$pkgdir/usr/share/wowtype" \
    "$data/lexicon.tsv" "$data/english.txt" "$data/words.lm"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$data/SOURCE.txt" "$pkgdir/usr/share/doc/$pkgname/DATA-SOURCE.txt"
  printf '%s\n' "$_dataver" >"$pkgdir/usr/share/doc/$pkgname/DATA-VERSION"

  # Preserve upstream licensing/attribution, including the embedded CLDR data.
  install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/README.md"
  install -Dm644 voice/src/wtlocal/NOTICE.md "$pkgdir/usr/share/licenses/$pkgname/NOTICE.voicekey.md"
  install -Dm644 "$data/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rime-ice"
  install -Dm644 "$data/SOURCE.txt" "$pkgdir/usr/share/licenses/$pkgname/DATA-SOURCE.txt"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$srcdir/CC-BY-SA-4.0.txt" "$srcdir/Unicode-3.0.txt"
}
