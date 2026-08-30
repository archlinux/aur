pkgname=codex-native-git
pkgver=r1.74cae2d
pkgrel=1
pkgdesc="Native Linux Codex desktop shell built with Rust, GTK, WebKitGTK, and Codex CLI"
arch=('x86_64')
url="https://github.com/Redminote11tech/Codex-Native"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'openssl')
optdepends=('codex: Codex CLI backend bridge for chat, auth, and runtime integration')
makedepends=('cargo' 'git' 'rust' 'unzip')
provides=('codex-native')
conflicts=('codex-native' 'codex-native-bin')
_codex_frontend_version=26.825.51511
_codex_frontend_artifact=ChatGPT-darwin-arm64
_codex_frontend_sha256='db727ef23e561fbd2b47f05fb0fece7dfe839fdb1a081e5a17d34a16a5a0d6c0'
source=(
  "codex-native::git+${url}.git"
  "${_codex_frontend_artifact}-${_codex_frontend_version}.zip::https://persistent.oaistatic.com/codex-app-prod/${_codex_frontend_artifact}-${_codex_frontend_version}.zip"
)
sha256sums=(
  'SKIP'
  "${_codex_frontend_sha256}"
)

pkgver() {
  cd "$srcdir/codex-native"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/codex-native"
  cargo build --release -p codex-native
}

package() {
  local extracted_root="$srcdir/codex-frontend"
  local asar_path
  local icon_path

  cd "$srcdir/codex-native"

  rm -rf "$extracted_root"
  asar_path="$(find "$srcdir" -path '*/Contents/Resources/app.asar' -type f | sort | head -n 1)"
  if [[ -z "$asar_path" ]]; then
    echo "failed to locate app.asar in upstream frontend bundle" >&2
    return 1
  fi

  ./target/release/codex-native extract-asar "$asar_path" "$extracted_root"

  install -Dm755 ./target/release/codex-native "$pkgdir/usr/bin/codex-native"
  install -Dm755 ./packaging/aur/codex-native-launcher "$pkgdir/usr/bin/codex-native-launcher"
  install -Dm644 ./packaging/aur/codex-native.desktop \
    "$pkgdir/usr/share/applications/codex-native.desktop"
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/codex-native"
  cp -a "$extracted_root/webview" "$pkgdir/usr/share/codex-native/"

  icon_path="$(find "$extracted_root/webview/assets" -maxdepth 1 -type f -name 'app-*.png' | sort | head -n 1)"
  if [[ -z "$icon_path" ]]; then
    echo "failed to locate Codex icon asset in extracted webview" >&2
    return 1
  fi

  install -Dm644 "$icon_path" "$pkgdir/usr/share/pixmaps/codex-native.png"
}
