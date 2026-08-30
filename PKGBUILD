pkgname=codex-native-bin
pkgver=r131.74cae2d
pkgrel=1
pkgdesc="Native Linux Codex desktop shell built with Rust, GTK, WebKitGTK, and Codex CLI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Redminote11tech/Codex-Native"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'openssl')
optdepends=('codex: Codex CLI backend bridge for chat, auth, and runtime integration')
provides=('codex-native')
conflicts=('codex-native' 'codex-native-git')
_codex_frontend_version=26.818.41705
_codex_frontend_artifact=ChatGPT-darwin-arm64
_codex_frontend_sha256='522536a3ee61f404c24d462443dd131f4b0ebb74b77a33ea50d8d2354b386eff'
_release_tag=r131.74cae2d
_release_asset_sha256='28a92dd062531ab2473139188f2f3d60b21def22ca4150a99eec165ee1c800ab'
source=(
  "codex-native-${_release_tag}-linux-x86_64.tar.gz::https://github.com/Redminote11tech/Codex-Native/releases/download/${_release_tag}/codex-native-${_release_tag}-linux-x86_64.tar.gz"
  "${_codex_frontend_artifact}-${_codex_frontend_version}.zip::https://persistent.oaistatic.com/codex-app-prod/${_codex_frontend_artifact}-${_codex_frontend_version}.zip"
)
sha256sums=(
  "${_release_asset_sha256}"
  "${_codex_frontend_sha256}"
)

package() {
  local extracted_root="$srcdir/codex-frontend"
  local asar_path
  local icon_path

  rm -rf "$extracted_root"
  asar_path="$(find "$srcdir" -path '*/Contents/Resources/app.asar' -type f | sort | head -n 1)"
  if [[ -z "$asar_path" ]]; then
    echo "failed to locate app.asar in upstream frontend bundle" >&2
    return 1
  fi

  ./codex-native extract-asar "$asar_path" "$extracted_root"

  install -Dm755 "$srcdir/codex-native" "$pkgdir/usr/bin/codex-native"
  install -Dm755 "$startdir/codex-native-launcher" "$pkgdir/usr/bin/codex-native-launcher"
  install -Dm644 "$startdir/codex-native.desktop" \
    "$pkgdir/usr/share/applications/codex-native.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/codex-native"
  cp -a "$extracted_root/webview" "$pkgdir/usr/share/codex-native/"

  icon_path="$(find "$extracted_root/webview/assets" -maxdepth 1 -type f -name 'app-*.png' | sort | head -n 1)"
  if [[ -z "$icon_path" ]]; then
    echo "failed to locate Codex icon asset in extracted webview" >&2
    return 1
  fi

  install -Dm644 "$icon_path" "$pkgdir/usr/share/pixmaps/codex-native.png"
}
