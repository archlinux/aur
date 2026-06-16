# Maintainer: Brian

_gitname=openbubbles-app
pkgname=openbubbles-app-git
pkgver=1.15.0.227
pkgrel=2
pkgdesc="OpenBubbles messaging app (iMessage client, built from git)"
arch=('x86_64')
url="https://github.com/OpenBubbles/openbubbles-app"
license=('Apache-2.0')
depends=(
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libnotify'
  'libsecret'
  'mpv'
  'webkit2gtk-4.1'
)
makedepends=(
  'clang'
  'cmake'
  'curl'
  'git'
  'ninja'
  'pkgconf'
  'protobuf'
  'rust'
  'unzip'
)
provides=('openbubbles-app')
conflicts=('openbubbles-app' 'openbubbles-app-bin')
# !lto: rustpush links vendored openssl/ring, whose CPUID symbols live in asm that LTO drops
options=('!strip' '!debug' '!lto')

_flutterver=3.24.0
_fluttersum=d52a5d12f17d8bcf868d1ccc01fe0f7ffb05b53d9628aa21b07a18f9d33621f2

source=(
  "$_gitname::git+https://github.com/OpenBubbles/openbubbles-app.git#branch=rustpush"
  "flutter-${_flutterver}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutterver}-stable.tar.xz"
  "openbubbles.desktop"
)
sha256sums=(
  'SKIP'
  "$_fluttersum"
  '57b3eec669f620ec6259a3e98669b80bd82f8a7a7b1cbf8f53301e0c2f4d457b'
)

pkgver() {
  cd "$srcdir/$_gitname"
  local _ver
  _ver="$(awk '/^version:/{print $2; exit}' pubspec.yaml | tr '+' '.')"
  printf '%s.r%s.g%s' "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  export GIT_CONFIG_GLOBAL="$srcdir/.gitconfig"
  git config --global url."https://github.com/".insteadOf "git@github.com:"
  git submodule update --init --recursive

  # upstream CI copies the legacy fairplay cert to each numbered key id the source embeds
  install -d rustpush/certs/fairplay
  grep -oP 'include_cert!\("\K[^"]+' rustpush/src/activation.rs | while read -r _n; do
    cp rustpush/certs/legacy-fairplay/fairplay.crt "rustpush/certs/fairplay/$_n.crt"
    cp rustpush/certs/legacy-fairplay/fairplay.pem "rustpush/certs/fairplay/$_n.pem"
  done

  # relax the flutter template's -Werror; newer system libs (libayatana-appindicator)
  # emit deprecation warnings that would otherwise abort the plugin builds
  sed -i 's/-Wall -Werror/-Wall/' linux/CMakeLists.txt
}

build() {
  export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
  export HOME="$srcdir/.home"
  export PUB_CACHE="$srcdir/.pub-cache"
  export CARGO_HOME="$srcdir/.cargo"
  export GIT_CONFIG_GLOBAL="$srcdir/.gitconfig"
  export PATH="$srcdir/flutter/bin:$srcdir/flutter/bin/cache/dart-sdk/bin:$PATH"
  mkdir -p "$HOME"

  git config --global --add safe.directory '*'

  flutter config --no-analytics --enable-linux-desktop >/dev/null
  flutter --version

  cd "$srcdir/$_gitname"
  flutter pub get
  flutter build linux --release
}

package() {
  cd "$srcdir/$_gitname"
  local _bundle="build/linux/x64/release/bundle"

  install -dm755 "$pkgdir/usr/lib/openbubbles-app"
  cp -a "$_bundle/." "$pkgdir/usr/lib/openbubbles-app/"

  if [[ ! -e "$pkgdir/usr/lib/openbubbles-app/lib/libmpv.so.1" ]]; then
    ln -s /usr/lib/libmpv.so.2 "$pkgdir/usr/lib/openbubbles-app/lib/libmpv.so.1"
  fi

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/openbubbles" <<'EOF'
#!/bin/bash
APPDIR="/usr/lib/openbubbles-app"
export LD_LIBRARY_PATH="$APPDIR/lib:$APPDIR:${LD_LIBRARY_PATH}"
exec "$APPDIR/bluebubbles" "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/openbubbles"

  install -Dm644 "$srcdir/openbubbles.desktop" \
    "$pkgdir/usr/share/applications/openbubbles.desktop"
  install -Dm644 "$_bundle/data/flutter_assets/assets/icon/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/openbubbles.png"
}
