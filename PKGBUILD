# Maintainer: Brian

_gitname=openbubbles-app
pkgname=openbubbles-app-git
pkgver=1.15.0.227
pkgrel=1
pkgdesc="OpenBubbles messaging app (iMessage client, built from git)"
arch=('x86_64')
url="https://github.com/OpenBubbles/openbubbles-app"
license=('Apache-2.0')
depends=(
  'gtk3'
  'libsecret'
  'libnotify'
  'libayatana-appindicator'
  'webkit2gtk-4.1'
  'mpv'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'rust'
  'clang'
  'cmake'
  'ninja'
  'pkgconf'
  'protobuf'
  'unzip'
  'curl'
)
provides=('openbubbles-app')
conflicts=('openbubbles-app' 'openbubbles-app-bin')
options=('!strip' '!debug')

_flutterver=3.24.0
_fluttersum=d52a5d12f17d8bcf868d1ccc01fe0f7ffb05b53d9628aa21b07a18f9d33621f2

source=(
  "$_gitname::git+https://github.com/OpenBubbles/openbubbles-app.git#branch=rustpush"
  "rustpush::git+https://github.com/OpenBubbles/rustpush.git"
  "telephony_plus::git+https://github.com/OpenBubbles/telephony_plus.git"
  "flutter-${_flutterver}.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutterver}-stable.tar.xz"
  "openbubbles.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
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
  git submodule init
  git config submodule.rustpush.url "$srcdir/rustpush"
  git config submodule.telephony_plus.url "$srcdir/telephony_plus"
  git -c protocol.file.allow=always submodule update --recursive
}

build() {
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
