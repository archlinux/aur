# Maintainer: Snoopey
pkgname=meetily-openblas
pkgver=0.4.1
pkgrel=2
pkgdesc='Local meeting transcription and summaries (OpenBLAS CPU build)'
arch=('x86_64')
url='https://github.com/Zackriya-Solutions/meetily'
license=('MIT' 'OFL-1.1')
depends=('glibc' 'libgcc' 'libstdc++' 'libgomp' 'dbus' 'cairo' 'hicolor-icon-theme'
         'glib2' 'gdk-pixbuf2' 'xz' 'libsoup3' 'xdg-utils' 'alsa-lib' 'ffmpeg' 'gtk3' 'libappindicator-gtk3' 'openssl' 'webkit2gtk-4.1' 'openblas')
makedepends=('clang' 'cmake' 'git' 'nodejs>=20' 'pnpm' 'rust' 'python')
provides=("meetily=$pkgver")
conflicts=('meetily')
optdepends=('ollama: local Ollama model provider')
options=('!lto' '!debug')
source=("meetily-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'arch.patch' 'meetily.desktop'
        'SourceSans3VF-Upright.ttf::https://raw.githubusercontent.com/adobe-fonts/source-sans/3.052R/VF/SourceSans3VF-Upright.ttf'
        'source-sans-LICENSE.md::https://raw.githubusercontent.com/adobe-fonts/source-sans/3.052R/LICENSE.md'
        'onnxruntime-1.22.0-x86_64.tgz::https://cdn.pyke.io/0/pyke:ort-rs/ms@1.22.0/x86_64-unknown-linux-gnu.tgz')
sha256sums=('66f06a1c4b60334d1c6d62c5f97bc5e847df33e98240ef125be01bacb7274b88'
            '47f7a3f53dcb7b6380871c319d9db7de74642108f082469affe5fbbf0c887f63' '5e7e443ebafc9c2cdedede09c6cbe6be646358b52954151753c58ddb8e332016'
            '1147db9a3f0edd4956068de77930148acce2742dd76d57f7239b2b1c687ac63f'
            '89ad2c4f66dd29127527493e729c31e731f111cf10faf5774c3db9275ed0c22c'
            'ed1716de95974bf47ab0223ca33734a0b5a5d09a181225d0e8ed62d070aea893')
_features=(--features openblas)
_helper_features=()

prepare() {
  cd "meetily-$pkgver"
  patch -Np1 -i "$srcdir/arch.patch"
  install -Dm644 "$srcdir/SourceSans3VF-Upright.ttf" frontend/src/app/fonts/SourceSans3VF-Upright.ttf
  # Keep Git and other build tools inside the package sandbox.
  export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
  export HOME="$srcdir/.home" XDG_CONFIG_HOME="$srcdir/.config"
  install -dm700 "$HOME" "$XDG_CONFIG_HOME"
  export XDG_CACHE_HOME="$srcdir/.cache" npm_config_cache="$srcdir/.cache/npm"
  export PNPM_HOME="$srcdir/.pnpm-home" CARGO_HOME="$srcdir/.cargo"
  export XDG_RUNTIME_DIR="$srcdir/.runtime"
  install -dm700 "$XDG_RUNTIME_DIR"
  # pnpm 12 reads overrides from the workspace file instead of package.json.
  python -c 'import json; p=json.load(open("frontend/package.json")); json.dump(p["pnpm"], open("frontend/pnpm-workspace.yaml", "w"))'
  pnpm --dir frontend install --frozen-lockfile --store-dir "$srcdir/.pnpm-store"
  cargo fetch --locked
  # Use Arch's maintained FFmpeg instead of downloading an untracked binary.
  install -dm755 frontend/src-tauri/binaries
  ln -sf /usr/bin/ffmpeg frontend/src-tauri/binaries/ffmpeg-x86_64-unknown-linux-gnu
}

build() {
  cd "meetily-$pkgver"
  # Keep Git and other build tools inside the package sandbox.
  export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
  export HOME="$srcdir/.home" XDG_CONFIG_HOME="$srcdir/.config"
  install -dm700 "$HOME" "$XDG_CONFIG_HOME"
  export XDG_CACHE_HOME="$srcdir/.cache" npm_config_cache="$srcdir/.cache/npm"
  export PNPM_HOME="$srcdir/.pnpm-home" CARGO_HOME="$srcdir/.cargo"
  export XDG_RUNTIME_DIR="$srcdir/.runtime"
  export NEXT_TELEMETRY_DISABLED=1 NEXT_PUBLIC_DISABLE_UPDATER=1
  # Use the bindings shipped with this Whisper version on newer Clang releases.
  export WHISPER_DONT_GENERATE_BINDINGS=1
  export CMAKE_POSITION_INDEPENDENT_CODE=ON
  # Fetch and verify the pinned ONNX library through makepkg, before compilation.
  export ORT_LIB_LOCATION="$srcdir/onnxruntime/lib"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --locked --release -p llama-helper "${_helper_features[@]}"
  install -m755 "$CARGO_TARGET_DIR/release/llama-helper" frontend/src-tauri/binaries/llama-helper-x86_64-unknown-linux-gnu
  cd frontend
  pnpm exec tauri build --no-bundle "${_features[@]}" -- --locked
}

check() {
  test -x "$srcdir/target/release/meetily"
  python - "$srcdir/target/release/llama-helper" <<'PY'
import json
import subprocess
import sys
result = subprocess.run([sys.argv[1]], input='{"type":"ping"}\n{"type":"shutdown"}\n',
                        text=True, capture_output=True, timeout=30, check=True)
assert [json.loads(line)['type'] for line in result.stdout.splitlines()] == ['pong', 'goodbye'], result.stdout
PY
}

package() {
  install -Dm755 "$srcdir/target/release/meetily" "$pkgdir/usr/lib/meetily/meetily"
  install -Dm755 "$srcdir/target/release/llama-helper" "$pkgdir/usr/lib/meetily/llama-helper"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/meetily/meetily "$pkgdir/usr/bin/meetily"
  install -Dm644 meetily.desktop "$pkgdir/usr/share/applications/meetily.desktop"
  install -Dm644 "meetily-$pkgver/frontend/src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/meetily.png"
  install -Dm644 "meetily-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "meetily-$pkgver/frontend/src-tauri/templates/"*.json -t "$pkgdir/usr/share/meetily/templates/"
  install -Dm644 "$srcdir/source-sans-LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/source-sans-LICENSE.md"
  ln -s ../../share/meetily/templates "$pkgdir/usr/lib/meetily/templates"
}
